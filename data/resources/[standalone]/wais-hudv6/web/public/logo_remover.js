// Logo Replacer Script - Nexora RP
// Yeşil kare logoyu Nexora logosu ile değiştirir

(function() {
    'use strict';
    
    console.log('[Nexora RP] Logo replacer başlatıldı');
    
    // Logo elementlerini bul ve değiştir
    function replaceLogo() {
        // Tüm olası logo selectorları
        const selectors = [
            '.server-info',
            '.server_info',
            '.serverInfo',
            '.ServerInfo',
            '[class*="server-info"]',
            '[class*="server_info"]',
            '[class*="serverInfo"]',
            '[class*="ServerInfo"]',
            '[data-type="server-info"]',
            '[data-type="server_info"]'
        ];
        
        selectors.forEach(selector => {
            const elements = document.querySelectorAll(selector);
            elements.forEach(el => {
                if (el && !el.dataset.logoReplaced) {
                    // Yeşil arka planı kaldır
                    el.style.background = 'transparent';
                    el.style.backgroundColor = 'transparent';
                    
                    // İçeriği temizle
                    el.innerHTML = '';
                    
                    // Nexora logosunu ekle
                    const img = document.createElement('img');
                    img.src = 'nui://nexorafivem/data/myLogo.png';
                    img.style.width = '100%';
                    img.style.height = '100%';
                    img.style.objectFit = 'contain';
                    img.alt = 'Nexora RP';
                    
                    el.appendChild(img);
                    el.dataset.logoReplaced = 'true';
                    
                    console.log('[Nexora RP] Logo değiştirildi:', selector);
                }
            });
        });
        
        // Right corner'ın ilk child'ını değiştir
        const rightCorner = document.querySelector('.right-corner');
        if (rightCorner && rightCorner.firstElementChild && !rightCorner.firstElementChild.dataset.logoReplaced) {
            const firstChild = rightCorner.firstElementChild;
            const bgColor = window.getComputedStyle(firstChild).backgroundColor;
            
            // Eğer yeşil arka planlıysa değiştir
            if (bgColor.includes('rgb') || firstChild.style.background) {
                firstChild.style.background = 'transparent';
                firstChild.style.backgroundColor = 'transparent';
                firstChild.innerHTML = '';
                
                const img = document.createElement('img');
                img.src = 'nui://nexorafivem/data/myLogo.png';
                img.style.width = '100%';
                img.style.height = '100%';
                img.style.objectFit = 'contain';
                img.alt = 'Nexora RP';
                
                firstChild.appendChild(img);
                firstChild.dataset.logoReplaced = 'true';
                
                console.log('[Nexora RP] Right corner logosu değiştirildi');
            }
        }
        
        // Simple mode için
        const rightCornerSimple = document.querySelector('.right-corner-simple');
        if (rightCornerSimple && rightCornerSimple.firstElementChild && !rightCornerSimple.firstElementChild.dataset.logoReplaced) {
            const firstChild = rightCornerSimple.firstElementChild;
            const bgColor = window.getComputedStyle(firstChild).backgroundColor;
            
            if (bgColor.includes('rgb') || firstChild.style.background) {
                firstChild.style.background = 'transparent';
                firstChild.style.backgroundColor = 'transparent';
                firstChild.innerHTML = '';
                
                const img = document.createElement('img');
                img.src = 'nui://nexorafivem/data/myLogo.png';
                img.style.width = '100%';
                img.style.height = '100%';
                img.style.objectFit = 'contain';
                img.alt = 'Nexora RP';
                
                firstChild.appendChild(img);
                firstChild.dataset.logoReplaced = 'true';
                
                console.log('[Nexora RP] Right corner simple logosu değiştirildi');
            }
        }
    }
    
    // Sayfa yüklendiğinde çalıştır
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', replaceLogo);
    } else {
        replaceLogo();
    }
    
    // Her 2 saniyede bir kontrol et (logo dinamik yüklenebilir)
    setInterval(replaceLogo, 2000);
    
    // MutationObserver ile DOM değişikliklerini izle
    const observer = new MutationObserver(function(mutations) {
        mutations.forEach(function(mutation) {
            if (mutation.addedNodes.length) {
                replaceLogo();
            }
        });
    });
    
    // Root elementi izle
    const root = document.getElementById('root');
    if (root) {
        observer.observe(root, {
            childList: true,
            subtree: true
        });
    }
    
    console.log('[Nexora RP] Logo replacer aktif');
})();
