
// From cfx-keks (https://github.com/citizenfx/cfx-server-data/tree/master/resources/%5Btest%5D/keks)
var count = 0;
var thisCount = 0;


const handlers = {
    startInitFunctionOrder(data) {
        count = data.count;
    },

    initFunctionInvoking(data) {
        // progressBar ve loading bar ile ilgili kodlar kaldırıldı.
    },

    startDataFileEntries(data) {
        count = data.count;
    },

    performMapLoadFunction(data) {
        ++thisCount;
        // progressBar ve loading bar ile ilgili kodlar kaldırıldı.
    },
};

window.addEventListener('message', function (e) {
    if (e.data.action === 'showPressSpace') {
        var info = document.getElementById('press-space-info');
        var loading = document.getElementById('loading-info');
        if (info) info.style.display = 'block';
        if (loading) loading.style.display = 'none';
        // Space dinleyicisini ekle
        window.addEventListener('keydown', onSpaceDown, false);
    }
    (handlers[e.data.eventName] || function () { })(e.data);
});

function onSpaceDown(event) {
    if (event.code === 'Space' || event.keyCode === 32) {
        // NUI'ya close mesajı gönder
        fetch('https://'+GetParentResourceName()+'/closeLoadingScreen', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json; charset=UTF-8' },
            body: JSON.stringify({})
        });
        // Yazıyı gizle
        var info = document.getElementById('press-space-info');
        if (info) info.style.display = 'none';
        // Tüm loading ekranını gizle
        document.body.style.display = 'none';
        // Listener'ı kaldır
        window.removeEventListener('keydown', onSpaceDown, false);
    }
}