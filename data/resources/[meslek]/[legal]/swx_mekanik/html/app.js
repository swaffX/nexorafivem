const { createApp } = Vue;

createApp({
    data() {
        return {
            isOpen: false,
            vehicleName: '',
            parts: [],
            damage: {},
            selectedParts: [],
            targetId: -1,
            vehicleNet: 0,
        };
    },

    computed: {
        total() {
            return this.selectedParts.reduce((sum, p) => sum + Number(p.price), 0);
        }
    },

    mounted() {
        window.addEventListener('message', (e) => {
            const d = e.data;
            if (d.action === 'open') {
                this.vehicleName   = d.vehicleName || 'Bilinmiyor';
                this.parts         = d.parts || [];
                this.damage        = d.damage || {};
                this.targetId      = d.targetId ?? -1;
                this.vehicleNet    = d.vehicleNet || 0;
                this.selectedParts = [];
                this.isOpen        = true;
            } else if (d.action === 'close') {
                this.isOpen = false;
            }
        });

        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && this.isOpen) this.closeUI();
        });
    },

    methods: {
        isSelected(id) {
            return this.selectedParts.some(p => p.id === id);
        },

        getSelectedPrice(id) {
            const p = this.selectedParts.find(p => p.id === id);
            return p ? p.price : 0;
        },

        getDamage(id) {
            return this.damage[id] || 0;
        },

        togglePart(part) {
            const idx = this.selectedParts.findIndex(p => p.id === part.id);
            if (idx > -1) {
                this.selectedParts.splice(idx, 1);
            } else {
                this.selectedParts.push({ id: part.id, label: part.label, price: part.price });
            }
        },

        updatePrice(id, event) {
            const p = this.selectedParts.find(p => p.id === id);
            if (p) p.price = Number(event.target.value) || 0;
        },

        sendFis() {
            if (this.selectedParts.length === 0 || this.targetId === -1) return;

            fetch(`https://${GetParentResourceName()}/sendFis`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    targetId:   this.targetId,
                    parts:      this.selectedParts,
                    total:      this.total,
                    vehicleNet: this.vehicleNet,
                })
            }).catch(() => {});

            this.isOpen = false;
        },

        closeUI() {
            this.isOpen = false;
            fetch(`https://${GetParentResourceName()}/close`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({})
            }).catch(() => {});
        }
    }
}).mount('#app');

if (typeof GetParentResourceName === 'undefined') {
    window.GetParentResourceName = () => 'swx_mekanik';
}
