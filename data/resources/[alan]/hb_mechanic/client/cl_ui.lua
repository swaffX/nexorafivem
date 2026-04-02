-----------------------
----   Variables   ----
-----------------------
local currentMenuItemID = 0
local currentMenuItem = ""
local currentMenuItem2 = ""
local currentMenu = "mainMenu"
local currentCategory = 0
local currentResprayCategory = 0
local currentResprayType = 0
local currentWheelCategory = 0
local currentNeonSide = 0
local clickedMenuItemName = "" -- Track clicked menu item name

-----------------------
----   Functions   ----
-----------------------

local function updateBackButtonText(menuItemName)
    SendNUIMessage({
        updateBackButtonText = true,
        menuItemName = menuItemName
    })
end

local function toggleMenuContainer(state)
    SendNUIMessage({
        toggleMenuContainer = true,
        state = state
    })
    
    -- Show/hide mouse cursor based on menu state
    if state then
        SetNuiFocus(true, true) -- Enable cursor and focus
    else
        SetNuiFocus(false, false) -- Disable cursor and focus
    end
end

local function createMenu(menu, heading, subheading)
    SendNUIMessage({
        createMenu = true,
        menu = menu,
        heading = heading,
        subheading = subheading
    })
end

local function destroyMenus()
    SendNUIMessage({
        destroyMenus = true
    })
end

local function populateMenu(menu, id, item, item2)
    SendNUIMessage({
        populateMenu = true,
        menu = menu,
        id = id,
        item = item,
        item2 = item2
    })
end

local function finishPopulatingMenu(menu)
    SendNUIMessage({
        finishPopulatingMenu = true,
        menu = menu
    })
end

local function updateMenuHeading(menu)
    SendNUIMessage({
        updateMenuHeading = true,
        menu = menu
    })
end

local function updateMenuSubheading(menu)
    SendNUIMessage({
        updateMenuSubheading = true,
        menu = menu
    })
end

local function updateMenuStatus(text)
    SendNUIMessage({
        updateMenuStatus = true,
        statusText = text
    })
end

local function toggleMenu(state, menu)
    print("DEBUG: toggleMenu called - State:", state, "Menu:", menu)
    SendNUIMessage({
        toggleMenu = true,
        state = state,
        menu = menu
    })
end

local function updateItem2Text(menu, id, text)
    SendNUIMessage({
        updateItem2Text = true,
        menu = menu,
        id = id,
        item2 = text
    })
end

local function updateItem2TextOnly(menu, id, text)
    SendNUIMessage({
        updateItem2TextOnly = true,
        menu = menu,
        id = id,
        item2 = text
    })
end

local function scrollMenuFunctionality(direction, menu)
    SendNUIMessage({
        scrollMenuFunctionality = true,
        direction = direction,
        menu = menu
    })
end

local function playSoundEffect(soundEffect, volume)
    SendNUIMessage({
        playSoundEffect = true,
        soundEffect = soundEffect,
        volume = volume
    })
end

local function formatPrice(price)
    return "<span style='color: #7ca664;'>$</span><span style='color: #ffffff;'>" .. price .. "</span>"
end

local function isMenuActive(menu)
    local menuActive = false

    if menu == "modMenu" then
        for _, v in pairs(vehicleCustomisation) do
            if (v.category:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true

                break
            else
                menuActive = false
            end
        end
    elseif menu == "ResprayMenu" then
        for _, v in pairs(vehicleResprayOptions) do
            if (v.category:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true

                break
            else
                menuActive = false
            end
        end
    elseif menu == "WheelsMenu" then
        for _, v in pairs(vehicleWheelOptions) do
            if (v.category:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true

                break
            else
                menuActive = false
            end
        end
    elseif menu == "NeonsSideMenu" then
        for _, v in pairs(vehicleNeonOptions.neonTypes) do
            if (v.name:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true

                break
            else
                menuActive = false
            end
        end
    end

    return menuActive
end

local function updateCurrentMenuItemID(id, item, item2)
    currentMenuItemID = tonumber(id) or 0
    currentMenuItem = item or ""
    currentMenuItem2 = item2 or ""

    if isMenuActive("modMenu") then
        if tonumber(currentCategory) ~= 18 then
            PreviewMod(tonumber(currentCategory) or 0, tonumber(currentMenuItemID) or 0)
        end
    elseif isMenuActive("ResprayMenu") then
        PreviewColour(tonumber(currentResprayCategory) or 0, tonumber(currentResprayType) or 0, tonumber(currentMenuItemID) or 0)
    elseif isMenuActive("WheelsMenu") then
        if tonumber(currentWheelCategory) ~= -1 and tonumber(currentWheelCategory) ~= 20 then
            PreviewWheel(tonumber(currentCategory) or 0, tonumber(currentMenuItemID) or 0, tonumber(currentWheelCategory) or 0)
        end
    elseif isMenuActive("NeonsSideMenu") then
        PreviewNeon(tonumber(currentNeonSide) or 0, tonumber(currentMenuItemID) or 0)
    elseif currentMenu == "WindowTintMenu" then
        PreviewWindowTint(tonumber(currentMenuItemID) or 0)
    elseif currentMenu == "NeonColoursMenu" then
        local r = vehicleNeonOptions.neonColours[tonumber(currentMenuItemID) or 1] and vehicleNeonOptions.neonColours[tonumber(currentMenuItemID) or 1].r or 255
        local g = vehicleNeonOptions.neonColours[tonumber(currentMenuItemID) or 1] and vehicleNeonOptions.neonColours[tonumber(currentMenuItemID) or 1].g or 255
        local b = vehicleNeonOptions.neonColours[tonumber(currentMenuItemID) or 1] and vehicleNeonOptions.neonColours[tonumber(currentMenuItemID) or 1].b or 255

        PreviewNeonColour(r, g, b)
    elseif currentMenu == "XenonColoursMenu" then
        PreviewXenonColour(tonumber(currentMenuItemID) or 0)
    elseif currentMenu == "OldLiveryMenu" then
        PreviewOldLivery(tonumber(currentMenuItemID) or 0)
    elseif currentMenu == "PlateIndexMenu" then
        PreviewPlateIndex(tonumber(currentMenuItemID) or 0)
    end
end

function InitiateMenus(isMotorcycle, vehicleHealth, categories, welcomeLabel)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if not plyVeh or plyVeh == 0 then
        return
    end
    --#[Repair Menu]#--
    if tonumber(vehicleHealth) and tonumber(vehicleHealth) < 1000.0 and categories.repair then
        local repairCost = math.ceil(1000 - (tonumber(vehicleHealth) or 0))

        TriggerServerEvent("hb_mechanic:server:updateRepairCost", repairCost)
        createMenu("repairMenu", welcomeLabel, "Tamir Et")
        populateMenu("repairMenu", -1, "Tamir Et", "$" .. repairCost)
        finishPopulatingMenu("repairMenu")
    end

    --#[Main Menu]#--
    print("DEBUG: Starting main menu creation...")
    createMenu("mainMenu", "Araç Modifikasyonu", "Kategori Seç")

    local submenuCategories = {
        [-1] = "Respray",
        [-2] = "Window Tint",
        [-3] = "Neons",
        [22] = "Xenons",
        [23] = "Wheels",
        [24] = "Old Livery",
        [25] = "Plate Index",
        [26] = "Vehicle Extras"
    }

    print("DEBUG: Processing vehicleCustomisation list, total items:", #vehicleCustomisation)
    for _, v in ipairs(vehicleCustomisation) do
        if v.id ~= nil and v.category ~= nil and not submenuCategories[v.id] then
            local _, amountValidMods = CheckValidMods(v.category, v.id)
            -- Sadece eklentisi olan kategorileri göster
            if (tonumber(amountValidMods) or 0) > 0 then
                populateMenu("mainMenu", v.id, v.category, "<span class='eklenti-count'>" .. (tonumber(amountValidMods) or 0) .. "</span><span class='eklenti-label'> Eklenti</span>")
                print("DEBUG: Added to main menu:", v.category, "ID:", v.id, "Mods:", amountValidMods)
            else
                print("DEBUG: Skipped category (no mods):", v.category, "ID:", v.id, "Mods:", amountValidMods)
            end
        else
            print("DEBUG: Skipped category:", v.category, "ID:", v.id, "Reason: submenu or invalid")
        end
    end

    -- Alt menüye yönlendiren başlıklar sade şekilde ekleniyor
    print("DEBUG: Adding submenu categories...")
    for id, name in pairs(submenuCategories) do
        populateMenu("mainMenu", id, name, "none")
        print("DEBUG: Added submenu to main menu:", name, "ID:", id)
    end
    finishPopulatingMenu("mainMenu")
    print("DEBUG: Main menu population finished. Total items should be visible.")

    --#[Mods Menu]#--
    for _, v in ipairs(vehicleCustomisation) do
        local validMods, amountValidMods = CheckValidMods(v.category, v.id)
        local currentMod, _ = GetCurrentMod(v.id)

        print("DEBUG: Processing category:", v.category, "ID:", v.id, "Valid mods:", amountValidMods, "Has mods:", (tonumber(amountValidMods) or 0) > 0)

        -- Special handling for all categories - always create menu even if no mods
        local shouldCreateMenu = (tonumber(amountValidMods) or 0) > 0 or tonumber(v.id) == 18 or true -- Always create menu for all categories
        
        if shouldCreateMenu then
            print("DEBUG: Creating menu for category:", v.category, "Menu name:", v.category:gsub("%s+", "") .. "Menu")
            
            if tonumber(v.id) == 11 or tonumber(v.id) == 12 or tonumber(v.id) == 13 or tonumber(v.id) == 15 or tonumber(v.id) == 16 then --Performance Upgrades
                local tempNum = 0

                createMenu(v.category:gsub("%s+", "") .. "Menu", v.category, "Yükseltme Seç")

                for _, n in pairs(validMods) do
                    tempNum = tempNum + 1

                    if (tonumber(maxVehiclePerformanceUpgrades) or 0) == 0 then
                        local price = vehicleCustomisationPrices.performance.prices[tempNum] or 0
                        populateMenu(v.category:gsub("%s+", "") .. "Menu", n.id, n.name, formatPrice(price))

                    else
                        if tempNum <= ((tonumber(maxVehiclePerformanceUpgrades) or 0) + 1) then
                            local price = vehicleCustomisationPrices.performance.prices[tempNum] or 0
                            populateMenu(v.category:gsub("%s+", "") .. "Menu", n.id, n.name, formatPrice(price))

                        end
                    end
                end

                finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
            elseif tonumber(v.id) == 18 then
                local currentTurboState = GetCurrentTurboState()
                createMenu(v.category:gsub("%s+", "") .. "Menu", v.category .. " Customisation", "Enable or Disable Turbo")

                populateMenu(v.category:gsub("%s+", "") .. "Menu", -1, "Disable", formatPrice(0))
                local turboPrice = vehicleCustomisationPrices.turbo.prices[2] or 0
                populateMenu(v.category:gsub("%s+", "") .. "Menu", 0, "Enable", formatPrice(turboPrice))

                finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
            else
                createMenu(v.category:gsub("%s+", "") .. "Menu", v.category .. " Customisation", "")

                -- If no valid mods, add a placeholder item for any category
                if (tonumber(amountValidMods) or 0) == 0 then
                    populateMenu(v.category:gsub("%s+", "") .. "Menu", 0, "Stok " .. v.category, "$0")
                else
                    for _, n in pairs(validMods) do
                        populateMenu(v.category:gsub("%s+", "") .. "Menu", n.id, n.name, formatPrice(vehicleCustomisationPrices.cosmetics.price))
                    end
                end

                finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
            end
        else
            print("DEBUG: Skipping menu creation for category:", v.category, "No valid mods found")
        end
    end

    --#[Respray Menu]#--
    print("DEBUG: Creating ResprayMenu")
    createMenu("ResprayMenu", "Respray", "Renk Seç")

    populateMenu("ResprayMenu", 0, "Birincil Renk", "none")
    populateMenu("ResprayMenu", 1, "İkincil Renk", "none")
    populateMenu("ResprayMenu", 2, "Sedef", "none")
    populateMenu("ResprayMenu", 3, "Tekerlek Rengi", "none")
    populateMenu("ResprayMenu", 4, "Döşeme Rengi", "none")
    populateMenu("ResprayMenu", 5, "Panel", "none")

    finishPopulatingMenu("ResprayMenu")

    --#[Respray Types]#--
    print("DEBUG: Creating ResprayTypeMenu")
    createMenu("ResprayTypeMenu", "Respray Types", "Renk Türü Seç")

    for _, v in ipairs(vehicleResprayOptions) do
        populateMenu("ResprayTypeMenu", v.id, v.category, "none")
    end

    finishPopulatingMenu("ResprayTypeMenu")

    --#[Respray Colours]#--
    print("DEBUG: Starting Respray Colours creation. Total respray options:", #vehicleResprayOptions)
    for _, v in ipairs(vehicleResprayOptions) do
        local colorMenuName = v.category .. "Menu"
        print("DEBUG: Creating color menu:", colorMenuName, "with", #v.colours, "colors")
        createMenu(colorMenuName, v.category .. " Colours", "Renk Seç")

        for _, n in ipairs(v.colours) do
            populateMenu(colorMenuName, n.id, n.name, "$" .. vehicleCustomisationPrices.respray.price)
        end

        finishPopulatingMenu(colorMenuName)
        print("DEBUG: Finished creating color menu:", colorMenuName)
    end
    print("DEBUG: Finished all Respray Colours creation")

    --#[Wheel Categories Menu]#--
    createMenu("WheelsMenu", "Wheel Categories", "Kategori Seç")

    for _, v in ipairs(vehicleWheelOptions) do
        if isMotorcycle then
            if tonumber(v.id) == -1 or tonumber(v.id) == 20 or tonumber(v.id) == 6 then --Motorcycle Wheels
                populateMenu("WheelsMenu", v.id, v.category, "none")
            end
        else
            populateMenu("WheelsMenu", v.id, v.category, "none")
        end
    end

    finishPopulatingMenu("WheelsMenu")

    --#[Wheels Menu]#--
    for _, v in ipairs(vehicleWheelOptions) do
        if tonumber(v.id) == -1 then
            local currentCustomWheelState = GetCurrentCustomWheelState()
            createMenu(v.category:gsub("%s+", "") .. "Menu", v.category, "Özel Tekerlek")

            populateMenu(v.category:gsub("%s+", "") .. "Menu", 0, "Devre Dışı", "$0")
            populateMenu(v.category:gsub("%s+", "") .. "Menu", 1, "Aktif", "$" .. vehicleCustomisationPrices.customwheels.price)

            finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
        elseif tonumber(v.id) ~= 20 then
            if isMotorcycle then
                if tonumber(v.id) == 6 then --Motorcycle Wheels
                    local validMods, _ = CheckValidMods(v.category, v.wheelID, v.id)

                    createMenu(v.category .. "Menu", v.category .. " Wheels", "Tekerlek Seç")

                    for _, n in pairs(validMods) do
                        populateMenu(v.category .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.wheels.price)
                    end

                    finishPopulatingMenu(v.category .. "Menu")
                end
            else
                local validMods, _ = CheckValidMods(v.category, v.wheelID, v.id)

                createMenu(v.category .. "Menu", v.category .. " Wheels", "Tekerlek Seç")

                for _, n in pairs(validMods) do
                    populateMenu(v.category .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.wheels.price)
                end

                finishPopulatingMenu(v.category .. "Menu")
            end
        end
    end

    --#[Wheel Smoke Menu]#--
    local currentWheelSmokeR, currentWheelSmokeG, currentWheelSmokeB = GetCurrentVehicleWheelSmokeColour()
    createMenu("TyreSmokeMenu", "Tyre Smoke Customisation", "Renk Seç")

    for k, v in ipairs(vehicleTyreSmokeOptions) do
        populateMenu("TyreSmokeMenu", k, v.name, "$" .. vehicleCustomisationPrices.wheelsmoke.price)
    end

    finishPopulatingMenu("TyreSmokeMenu")

    --#[Window Tint Menu]#--
    local currentWindowTint = GetCurrentWindowTint()
    createMenu("WindowTintMenu", "Window Tint Customisation", "Tür Seç")
    for _, v in ipairs(vehicleWindowTintOptions) do
        populateMenu("WindowTintMenu", v.id, v.name, "$" .. vehicleCustomisationPrices.windowtint.price)
    end
    finishPopulatingMenu("WindowTintMenu")

    --#[Old Livery Menu]#--
    createMenu("OldLiveryMenu", "Old Livery Customisation", "Çıkartma Seç")
    if (tonumber(livCount) or 0) > 0 then
        for i=0, (tonumber(livCount) or 0)-1 do
            populateMenu("OldLiveryMenu", i, "Livery", "$100")
        end
    else
        -- Add placeholder if no liveries available
        populateMenu("OldLiveryMenu", 0, "Livery Yok", "$0")
    end
    finishPopulatingMenu("OldLiveryMenu")

    --#[Plate Colour Index Menu]#--

    local tempPlateIndex = GetVehicleNumberPlateTextIndex(plyVeh)
    print("DEBUG: Creating PlateIndexMenu")
    createMenu("PlateIndexMenu", "Plate Colour", "Stil Seç")
    local plateTypes = {
        "Beyaz Üzerine Mavi #1",
        "Siyah Üzerine Sarı",
        "Mavi Üzerine Sarı",
        "Beyaz Üzerine Mavi #2",
        "Beyaz Üzerine Mavi #3",
        "Kuzey Yankton",
    }
    local vehClass = nil
    if plyVeh and plyVeh ~= 0 then
        vehClass = GetVehicleClass(plyVeh)
    end
    print("DEBUG PlateIndexMenu START", "plyVeh=", plyVeh, "vehClass=", vehClass, "Config.allowGovPlateIndex=", Config and Config.allowGovPlateIndex)
    for i=0, #plateTypes-1 do
        local plateName = plateTypes[i+1] or ("Plaka " .. tostring(i+1))
        local platePrice = vehicleCustomisationPrices.plateindex and vehicleCustomisationPrices.plateindex.price or 0
        local allowPlate = false
        if tonumber(i) ~= 4 then
            allowPlate = true
        elseif tonumber(i) == 4 then
            if vehClass ~= nil then
                local vClass = tonumber(vehClass)
                if vClass and vClass == 18 then
                    allowPlate = true
                end
            end
            if Config and Config.allowGovPlateIndex then
                allowPlate = true
            end
        elseif Config and Config.allowGovPlateIndex then
            allowPlate = true
        end
        if allowPlate then
            populateMenu("PlateIndexMenu", i, plateName, "$"..platePrice)
        end
    end
    print("DEBUG PlateIndexMenu END")
    finishPopulatingMenu("PlateIndexMenu")

    --#[Vehicle Extras Menu]#--
    print("DEBUG: Creating VehicleExtrasMenu")
    createMenu("VehicleExtrasMenu", "Vehicle Extras Customisation", "Ekstraları Değiştir")
    for i=1, 12 do
        if DoesExtraExist(plyVeh, i) then
            populateMenu("VehicleExtrasMenu", i, "Extra "..tostring(i), "Değiştir")
        else
            populateMenu("VehicleExtrasMenu", i, "No Option", "NONE")
        end
    end
    finishPopulatingMenu("VehicleExtrasMenu")

    --#[Neons Menu]#--
    print("DEBUG: Creating NeonsMenu")
    createMenu("NeonsMenu", "Neon Customisation", "Bir Kategori Seç")

    for _, v in ipairs(vehicleNeonOptions.neonTypes) do
        populateMenu("NeonsMenu", v.id, v.name, "none")
    end

    populateMenu("NeonsMenu", -1, "Neon Colours", "none")
    finishPopulatingMenu("NeonsMenu")

    --#[Neon State Menu]#--
    for _, v in ipairs(vehicleNeonOptions.neonTypes) do
        local currentNeonState = GetCurrentNeonState(v.id)
        local neonMenuName = v.name:gsub("%s+", "") .. "Menu"
        print("DEBUG: Creating neon menu:", neonMenuName)
        createMenu(neonMenuName, "Neon Customisation", "Enable or Disable Neon")

        populateMenu(neonMenuName, 0, "Disabled", "$0")
        populateMenu(neonMenuName, 1, "Enabled", "$" .. vehicleCustomisationPrices.neonside.price)

        finishPopulatingMenu(neonMenuName)
    end

    --#[Neon Colours Menu]#--
    local currentNeonR, currentNeonG, currentNeonB = GetCurrentNeonColour()
    print("DEBUG: Creating NeonColoursMenu")
    createMenu("NeonColoursMenu", "Neon Colours", "Renk Seç")
    for k, _ in ipairs(vehicleNeonOptions.neonColours) do
        populateMenu("NeonColoursMenu", k, vehicleNeonOptions.neonColours[k].name, "$" .. vehicleCustomisationPrices.neoncolours.price)
    end
    finishPopulatingMenu("NeonColoursMenu")

    --#[Xenons Menu]#--
    print("DEBUG: Creating XenonsMenu")
    createMenu("XenonsMenu", "Xenon Customisation", "Bir Kategori Seç")

    populateMenu("XenonsMenu", 0, "Headlights", "none")
    populateMenu("XenonsMenu", 1, "Xenon Colours", "none")

    finishPopulatingMenu("XenonsMenu")

    --#[Xenons Headlights Menu]#--
    local currentXenonState = GetCurrentXenonState()
    print("DEBUG: Creating HeadlightsMenu")
    createMenu("HeadlightsMenu", "Headlights Customisation", "Enable or Disable Xenons")

    populateMenu("HeadlightsMenu", 0, "Disable Xenons", "$0")
    populateMenu("HeadlightsMenu", 1, "Enable Xenons", "$" .. vehicleCustomisationPrices.headlights.price)

    finishPopulatingMenu("HeadlightsMenu")

    --#[Xenons Colour Menu]#--
    local currentXenonColour = GetCurrentXenonColour()
    print("DEBUG: Creating XenonColoursMenu")
    createMenu("XenonColoursMenu", "Xenon Colours", "Renk Seç")
    for _, v in ipairs(vehicleXenonOptions.xenonColours) do
        populateMenu("XenonColoursMenu", v.id, v.name, "$" .. vehicleCustomisationPrices.xenoncolours.price)
    end
    finishPopulatingMenu("XenonColoursMenu")
end

function DestroyMenus()
    destroyMenus()
end

function DisplayMenuContainer(state)
    toggleMenuContainer(state)
end

function DisplayMenu(state, menu)
    print("DEBUG: DisplayMenu called - State:", state, "Menu:", menu)
    if state then
        currentMenu = menu
        print("DEBUG: Current menu set to:", currentMenu)
        
        -- Update back button text if it's a submenu
        if menu ~= "mainMenu" and menu ~= "repairMenu" and clickedMenuItemName ~= "" then
            updateBackButtonText(clickedMenuItemName)
        end
    end

    toggleMenu(state, menu)
    updateMenuHeading(menu)
    updateMenuSubheading(menu)
end

function MenuManager(state, repairOnly)
    if state then
        if currentMenuItem2 ~= "TAKILDI" then
            if isMenuActive("modMenu") then
                if tonumber(currentCategory) == 18 then --Turbo
                    if AttemptPurchase("turbo", tonumber(currentMenuItemID) or 0) then
                        ApplyMod(tonumber(currentCategory) or 0, tonumber(currentMenuItemID) or 0)
                        playSoundEffect("wrench", 0.4)
                        updateItem2TextOnly(currentMenu, tonumber(currentMenuItemID) or 0, "TAKILDI")
                        updateMenuStatus("")
                    else
                        QBCore.Functions.Notify('Paranız yok!', 'error')
                        updateMenuStatus("")
                    end
                elseif tonumber(currentCategory) == 11 or tonumber(currentCategory) == 12 or tonumber(currentCategory)== 13 or tonumber(currentCategory) == 15 or tonumber(currentCategory) == 16 then --Performance Upgrades
                    if AttemptPurchase("performance", tonumber(currentMenuItemID) or 0) then
                        ApplyMod(tonumber(currentCategory) or 0, tonumber(currentMenuItemID) or 0)
                        playSoundEffect("wrench", 0.4)
                        updateItem2TextOnly(currentMenu, tonumber(currentMenuItemID) or 0, "TAKILDI")
                        updateMenuStatus("")
                    else
                        QBCore.Functions.Notify('Paranız yok!', 'error')
                        updateMenuStatus("")
                    end
                else
                    if AttemptPurchase("cosmetics") then
                        ApplyMod(tonumber(currentCategory) or 0, tonumber(currentMenuItemID) or 0)
                        playSoundEffect("wrench", 0.4)
                        updateItem2TextOnly(currentMenu, tonumber(currentMenuItemID) or 0, "TAKILDI")
                        updateMenuStatus("")
                    else
                        QBCore.Functions.Notify('Paranız yok!', 'error')
                        updateMenuStatus("")
                    end
                end
            elseif isMenuActive("ResprayMenu") then
                if AttemptPurchase("respray") then
                    ApplyColour(tonumber(currentResprayCategory) or 0, tonumber(currentResprayType) or 0, tonumber(currentMenuItemID) or 0)
                    playSoundEffect("respray", 1.0)
                    updateItem2TextOnly(currentMenu, tonumber(currentMenuItemID) or 0, "TAKILDI")
                    updateMenuStatus("")
                else
                    QBCore.Functions.Notify('Paranız yok!', 'error')
                    updateMenuStatus("")
                end
            elseif isMenuActive("WheelsMenu") then
                -- Apply selected wheel mod
                if tonumber(currentWheelCategory) ~= -1 and tonumber(currentWheelCategory) ~= 20 then
                    if AttemptPurchase("wheels") then
                        ApplyWheel(tonumber(currentCategory) or 0, tonumber(currentMenuItemID) or 0, tonumber(currentWheelCategory) or 0)
                        playSoundEffect("wrench", 0.4)
                        updateItem2TextOnly(currentMenu, tonumber(currentMenuItemID) or 0, "TAKILDI")
                        updateMenuStatus("")
                    else
                        QBCore.Functions.Notify('Paranız yok!', 'error')
                        updateMenuStatus("")
                    end
                end
            elseif currentMenu == "TyreSmokeMenu" then
                -- Tyre smoke menu: Kapalı, Açık, renkler
                if tonumber(currentMenuItemID) == 0 then
                    -- Kapalı
                    ApplyTyreSmoke(0, 0, 0)
                    playSoundEffect("wrench", 0.4)
                    updateMenuStatus("Lastik dumanı kapalı")
                elseif tonumber(currentMenuItemID) == 1 then
                    -- Açık (varsayılan beyaz)
                    ApplyTyreSmoke(255, 255, 255)
                    playSoundEffect("wrench", 0.4)
                    updateMenuStatus("Lastik dumanı açık")
                else
                    -- Renkli duman
                    local v = vehicleTyreSmokeOptions[tonumber(currentMenuItemID)]
                    if v then
                        ApplyTyreSmoke(v.r or 255, v.g or 255, v.b or 255)
                        playSoundEffect("wrench", 0.4)
                        updateMenuStatus("Lastik dumanı rengi uygulandı")
                    end
                end
            elseif isMenuActive("NeonsSideMenu") then
                if AttemptPurchase("neonside") then
                    ApplyNeon(tonumber(currentNeonSide) or 0, tonumber(currentMenuItemID) or 0)
                    playSoundEffect("wrench", 0.4)
                    updateItem2TextOnly(currentMenu, tonumber(currentMenuItemID) or 0, "TAKILDI")
                    updateMenuStatus("")
                else
                    QBCore.Functions.Notify('Paranız yok!', 'error')
                    updateMenuStatus("")
                end
            else
                if currentMenu == "repairMenu" then
                    if AttemptPurchase("repair") then
                        currentMenu = "mainMenu"

                        RepairVehicle()

                        if not repairOnly then
                            toggleMenu(false, "repairMenu")
                            toggleMenu(true, currentMenu)
                        else
                            ExitBennys()
                            QBCore.Functions.Notify('Aracınız tamir edildi!')
                        end
                        updateMenuHeading(currentMenu)
                        updateMenuSubheading(currentMenu)
                        playSoundEffect("wrench", 0.4)
                        updateMenuStatus("")
                    else
                        QBCore.Functions.Notify('Paranız yok!', 'error')
                        updateMenuStatus("")
                    end
                elseif currentMenu == "mainMenu" then
                    -- Özel ID'li kategoriler için menü geçişi
                    if tonumber(currentMenuItemID) == -1 then -- Respray
                        currentMenu = "ResprayMenu"
                        toggleMenu(false, "mainMenu")
                        toggleMenu(true, currentMenu)
                        updateMenuHeading(currentMenu)
                        updateMenuSubheading(currentMenu)
                    elseif tonumber(currentMenuItemID) == -2 then -- Window Tint
                        currentMenu = "WindowTintMenu"
                        toggleMenu(false, "mainMenu")
                        toggleMenu(true, currentMenu)
                        updateMenuHeading(currentMenu)
                        updateMenuSubheading(currentMenu)
                    elseif tonumber(currentMenuItemID) == -3 then -- Neons
                        currentMenu = "NeonsMenu"
                        toggleMenu(false, "mainMenu")
                        toggleMenu(true, currentMenu)
                        updateMenuHeading(currentMenu)
                        updateMenuSubheading(currentMenu)
                    elseif tonumber(currentMenuItemID) == 22 then -- Xenons
                        currentMenu = "XenonsMenu"
                        toggleMenu(false, "mainMenu")
                        toggleMenu(true, currentMenu)
                        updateMenuHeading(currentMenu)
                        updateMenuSubheading(currentMenu)
                    elseif tonumber(currentMenuItemID) == 23 then -- Wheels
                        currentMenu = "WheelsMenu"
                        toggleMenu(false, "mainMenu")
                        toggleMenu(true, currentMenu)
                        updateMenuHeading(currentMenu)
                        updateMenuSubheading(currentMenu)
                    elseif tonumber(currentMenuItemID) == 24 then -- Old Livery
                        currentMenu = "OldLiveryMenu"
                        toggleMenu(false, "mainMenu")
                        toggleMenu(true, currentMenu)
                        updateMenuHeading(currentMenu)
                        updateMenuSubheading(currentMenu)
                    elseif tonumber(currentMenuItemID) == 25 then -- Plate Index
                        currentMenu = "PlateIndexMenu"
                        toggleMenu(false, "mainMenu")
                        toggleMenu(true, currentMenu)
                        updateMenuHeading(currentMenu)
                        updateMenuSubheading(currentMenu)
                    elseif tonumber(currentMenuItemID) == 26 then -- Vehicle Extras
                        currentMenu = "VehicleExtrasMenu"
                        toggleMenu(false, "mainMenu")
                        toggleMenu(true, currentMenu)
                        updateMenuHeading(currentMenu)
                        updateMenuSubheading(currentMenu)
                    else
                        -- Normal mod kategorileri için
                        currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                        currentCategory = tonumber(currentMenuItemID) or 0

                        toggleMenu(false, "mainMenu")
                        toggleMenu(true, currentMenu)
                        updateMenuHeading(currentMenu)
                        updateMenuSubheading(currentMenu)
                    end
                elseif currentMenu == "ResprayMenu" then
                    currentMenu = "ResprayTypeMenu"
                    currentResprayCategory = tonumber(currentMenuItemID) or 0

                    toggleMenu(false, "ResprayMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "ResprayTypeMenu" then
                    local targetMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    print("DEBUG: ResprayTypeMenu -> transitioning to:", targetMenu, "currentMenuItem:", currentMenuItem)
                    currentMenu = targetMenu
                    currentResprayType = tonumber(currentMenuItemID) or 0

                    toggleMenu(false, "ResprayTypeMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "WheelsMenu" then
                    local currentWheel, _, currentWheelType = GetCurrentWheel()
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentWheelCategory = tonumber(currentMenuItemID) or 0
                    -- Jant menüsüne girerken doğru modType'ı ayarla
                    if currentWheelCategory == 6 then -- Motosiklet jantı
                        currentCategory = 24
                    else
                        currentCategory = 23
                    end

                    toggleMenu(false, "WheelsMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "NeonsMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentNeonSide = tonumber(currentMenuItemID) or 0

                    toggleMenu(false, "NeonsMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "XenonsMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"

                    toggleMenu(false, "XenonsMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "WindowTintMenu" then
                    if AttemptPurchase("windowtint") then
                        ApplyWindowTint(tonumber(currentMenuItemID) or 0)
                        playSoundEffect("respray", 1.0)
                        updateItem2TextOnly(currentMenu, tonumber(currentMenuItemID) or 0, "TAKILDI")
                        updateMenuStatus("")
                    else
                        QBCore.Functions.Notify('Paranız yok!', 'error')
                        updateMenuStatus("")
                    end
                elseif currentMenu == "NeonColoursMenu" then
                    if AttemptPurchase("neoncolours") then
                        local r = vehicleNeonOptions.neonColours[tonumber(currentMenuItemID) or 1] and vehicleNeonOptions.neonColours[tonumber(currentMenuItemID) or 1].r or 255
                        local g = vehicleNeonOptions.neonColours[tonumber(currentMenuItemID) or 1] and vehicleNeonOptions.neonColours[tonumber(currentMenuItemID) or 1].g or 255
                        local b = vehicleNeonOptions.neonColours[tonumber(currentMenuItemID) or 1] and vehicleNeonOptions.neonColours[tonumber(currentMenuItemID) or 1].b or 255

                        ApplyNeonColour(r, g, b)
                        playSoundEffect("respray", 1.0)
                        updateItem2TextOnly(currentMenu, tonumber(currentMenuItemID) or 0, "TAKILDI")
                        updateMenuStatus("")
                    else
                        QBCore.Functions.Notify('Paranız yok!', 'error')
                        updateMenuStatus("")
                    end
                elseif currentMenu == "HeadlightsMenu" then
                    if AttemptPurchase("headlights") then
                        ApplyXenonLights(tonumber(currentCategory) or 0, tonumber(currentMenuItemID) or 0)
                        playSoundEffect("wrench", 0.4)
                        updateItem2TextOnly(currentMenu, tonumber(currentMenuItemID) or 0, "TAKILDI")
                        updateMenuStatus("")
                    else
                        QBCore.Functions.Notify('Paranız yok!', 'error')
                        updateMenuStatus("")
                    end
                elseif currentMenu == "XenonColoursMenu" then
                    if AttemptPurchase("xenoncolours") then
                        ApplyXenonColour(tonumber(currentMenuItemID) or 0)
                        playSoundEffect("respray", 1.0)
                        updateItem2TextOnly(currentMenu, tonumber(currentMenuItemID) or 0, "TAKILDI")
                        updateMenuStatus("")
                    else
                        QBCore.Functions.Notify('Paranız yok!', 'error')
                        updateMenuStatus("")
                    end
                elseif currentMenu == "OldLiveryMenu" then
                    if AttemptPurchase("oldlivery") then
                        ApplyOldLivery(tonumber(currentMenuItemID) or 0)
                        playSoundEffect("wrench", 0.4)
                        updateItem2TextOnly(currentMenu, tonumber(currentMenuItemID) or 0, "TAKILDI")
                        updateMenuStatus("")
                    else
                        QBCore.Functions.Notify('Paranız yok!', 'error')
                        updateMenuStatus("")
                    end
                elseif currentMenu == "PlateIndexMenu" then
                    if AttemptPurchase("plateindex") then
                        ApplyPlateIndex(tonumber(currentMenuItemID) or 0)
                        playSoundEffect("wrench", 0.4)
                        updateItem2TextOnly(currentMenu, tonumber(currentMenuItemID) or 0, "TAKILDI")
                        updateMenuStatus("")
                    else
                        QBCore.Functions.Notify('Paranız yok!', 'error')
                        updateMenuStatus("")
                    end
                elseif currentMenu == "VehicleExtrasMenu" then
                    ApplyExtra(tonumber(currentMenuItemID) or 0)
                    playSoundEffect("wrench", 0.4)
                    updateItem2TextOnly(currentMenu, tonumber(currentMenuItemID) or 0, "Toggle")
                    updateMenuStatus("")
                end
            end
        else
            if currentMenu == "VehicleExtrasMenu" then
                ApplyExtra(tonumber(currentMenuItemID) or 0)
                playSoundEffect("wrench", 0.4)
                updateItem2TextOnly(currentMenu, tonumber(currentMenuItemID) or 0, "Toggle")
                updateMenuStatus("")
            end
        end
    else
        updateMenuStatus("")

        if isMenuActive("modMenu") then
            toggleMenu(false, currentMenu)

            currentMenu = "mainMenu"

            if tonumber(currentCategory) ~= 18 then
                RestoreOriginalMod()
            end

            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        elseif isMenuActive("ResprayMenu") then
            toggleMenu(false, currentMenu)

            currentMenu = "ResprayTypeMenu"

            RestoreOriginalColours()

            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        elseif isMenuActive("WheelsMenu") then
            if tonumber(currentWheelCategory) ~= 20 and tonumber(currentWheelCategory) ~= -1 then
                local currentWheel = GetOriginalWheel()

                updateItem2TextOnly(currentMenu, tonumber(currentWheel) or 0, "$" .. vehicleCustomisationPrices.wheels.price)

                RestoreOriginalWheels()
            end

            toggleMenu(false, currentMenu)

            currentMenu = "WheelsMenu"


            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        elseif isMenuActive("NeonsSideMenu") then
            toggleMenu(false, currentMenu)

            currentMenu = "NeonsMenu"

            RestoreOriginalNeonStates()

            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        else
            if currentMenu == "mainMenu" or currentMenu == "repairMenu" then
                ExitBennys()
            elseif currentMenu == "ResprayMenu" or currentMenu == "WindowTintMenu" or currentMenu == "WheelsMenu" or currentMenu == "NeonsMenu" or currentMenu == "XenonsMenu" or currentMenu == "OldLiveryMenu" or currentMenu == "PlateIndexMenu" or currentMenu == "VehicleExtrasMenu" then
                toggleMenu(false, currentMenu)

                if currentMenu == "WindowTintMenu" then
                    RestoreOriginalWindowTint()
                end

                if currentMenu == "OldLiveryMenu" then
                    RestoreOldLivery()
                end
                if currentMenu == "PlateIndexMenu" then
                    RestorePlateIndex()
                end

                currentMenu = "mainMenu"

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "ResprayTypeMenu" then
                toggleMenu(false, currentMenu)

                currentMenu = "ResprayMenu"

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "NeonColoursMenu" then
                toggleMenu(false, currentMenu)

                currentMenu = "NeonsMenu"

                RestoreOriginalNeonColours()

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "HeadlightsMenu" then
                toggleMenu(false, currentMenu)

                currentMenu = "XenonsMenu"

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "XenonColoursMenu" then
                toggleMenu(false, currentMenu)

                currentMenu = "XenonsMenu"

                RestoreOriginalXenonColour()

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            end
        end
    end
end

-----------------------
----   Threads     ----
-----------------------

-----------------------
---- Client Events ----
-----------------------

RegisterNUICallback("selectedItem", function(data, cb)
    updateCurrentMenuItemID(tonumber(data.id), data.item, data.item2)
    cb("ok")
end)

RegisterNUICallback("menuItemClicked", function(data, cb)
    -- Handle menu item click - this replaces the Enter key functionality
    clickedMenuItemName = data.item -- Store clicked menu item name
    MenuManager(true, false)
    PlaySoundFrontend(-1, "OK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    cb("ok")
end)

RegisterNUICallback("toggleCameraMode", function(data, cb)
    -- Handle F key press from JavaScript to toggle camera mode
    print("DEBUG: toggleCameraMode callback çağrıldı")
    -- Bu fonksiyonu DisableControls thread'inde çağıracağız
    TriggerEvent('hb_mechanic:client:toggleCameraMode')
    cb("ok")
end)

RegisterNUICallback("goBack", function(data, cb)
    -- Handle back arrow click to return to previous menu
    MenuManager(false)
    cb("ok")
end)

RegisterNUICallback("updateItem2", function(data, cb)
    currentMenuItem2 = data.item
    cb("ok")
end)

RegisterNUICallback("exitMenu", function(data, cb)
    -- Handle exit button click to close menu and restore camera
    print("DEBUG: Exit button clicked - closing menu")
    ExitBennys()
    cb("ok")
end)
