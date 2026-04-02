"use strict";

var QBRadialMenu = null;
var toggleConfig = false;
var keybindConfig = false;
$(document).ready(function () {
    window.addEventListener("message", function (event) {
        switch (event.data.action) {
            case "ui":
                toggleConfig = event.data.toggle;
                keybindConfig = event.data.keybind;
                if (event.data.radial) {
                    createMenu(event.data.items);
                    QBRadialMenu.open();
                } else {
                    QBRadialMenu.close(true);
                }
                if (toggleConfig === false) {
                    $(document).on("keyup", function (e) {
                        if ((e.key == keybindConfig) | (e.key === keybindConfig.toLowerCase())) {
                            QBRadialMenu.close();
                        }
                    });
                } else {
                    $(document).on("keydown", function (e) {
                        switch (e.key) {
                            case keybindConfig:
                                QBRadialMenu.close();
                                break;
                        }
                    });
                }
        }
    });
});
function createMenu(items) {
    QBRadialMenu = new RadialMenu({
        parent: document.body,
        size: 375,
        menuItems: items,
        onClick: function (item) {
            if (item.shouldClose) {
                QBRadialMenu.close(true);
            }

            if (item.items == null && item.shouldClose != null) {
                $.post(
                    "https://qb-radialmenu/selectItem",
                    JSON.stringify({
                        itemData: item,
                    })
                );
            }
        },
    });
}

// Close on escape pressed
$(document).on("keydown", function (e) {
    switch (e.key) {
        case "Escape":
            QBRadialMenu.close();
            break;
    }
});

document.addEventListener('mousemove', function(e) {
    const centerIcons = document.querySelectorAll('svg.menu > g.center');
    centerIcons.forEach(centerIcon => {
        const menuHolder = document.querySelector('div.menuHolder');
        const rect = menuHolder.getBoundingClientRect();
        const mouseX = e.clientX;
        const mouseY = e.clientY;

        const centerX = rect.left + rect.width / 2;
        const centerY = rect.top + rect.height / 2;

        const angle = Math.atan2(mouseY - centerY, mouseX - centerX);
        const degrees = angle * (180 / Math.PI);

        // Açıya 180 ekleyerek dönüş yönünü tersine çevir
        centerIcon.style.transform = `rotate(${degrees + 180}deg)`;
    });
});