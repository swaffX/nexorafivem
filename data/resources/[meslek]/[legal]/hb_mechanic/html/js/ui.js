window.onload = function(e)
{
    let menuStructure = {};
    let maxMenuItems = 50; // Increased to show more menu items

    // Add exit button functionality
    $("#exit_button").on('click', function() {
        $.post(`https://${GetParentResourceName()}/exitMenu`, JSON.stringify({}));
    });

    function updateBackButtonText(menuItemName)
    {
        // Update back button text with clicked menu item name
        $(".back-option .item1").html(menuItemName + " <img src='left.png' class='back-arrow-img'>");
    }

    function toggleMenuContainer(state)
    {
        if(state)
        {
            $("#menu_container").fadeIn("fast", "swing");
            // Force show for debugging
            $("#menu_container").show();
        }
        else
        {
            $("#menu_container").fadeOut("fast", "swing");
        }
    }

    function createMenu(menu, heading, subheading)
    {
        
        menuStructure[menu] = 
        {
            menu: menu,
            heading: heading,
            subheading: subheading,
            selectedItem: 0,
            previousSelectedItemID: null,
            container: "<ul id = 'menu_items' class = '" + menu + "' style = 'display: none; order: 5;'></ul>",
            items: {},
            itemsArray: {}
        }

        $("#menu_container").append(menuStructure[menu].container);
    }

    function destroyMenus()
    {
        
        for(var k in menuStructure)
        {
            $("." + menuStructure[k].menu).remove();
        }
        
        menuStructure = {}
    }

    function populateMenu(menu, id, item, item2)
    {
        // Check if menu exists in menuStructure
        if (!menuStructure[menu]) {
            return;
        }
        
        menuStructure[menu].items[id] = 
        {
            id: id,
            item: item,
            item2: item2
        }

        if(item2 == "none")
        {
            $("." + menu).append("<li class = '" + id + "' data-id='" + id + "'><span class = 'item1'>" + item + "</span></li>");
        }
        else
        {
            let item2Html = item2;
            if (item2.includes('$')) {
                // Fiyat için: $ ve rakamı ayır
                const match = item2.match(/(\$)([0-9.,]+)/);
                if (match) {
                    item2Html = `<span class='dollar-sign'>${match[1]}</span><span class='price-amount'>${match[2]}</span>`;
                }
            } else if (item2.includes('Eklenti')) {
                // Eklenti için: sayı ve metni ayır
                const match = item2.match(/(\d+)\s*Eklenti/);
                if (match) {
                    item2Html = `<span class='eklenti-count'>${match[1]}</span> <span class='eklenti-label'>Eklenti</span>`;
                }
            }
            $("." + menu).append("<li class = '" + id + "' data-id='" + id + "'><span class = 'item1'>" + item + "</span> <span class = 'item2' style = 'float: right;'>" + item2Html + "</span></li>");
        }
    }

    function finishPopulatingMenu(menu)
    {
        // Check if menu exists in menuStructure
        if (!menuStructure[menu]) {
            return;
        }
        
        
        menuStructure[menu].itemsArray = $("." + menu + " li").toArray();
        
        // Add back option as first item for submenus (only if not already exists)
        if (menu !== "mainMenu" && menu !== "repairMenu" && $("." + menu + " .back-option").length === 0) {
            // Get category name from menu name (remove "Menu" suffix)
            var categoryName = menu.replace("Menu", "");
            
            // Special handling for specific menu names
            if (menu === "ResprayMenu") categoryName = "Respray";
            else if (menu === "ResprayTypeMenu") categoryName = "Respray Türü";
            else if (menu === "WheelsMenu") categoryName = "Tekerlek Kategorileri";
            else if (menu === "NeonsMenu") categoryName = "Neon";
            else if (menu === "XenonsMenu") categoryName = "Xenon";
            else if (menu === "HeadlightsMenu") categoryName = "Far";
            else if (menu === "WindowTintMenu") categoryName = "Cam Rengi";
            else if (menu === "OldLiveryMenu") categoryName = "Çıkartma";
            else if (menu === "PlateIndexMenu") categoryName = "Plaka";
            else if (menu === "VehicleExtrasMenu") categoryName = "Araç Ekstraları";
            else if (menu === "TyreSmokeMenu") categoryName = "Lastik Dumanı";
            else if (menu === "NeonColoursMenu") categoryName = "Neon Renkleri";
            else if (menu === "XenonColoursMenu") categoryName = "Xenon Renkleri";
            else if (menu === "StandartMenu") categoryName = "Standart Renkler";
            else if (menu === "MatMenu") categoryName = "Mat Renkler";
            else if (menu === "MetalikMenu") categoryName = "Metalik Renkler";
            
            // Insert back option at the beginning
            var backOption = "<li class='back-option' data-id='back'><span class='item1'>" + categoryName + " <img src='left.png' class='back-arrow-img'></span></li>";
            $("." + menu).prepend(backOption);
            
            // Update items array
            menuStructure[menu].itemsArray = $("." + menu + " li").toArray();
        }
        
        // Add click event listeners to menu items
        $("." + menu + " li").off('click').on('click', function() {
            const itemId = $(this).data('id');
            const itemText = $(this).find('.item1').text();
            const item2Text = $(this).find('.item2').text();
            
            // Handle back option
            if (itemId === 'back') {
                $.post(`https://${GetParentResourceName()}/goBack`, JSON.stringify({}));
                return;
            }
            
            // Update selected item
            menuStructure[menu].selectedItem = menuStructure[menu].itemsArray.findIndex(item => $(item).data('id') == itemId);
            
            // Remove previous selection (but keep back button arrow)
            $("." + menu + " .item_selected").removeClass("item_selected").find("i:not(.fa-arrow-left)").remove();
            
            // Add selection to clicked item
            $(this).addClass("item_selected");
            
            // Send selection to client
            $.post(`https://${GetParentResourceName()}/selectedItem`, JSON.stringify({
                id: itemId,
                item: itemText,
                item2: item2Text
            }));
            
            // Send click event to client
            $.post(`https://${GetParentResourceName()}/menuItemClicked`, JSON.stringify({
                id: itemId,
                item: itemText,
                item2: item2Text
            }));
        });
        
        // Add hover event listeners
        $("." + menu + " li").off('mouseenter').on('mouseenter', function() {
            const itemId = $(this).data('id');
            const itemText = $(this).find('.item1').text();
            const item2Text = $(this).find('.item2').text();
            
            // Skip hover for back option
            if (itemId === 'back') {
                return;
            }
            
            // Update selected item on hover
            menuStructure[menu].selectedItem = menuStructure[menu].itemsArray.findIndex(item => $(item).data('id') == itemId);
            
            // Remove previous selection (but keep back button arrow)
            $("." + menu + " .item_selected").removeClass("item_selected").find("i:not(.fa-arrow-left)").remove();
            
            // Add selection to hovered item
            $(this).addClass("item_selected");
            
            // Send selection to client
            $.post(`https://${GetParentResourceName()}/selectedItem`, JSON.stringify({
                id: itemId,
                item: itemText,
                item2: item2Text
            }));
        });
        
    }

    function updateMenuHeading(menu)
    {
        
        if (menuStructure[menu] && menuStructure[menu].heading) {
        $("#menu_heading span").text(menuStructure[menu].heading);
        } else {
        }
    }

    function updateMenuSubheading(menu)
    {
        
        if (menuStructure[menu] && menuStructure[menu].subheading) {
        $("#menu_subheading span").text(menuStructure[menu].subheading);
        } else {
        }
    }

    function updateMenuStatus(text)
    {
        $("#menu_status span").text(text);
    }

    function toggleMenu(state, menu)
    {
        
        if(state)
        {
            // Check if menu exists in menuStructure
            if (!menuStructure[menu]) {
                return;
            }
            
            
            if(menuStructure[menu].selectedItem < maxMenuItems)
            {
                $("." + menu).empty();

                for(var i = 0; i < Object.keys(menuStructure[menu].itemsArray).length; i++)
                {
                    if(i < maxMenuItems)
                    {
                        $("." + menu).append(menuStructure[menu].itemsArray[i]);
                    }
                }

                $("." + menu + " .item_selected").find("i:not(.fa-arrow-left)").remove();
                
                // Check if selectedItem is valid
                if (menuStructure[menu].itemsArray[menuStructure[menu].selectedItem]) {
                menuStructure[menu].itemsArray[menuStructure[menu].selectedItem].classList.add("item_selected");
                    // Removed ok icon - var currentHTML = $("." + menu + " .item_selected").html();
                    // Removed ok icon - $("." + menu + " .item_selected").html("<i class='fas fa-angle-double-right'></i> " + currentHTML);

                var val1 = $("." + menu + " .item_selected").attr("class").split(" ")[0];
                var val2 = $("." + menu + " .item_selected .item1").text();
                var val3 = $("." + menu + " .item_selected .item2").text();
                $.post(`https://${GetParentResourceName()}/selectedItem`, JSON.stringify({
                    id: val1,
                    item: val2,
                    item2: val3
                }));
                }
            }
            else
            {
                $("." + menu).empty();

                for(var i = 0; i < Object.keys(menuStructure[menu].itemsArray).length; i++)
                {
                    if(i > (menuStructure[menu].selectedItem - maxMenuItems) && i <= (maxMenuItems + (menuStructure[menu].selectedItem - maxMenuItems)))
                    {
                        $("." + menu).append(menuStructure[menu].itemsArray[i]);
                    }
                }

                $("." + menu + " .item_selected").find("i:not(.fa-arrow-left)").remove();
                
                // Check if selectedItem is valid
                if (menuStructure[menu].itemsArray[menuStructure[menu].selectedItem]) {
                menuStructure[menu].itemsArray[menuStructure[menu].selectedItem].classList.add("item_selected");
                    // Removed ok icon - var currentHTML = $("." + menu + " .item_selected").html();
                    // Removed ok icon - $("." + menu + " .item_selected").html("<i class='fas fa-angle-double-right'></i> " + currentHTML);

                var val1 = $("." + menu + " .item_selected").attr("class").split(" ")[0];
                var val2 = $("." + menu + " .item_selected .item1").text();
                var val3 = $("." + menu + " .item_selected .item2").text();
                $.post(`https://${GetParentResourceName()}/selectedItem`, JSON.stringify({
                    id: val1,
                    item: val2,
                    item2: val3
                }));
                }
            }

            $("." + menu).show();
            
            // Force show for debugging
            $("." + menu).css("display", "block");
            
            // Add back option for submenus (only if not already exists)
            if (menu !== "mainMenu" && menu !== "repairMenu" && $("." + menu + " .back-option").length === 0) {
                // Get category name from menu name (remove "Menu" suffix)
                var categoryName = menu.replace("Menu", "");
                
                // Special handling for specific menu names
                if (menu === "ResprayMenu") categoryName = "Respray";
                else if (menu === "ResprayTypeMenu") categoryName = "Respray Türü";
                else if (menu === "WheelsMenu") categoryName = "Tekerlek Kategorileri";
                else if (menu === "NeonsMenu") categoryName = "Neon";
                else if (menu === "XenonsMenu") categoryName = "Xenon";
                else if (menu === "HeadlightsMenu") categoryName = "Far";
                else if (menu === "WindowTintMenu") categoryName = "Cam Rengi";
                else if (menu === "OldLiveryMenu") categoryName = "Çıkartma";
                else if (menu === "PlateIndexMenu") categoryName = "Plaka";
                else if (menu === "VehicleExtrasMenu") categoryName = "Araç Ekstraları";
                else if (menu === "TyreSmokeMenu") categoryName = "Lastik Dumanı";
                else if (menu === "NeonColoursMenu") categoryName = "Neon Renkleri";
                else if (menu === "XenonColoursMenu") categoryName = "Xenon Renkleri";
                else if (menu === "StandartMenu") categoryName = "Standart Renkler";
                else if (menu === "MatMenu") categoryName = "Mat Renkler";
                else if (menu === "MetalikMenu") categoryName = "Metalik Renkler";
                
                // Insert back option at the beginning
                var backOption = "<li class='back-option' data-id='back'><span class='item1'>" + categoryName + " <img src='left.png' class='back-arrow-img'></span></li>";
                $("." + menu).prepend(backOption);
                
                // Update items array
                menuStructure[menu].itemsArray = $("." + menu + " li").toArray();
            }
            
            // Re-add event listeners after menu is shown
            $("." + menu + " li").off('click').on('click', function() {
                const itemId = $(this).data('id');
                const itemText = $(this).find('.item1').text();
                const item2Text = $(this).find('.item2').text();
                
                // Handle back option
                if (itemId === 'back') {
                    $.post(`https://${GetParentResourceName()}/goBack`, JSON.stringify({}));
                    return;
                }

                // Update selected item
                menuStructure[menu].selectedItem = menuStructure[menu].itemsArray.findIndex(item => $(item).data('id') == itemId);
                
                // Remove previous selection (but keep back button arrow)
                $("." + menu + " .item_selected").removeClass("item_selected").find("i:not(.fa-arrow-left)").remove();
                
                // Add selection to clicked item
                $(this).addClass("item_selected");
                
                // Send selection to client
                $.post(`https://${GetParentResourceName()}/selectedItem`, JSON.stringify({
                    id: itemId,
                    item: itemText,
                    item2: item2Text
                }));
                
                // Send click event to client
                $.post(`https://${GetParentResourceName()}/menuItemClicked`, JSON.stringify({
                    id: itemId,
                    item: itemText,
                    item2: item2Text
                }));
            });
            
            // Re-add hover event listeners
            $("." + menu + " li").off('mouseenter').on('mouseenter', function() {
                const itemId = $(this).data('id');
                const itemText = $(this).find('.item1').text();
                const item2Text = $(this).find('.item2').text();
                
                // Skip hover for back option
                if (itemId === 'back') {
                    return;
                }

                // Update selected item on hover
                menuStructure[menu].selectedItem = menuStructure[menu].itemsArray.findIndex(item => $(item).data('id') == itemId);
                
                // Remove previous selection (but keep back button arrow)
                $("." + menu + " .item_selected").removeClass("item_selected").find("i:not(.fa-arrow-left)").remove();
                
                // Add selection to hovered item
                $(this).addClass("item_selected");
                
                // Send selection to client
                $.post(`https://${GetParentResourceName()}/selectedItem`, JSON.stringify({
                    id: itemId,
                    item: itemText,
                    item2: item2Text
                }));
            });
            
        }
        else
        {
            $("." + menu).hide();
        }
    }

    function updateItem2TextOnly(menu, id, text)
    {
        $("." + menu + " ." + id + " .item2").html(text);
        $.post(`https://${GetParentResourceName()}/updateItem2`, JSON.stringify({
            item: text
        }));
    }

    function updateItem2Text(menu, id, text)
    {
        // Check if menu exists in menuStructure
        if (!menuStructure[menu]) {
            return;
        }
        
        if(menuStructure[menu].previousSelectedItemID == null)
        {
            $("." + menu + " ." + id + " .item2").html(text);

            menuStructure[menu].previousSelectedItemID = id
        }
        else if(id != menuStructure[menu].previousSelectedItemID)
        {
            var prevID = menuStructure[menu].previousSelectedItemID
            if(menuStructure[menu].itemsArray[prevID] != undefined) {
                $("." + menu + " ." + prevID + " .item2").html(menuStructure[menu].items[prevID].item2);
                var item2Elem = menuStructure[menu].itemsArray[prevID]?.getElementsByClassName("item2")[0];
                if (item2Elem) {
                    item2Elem.innerHTML = menuStructure[menu].items[prevID].item2;
                }
            } else {
                for (let i = 0; i < menuStructure[menu].itemsArray.length; i++) {
                    if(menuStructure[menu].itemsArray[i].classList.contains(prevID)) {
                        $("." + menu + " ." + prevID + " .item2").html(menuStructure[menu].items[prevID].item2);
                        var item2Elem = menuStructure[menu].itemsArray[i]?.getElementsByClassName("item2")[0];
                        if (item2Elem) {
                            item2Elem.innerHTML = menuStructure[menu].items[prevID].item2;
                        }
                    }
                }
            }
            menuStructure[menu].previousSelectedItemID = id;

            $("." + menu + " .item_selected .item2").html(text);
        }
        else
        {
            $("." + menu + " ." + id + " .item2").html(text);

            menuStructure[menu].previousSelectedItemID = null
        }

        $.post(`https://${GetParentResourceName()}/updateItem2`, JSON.stringify({
            item: text
        }));
    }

    function updateItem2ID(menu, id, text)
    {
        // Check if menu exists in menuStructure
        if (!menuStructure[menu]) {
            return;
        }
        
        menuStructure[menu].previousSelectedItemID = id
    }

    // Remove scrollMenuFunctionality as it's no longer needed with mouse control
    function scrollMenuFunctionality(direction, menu)
    {
        // This function is kept for compatibility but no longer does anything
        // Mouse hover and click now handle all menu navigation
    }

    function playSoundEffect(soundEffect, volume)
    {
        var audioPlayer = null;

        if(audioPlayer != null)
        {
            audioPlayer.pause();
        }

        audioPlayer = new Howl({src: ["./sounds/" + soundEffect + ".ogg"]});
        audioPlayer.volume(volume);
        audioPlayer.play();
    }

    window.addEventListener("message", function(event)
    {
        var eventData = event.data;

        if(eventData.toggleMenuContainer)
        {
            toggleMenuContainer(eventData.state);
        }

        if(eventData.createMenu)
        {
            createMenu(eventData.menu, eventData.heading, eventData.subheading);
        }

        if(eventData.destroyMenus)
        {
            destroyMenus();
        }

        if(eventData.populateMenu)
        {
            populateMenu(eventData.menu, eventData.id, eventData.item, eventData.item2);
        }

        if(eventData.finishPopulatingMenu)
        {
            finishPopulatingMenu(eventData.menu);
        }

        if(eventData.updateMenuHeading)
        {
            updateMenuHeading(eventData.menu);
        }

        if(eventData.updateMenuSubheading)
        {
            updateMenuSubheading(eventData.menu);
        }

        if(eventData.updateMenuStatus)
        {
            updateMenuStatus(eventData.statusText)
        }

        if(eventData.toggleMenu)
        {
            toggleMenu(eventData.state, eventData.menu);
        }

        if(eventData.updateItem2Text)
        {
            updateItem2Text(eventData.menu, eventData.id, eventData.item2)
        }

        if(eventData.updateItem2TextOnly)
        {
            updateItem2TextOnly(eventData.menu, eventData.id, eventData.item2)
        }

        if(eventData.scrollMenuFunctionality)
        {
            scrollMenuFunctionality(eventData.direction, eventData.menu);
        }

        if(eventData.playSoundEffect)
        {
            playSoundEffect(eventData.soundEffect, eventData.volume);
        }

        if(eventData.updateBackButtonText)
        {
            updateBackButtonText(eventData.menuItemName);
        }
    });

    // Add keyboard event listener for F key to toggle camera mode
    document.addEventListener('keydown', function(event) {
        if (event.key === 'f' || event.key === 'F') {
            $.post(`https://${GetParentResourceName()}/toggleCameraMode`, JSON.stringify({}));
        }
    });

    // Add mouse event listener for right click to toggle camera mode
    document.addEventListener('mousedown', function(event) {
        if (event.button === 2) { // Right click
            event.preventDefault(); // Prevent context menu
            $.post(`https://${GetParentResourceName()}/toggleCameraMode`, JSON.stringify({}));
        }
    });

    // Add mouse wheel scrolling for menu items
    const menuItems = document.getElementById('menu_items');
    if (menuItems) {
        menuItems.addEventListener('wheel', function(event) {
            event.preventDefault();
            menuItems.scrollTop += event.deltaY;
        }, { passive: false });
    }
}