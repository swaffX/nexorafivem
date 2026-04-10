// NEXORA RENT - Vue.js Application
const { createApp } = Vue;

createApp({
    data() {
        return {
            isOpen: false,
            vehicles: [],
            selectedVehicle: null,
            isRenting: false
        };
    },

    mounted() {
        // Lua'dan gelen mesajları dinle
        window.addEventListener('message', (event) => {
            const data = event.data;

            switch (data.action) {
                case 'open':
                    this.openGUI(data.vehicles);
                    break;
                case 'close':
                    this.closeGUI();
                    break;
            }
        });

        // ESC tuşu ile kapatma
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && this.isOpen) {
                this.closeGUI();
            }
        });
    },

    methods: {
        openGUI(vehicles) {
            this.vehicles = vehicles || [];
            this.isOpen = true;
            this.selectedVehicle = null;
            this.isRenting = false;
        },

        async closeGUI() {
            this.isOpen = false;
            // Lua'ya bildir ve callback bekle
            try {
                await fetch(`https://${GetParentResourceName()}/close`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json; charset=UTF-8'
                    },
                    body: JSON.stringify({})
                });
            } catch (e) {
                console.error('Close error:', e);
            }
        },

        selectVehicle(vehicle) {
            this.selectedVehicle = vehicle;
            
            // Ses efekti (opsiyonel)
            this.playSound('select');
        },

        async rentVehicle() {
            if (!this.selectedVehicle || this.isRenting) return;

            this.isRenting = true;

            try {
                const response = await fetch(`https://${GetParentResourceName()}/rentVehicle`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json; charset=UTF-8'
                    },
                    body: JSON.stringify({
                        vehicle: this.selectedVehicle
                    })
                });

                const result = await response.json();

                if (result.success) {
                    // Başarılı bildirim
                    this.showNotification('success', 'Araç Kiralandı!', result.message);
                    
                    // Ses efekti
                    this.playSound('success');
                    
                    // Kısa bekleme sonra kapat
                    setTimeout(() => {
                        this.closeGUI();
                    }, 1500);
                } else {
                    // Hata bildirimi
                    this.showNotification('error', 'Hata', result.message);
                    this.playSound('error');
                }
            } catch (error) {
                console.error('Kiralama hatası:', error);
                this.showNotification('error', 'Hata', 'Bir hata oluştu!');
            } finally {
                this.isRenting = false;
            }
        },

        getVehicleIcon(model) {
            // Araç tipine göre ikon
            const icons = {
                'asea': 'fas fa-car-side',
                'faggio': 'fas fa-motorcycle',
                'bati': 'fas fa-motorcycle',
                'sanchez': 'fas fa-motorcycle',
                'bmx': 'fas fa-bicycle',
                'scorcher': 'fas fa-bicycle'
            };

            return icons[model] || 'fas fa-car';
        },

        showNotification(type, title, message) {
            // Lua'ya bildirim gönder
            fetch(`https://${GetParentResourceName()}/showNotification`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8'
                },
                body: JSON.stringify({
                    type: type,
                    title: title,
                    message: message
                })
            });
        },

        playSound(soundType) {
            // Ses efekti Lua'ya bildirilebilir
            fetch(`https://${GetParentResourceName()}/playSound`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8'
                },
                body: JSON.stringify({
                    sound: soundType
                })
            });
        }
    }
}).mount('#app');

// GetParentResourceName() polyfill (tarayıcıda çalışması için)
if (typeof GetParentResourceName === 'undefined') {
    window.GetParentResourceName = () => 'swx_rentacar';
}
