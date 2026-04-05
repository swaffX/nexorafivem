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

    // Ses için filtre chain'i oluştur (Düzeltilmiş - Better initialization)
    initializeFilters(soundId, howlInstance) {
        if (!howlInstance || this.soundFilters[soundId]) return false;

        try {
            const ctx = this.getAudioContext();
            
            // Howler'ın internal node'unu al
            const sounds = howlInstance._sounds;
            if (!sounds || sounds.length === 0) {
                console.warn('[xSound Filters] ❌ No sounds array found for:', soundId);
                return false;
            }
            
            const howlerNode = sounds[0]._node;
            if (!howlerNode) {
                console.warn('[xSound Filters] ❌ No audio node found yet for:', soundId);
                console.warn('[xSound Filters] ℹ️  Sound may not be fully loaded. Retrying may help.');
                return false;
            }

            // Check if node is already connected to prevent double-wiring
            if (this.soundFilters[soundId] && this.soundFilters[soundId].source) {
                console.warn('[xSound Filters] ⚠️  Filters already initialized for:', soundId);
                return false;
            }

            // Source node oluştur
            const source = ctx.createMediaElementSource(howlerNode);
            
            // Gain node (volume kontrolü)
            const gainNode = ctx.createGain();
            gainNode.gain.value = 1.0; // Full volume by default
            
            // Filter chain
            this.soundFilters[soundId] = {
                source: source,
                gainNode: gainNode,
                filters: {},
                connected: false
            };

            // Başlangıçta sadece gain node'u bağla
            // IMPORTANT: Connect directly to destination, not through other nodes
            source.connect(gainNode);
            gainNode.connect(ctx.destination);
            this.soundFilters[soundId].connected = true;

            console.log('[xSound Filters] ✅ Filter chain initialized for:', soundId);
            console.log('[xSound Filters] ℹ️  Audio path: Source → GainNode → Destination');
            console.log('[xSound Filters] ℹ️  Filters will be inserted between Source and GainNode');
            
            return true;
        } catch (error) {
            console.error('[xSound Filters] ❌ Initialization error:', error);
            console.error('[xSound Filters] Stack trace:', error.stack);
            return false;
        }
    }

    // Filtre ekle/güncelle (Düzeltilmiş - Bass Boost için optimize)
    setFilter(soundId, filterType, frequency, Q, gain) {
        const filterData = this.soundFilters[soundId];
        if (!filterData) {
            console.warn('[xSound Filters] ❌ Sound not initialized:', soundId);
            console.warn('[xSound Filters] ℹ️  Filter may not work if sound just started playing. Wait 1-2 seconds and try again.');
            return false;
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
            filter.type = filterType; // lowpass, highpass, bandpass, lowshelf, highshelf, peaking, notch, allpass
            filter.frequency.value = frequency;
            filter.Q.value = Q;
            filter.gain.value = gain; // Gain in dB (-40 to +40)

            // Bass filter'ları için özel log ve validation
            if (filterType === 'lowshelf' || filterType === 'peaking') {
                console.log(`[xSound Filters] 🎵 BASS FILTER: ${filterType.toUpperCase()}`);
                console.log(`  ├─ Frequency: ${frequency} Hz`);
                console.log(`  ├─ Gain: ${gain} dB`);
                console.log(`  ├─ Q: ${Q}`);
                console.log(`  └─ Expected effect: ${gain > 0 ? '🔊 BOOST (enhanced bass)' : '🔇 CUT (reduced bass)'}`);
                
                // Bass boost validation
                if (filterType === 'lowshelf' && gain > 15) {
                    console.warn('[xSound Filters] ⚠️  High bass boost detected. May cause distortion. Consider reducing gain to +10 to +15 dB.');
                }
            } else {
                console.log(`[xSound Filters] Applied ${filterType}: freq=${frequency}Hz, Q=${Q}, gain=${gain}dB`);
            }

            // Chain'i yeniden bağla (doğru sırada)
            this.reconnectChain(soundId, filterId, filter);
            
            // AudioContext'i resume et (bazı tarayıcılarda suspend state'te kalabilir)
            if (ctx.state === 'suspended') {
                ctx.resume().then(() => {
                    console.log('[xSound Filters] ✅ AudioContext resumed');
                });
            }
            
            return true;
        } catch (error) {
            console.error('[xSound Filters] ❌ Set filter error:', error);
            console.error('[xSound Filters] Stack trace:', error.stack);
            return false;
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
