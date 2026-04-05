// xSound Audio Filter System
// Web Audio API ile gerçek filtre desteği

class AudioFilterManager {
    constructor() {
        this.audioContext = null;
        this.soundFilters = {}; // soundId -> {source, filters, gainNode}
    }

    // Audio Context oluştur
    getAudioContext() {
        if (!this.audioContext) {
            this.audioContext = new (window.AudioContext || window.webkitAudioContext)();
        }
        return this.audioContext;
    }

    // Ses için filtre chain'i oluştur
    initializeFilters(soundId, howlInstance) {
        if (!howlInstance || this.soundFilters[soundId]) return;

        try {
            const ctx = this.getAudioContext();
            
            // Howler'ın internal node'unu al
            const howlerNode = howlInstance._sounds[0]._node;
            if (!howlerNode) return;

            // Source node oluştur
            const source = ctx.createMediaElementSource(howlerNode);
            
            // Gain node (volume kontrolü)
            const gainNode = ctx.createGain();
            
            // Filter chain
            this.soundFilters[soundId] = {
                source: source,
                gainNode: gainNode,
                filters: {},
                connected: false
            };

            // Başlangıçta sadece gain node'u bağla
            source.connect(gainNode);
            gainNode.connect(ctx.destination);
            this.soundFilters[soundId].connected = true;

            console.log('[xSound Filters] Initialized for:', soundId);
        } catch (error) {
            console.error('[xSound Filters] Init error:', error);
        }
    }

    // Filtre ekle/güncelle
    setFilter(soundId, filterType, frequency, Q, gain) {
        const filterData = this.soundFilters[soundId];
        if (!filterData) {
            console.warn('[xSound Filters] Sound not initialized:', soundId);
            return;
        }

        try {
            const ctx = this.getAudioContext();
            const filterId = filterType + '_' + soundId;

            // Eski filtreyi kaldır
            if (filterData.filters[filterId]) {
                this.removeFilter(soundId, filterType);
            }

            // Yeni filtre oluştur
            const filter = ctx.createBiquadFilter();
            filter.type = filterType; // lowpass, highpass, bandpass, etc.
            filter.frequency.value = frequency;
            filter.Q.value = Q;
            filter.gain.value = gain;

            // Chain'i yeniden bağla
            this.reconnectChain(soundId, filterId, filter);

            console.log(`[xSound Filters] Applied ${filterType}: freq=${frequency}Hz, Q=${Q}, gain=${gain}dB`);
        } catch (error) {
            console.error('[xSound Filters] Set filter error:', error);
        }
    }

    // Filter chain'i yeniden bağla
    reconnectChain(soundId, filterId, newFilter) {
        const filterData = this.soundFilters[soundId];
        if (!filterData) return;

        // Tüm bağlantıları kes
        filterData.source.disconnect();
        Object.values(filterData.filters).forEach(f => f.disconnect());
        filterData.gainNode.disconnect();

        // Yeni filtreyi ekle
        filterData.filters[filterId] = newFilter;

        // Chain'i yeniden oluştur: source -> filters -> gain -> destination
        let currentNode = filterData.source;
        
        for (const filter of Object.values(filterData.filters)) {
            currentNode.connect(filter);
            currentNode = filter;
        }

        currentNode.connect(filterData.gainNode);
        filterData.gainNode.connect(this.getAudioContext().destination);
    }

    // Filtreyi kaldır
    removeFilter(soundId, filterType) {
        const filterData = this.soundFilters[soundId];
        if (!filterData) return;

        const filterId = filterType + '_' + soundId;
        const filter = filterData.filters[filterId];
        
        if (filter) {
            // Filtreyi sil
            delete filterData.filters[filterId];

            // Chain'i yeniden bağla
            filterData.source.disconnect();
            Object.values(filterData.filters).forEach(f => f.disconnect());
            filterData.gainNode.disconnect();

            let currentNode = filterData.source;
            
            for (const f of Object.values(filterData.filters)) {
                currentNode.connect(f);
                currentNode = f;
            }

            currentNode.connect(filterData.gainNode);
            filterData.gainNode.connect(this.getAudioContext().destination);

            console.log(`[xSound Filters] Removed ${filterType} from ${soundId}`);
        }
    }

    // Tüm filtreleri temizle
    clearAllFilters(soundId) {
        const filterData = this.soundFilters[soundId];
        if (!filterData) return;

        // Tüm filtreleri sil
        filterData.filters = {};

        // Sadece source -> gain -> destination
        filterData.source.disconnect();
        filterData.gainNode.disconnect();
        
        filterData.source.connect(filterData.gainNode);
        filterData.gainNode.connect(this.getAudioContext().destination);

        console.log(`[xSound Filters] Cleared all filters from ${soundId}`);
    }

    // Ses silindiğinde temizlik
    cleanup(soundId) {
        const filterData = this.soundFilters[soundId];
        if (!filterData) return;

        try {
            filterData.source.disconnect();
            Object.values(filterData.filters).forEach(f => f.disconnect());
            filterData.gainNode.disconnect();
            delete this.soundFilters[soundId];
            console.log(`[xSound Filters] Cleaned up ${soundId}`);
        } catch (error) {
            console.error('[xSound Filters] Cleanup error:', error);
        }
    }
}

// Global instance
window.audioFilterManager = new AudioFilterManager();
