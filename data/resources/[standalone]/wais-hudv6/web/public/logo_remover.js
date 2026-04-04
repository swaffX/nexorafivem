// Logo Remover Script - Nexora RP
// Yeşil kare logoyu tamamen kaldırır

(function() {
    'use strict';
    
    console.log('[Nexora RP] Logo remover başlatıldı');
    
    // Logo elementlerini bul ve kaldır
    function removeLogo() {
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
                if (el) {
                    el.remove();
                    console.log('[Nexora RP] Logo elementi kaldırıldı:', selector);
                }
            });
        });
        
        // Right corner'ın ilk child'ını kaldır (logo genelde buradadır)
        const rightCorner = document.querySelector('.right-corner');
        if (rightCorner && rightCorner.firstElementChild) {
            const firstChild = rightCorner.firstElementChild;
            // Eğer yeşil arka planlıysa kaldır
            const bgColor = window.getComputedStyle(firstChild).backgroundColor;
            if (bgColor.includes('rgb') || firstChild.style.background) {
                firstChild.remove();
                console.log('[Nexora RP] Right corner ilk elementi kaldırıldı');
            }
        }
        
        // Simple mode için
        const rightCornerSimple = document.querySelector('.right-corner-simple');
        if (rightCornerSimple && rightCornerSimple.firstElementChild) {
            const firstChild = rightCornerSimple.firstElementChild;
            const bgColor = window.getComputedStyle(firstChild).backgroundColor;
            if (bgColor.includes('rgb') || firstChild.style.background) {
                firstChild.remove();
                console.log('[Nexora RP] Right corner simple ilk elementi kaldırıldı');
            }
        }
    }
    
    // Sayfa yüklendiğinde çalıştır
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', removeLogo);
    } else {
        removeLogo();
    }
    
    // Her 1 saniyede bir kontrol et (logo dinamik yüklenebilir)
    setInterval(removeLogo, 1000);
    
    // MutationObserver ile DOM değişikliklerini izle
    const observer = new MutationObserver(function(mutations) {
        mutations.forEach(function(mutation) {
            if (mutation.addedNodes.length) {
                removeLogo();
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
    
    console.log('[Nexora RP] Logo remover aktif');
})();
