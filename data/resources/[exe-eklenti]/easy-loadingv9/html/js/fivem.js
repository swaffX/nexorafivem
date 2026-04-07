window.GetParentResourceName = function() {
    let resourceName = 'easy-loadingv9';
    try {
        if (window.invokeNative) {
            resourceName = window.invokeNative('GET_CURRENT_RESOURCE_NAME');
        }
    } catch (e) {
    }
    return resourceName;
};

(function() {
    window.addEventListener('DOMContentLoaded', initFivemIntegration);
    
    function initFivemIntegration() {
        const isFivem = 'window' in window && 'invokeNative' in window;
        
        if (isFivem) {
            setupFivemHandlers();
            registerNuiCallbacks();
        } else {
            setupBrowserSimulation();
        }
    }
    
    function setupFivemHandlers() {
        const vueApp = document.querySelector('#app').__vue__;
        vueApp.loadingProgress = 0;
        
        window.addEventListener('message', function(e) {
            const data = e.data;
            
            if (data.eventName === 'loadProgress') {
                vueApp.loadingProgress = Math.floor(data.loadFraction * 100);
            }
        });
        
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                if ('invokeNative' in window) {
                    window.invokeNative('loadingScreen', 'shutDown');
                }
            }
        });
    }
    
    function registerNuiCallbacks() {
        window.addEventListener('message', function(event) {
        });
    }
    
    function setupBrowserSimulation() {
        const vueApp = document.querySelector('#app').__vue__;
        let progress = 0;
        const interval = setInterval(() => {
            progress += Math.random() * 3;
            
            if (progress > 100) {
                progress = 100;
                clearInterval(interval);
            }
            
            vueApp.loadingProgress = Math.floor(progress);
        }, 500);
    }
})(); 