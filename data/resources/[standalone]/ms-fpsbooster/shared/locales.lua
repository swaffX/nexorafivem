Locales = {}

Locales['tr'] = {
    -- UI Text
    ui = {
        -- Header
        brand_title = "MS BOOSTER",
        brand_subtitle = "Performans Ekranı",
        fps_boost_tab = "FPS Artır",
        optimizer_tab = "Optimize Et",
        
        -- Performance Presets
        presets_title = "Performans İçin Hazır Ayarlar",
        reset_settings = "Ayarları Sıfırla",
        
        high_quality = "Yüksek Kalite",
        high_quality_desc = "Tam görsel kalite. Tüm gölgeler, parçacıklar ve efektler aktif.",
        
        balanced = "Dengeli",
        balanced_desc = "Dengeli ayar. Optimize edilmiş dokular ve temel efektler.",
        
        fps_boost = "FPS Boost",
        fps_boost_desc = "Maksimum performans. Gölgeler kapalı, dokular azaltılmış.",
        
        -- Manual Overrides
        manual_overrides = "Manuel Ayarlar",
        
        disable_shadows = "Gölgeleri Kapat",
        disable_shadows_desc = "Gölgeleri kapat (FPS artışı)",
        
        disable_particles = "Partükülleri Kapat",
        disable_particles_desc = "Partükülleri ve Dumanları kapat (FPS artışı)",
        
        disable_water = "Su Efektini Kapat",
        disable_water_desc = "Okyanus dalgalarını düzleştir (FPS artışı)",
        
        disable_lights = "Işıkları Kapat",
        disable_lights_desc = "Şehir ışıklarını kapat (FPS artışı)",
        
        disable_fog = "Sisi Kapat",
        disable_fog_desc = "Kristal berraklıkta görüş (Sis yok)",
        
        disable_weather = "Havayı Sabitle",
        disable_weather_desc = "Hava durumunu Güneşli'ye kilitle (FPS artışı)",
        
        entity_optimizer = "Varlık Optimize",
        entity_optimizer_desc = "Ped/Araç ve Decal'ları azalt",
        
        disable_clouds = "Bulutları Kapat",
        disable_clouds_desc = "Bulutları kaldır (FPS artışı)",
        
        object_detail = "Obje Detayı",
        object_detail_desc = "Mesafe görünürlüğünü ayarla",
        
        visual_quality = "Görsel Kalite",
        visual_quality_desc = "Grafik kalite seviyesini seç",
        
        -- Dropdown Options
        high = "Yüksek",
        medium = "Orta",
        low = "Düşük",
        default = "Varsayılan",
        
        -- Admin Panel
        admin_only = "SADECE YETKİLİ PANELİ",
        system_live = "CANLI SİSTEM İZLEME",
        
        server_uptime = "Aktiflik Süresi",
        script_usage = "Script Kullanımı",
        latency = "Ms (Kişisel)",
        
        active_peds = "Aktif Pedler",
        vehicles = "Araçlar",
        prop_entities = "Prop Varlıkları",
        live = "Canlı",
        
        -- Command Center
        command_center = "Komuta Merkezi",
        
        global_purge = "Global Temizlik",
        global_purge_desc = "Dünyadaki TÜM kırık obje ve enkazları kaldır.",
        
        clear_vehicles = "Araçları Temizle",
        clear_vehicles_desc = "Kullanılmayan/hasarlı araçları kaldır.",
        
        clear_peds = "Pedleri Temizle",
        clear_peds_desc = "Ped yoğunluğunu sıfırla ve cesetleri kaldır.",
        
        clear_props = "Propları Temizle",
        clear_props_desc = "Network dışı prop ve objeleri temizle.",
        
        ready = "HAZIR",
        
        -- Status
        healthy = "Sağlıklı",
        normal = "Normal",
        excellent = "Mükemmel",
        optimized = "Optimize",
        high_latency = "Yüksek Gecikme",
        high_load = "Yüksek Yük",
        restart_rec = "Restart Önerilir",
        
        -- Footer
        footer_text = "MS Booster v1.0 • Kapatmak için ESC'ye basın"
    },
    
    -- Discord Webhook Messages
    discord = {
        admin_panel_title = "🎮 Admin Panel Açıldı (Optimizer)",
        admin_panel_desc = "Bir admin Optimizer panelini açtı.",
        
        cleanup_title = "🧹 Cleanup Komutu Kullanıldı",
        cleanup_desc = "Bir admin sunucu temizliği başlattı.",
        
        field_player = "👤 Oyuncu",
        field_status = "🔐 Durum",
        field_identifiers = "🆔 Identifiers",
        field_admin = "👤 Admin",
        field_cleanup_type = "🧹 Temizlik Türü",
        
        status_secure = "✅ Güvenli",
        
        cleanup_all = "🔥 Global Purge (Tümü)",
        cleanup_vehicles = "🚗 Araç Temizliği",
        cleanup_peds = "🚶 Ped Temizliği",
        cleanup_objects = "📦 Obje Temizliği",
        
        steam = "**Steam:**",
        steam_hex = "**Steam Hex:**",
        discord_id = "**Discord:**",
        license = "**License:**",
        not_found = "Bulunamadı"
    },
    
    -- Console Messages
    console = {
        exploit_warning = "^1[Exploit Warning]^7 Player %s (ID: %s) attempted to trigger cleanup without permission.",
        admin_action = "^2[Admin Action]^7 %s cleaned %s (%s removed)",
        global_purge = "^2[Admin Action]^7 Global Purge by %s | Vehicles: %s",
        countdown_finished = "^3[MS-FPSBooster] ^7Vehicle countdown finished. Starting vehicle cleanup (Triggered by: %s)...",
        cleanup_triggered = "^2[Admin Action]^7 Cleanup Triggered by %s | Type: %s | Removed: %s",
        client_cleanup = "^2[Admin Action]^7 Triggered client-side object cleanup for all players.",
        removed_props = "^2[MS-FPSBooster]^7 Removed %s broken props/debris."
    },
    
    -- Notifications
    notifications = {
        vehicle_warning = "⚠️ DİKKAT: Kullanılmayan araçlar 20 saniye sonra temizlenecektir! Lütfen aracınızın içinde durun."
    }
}

Locales['en'] = {
    -- UI Text
    ui = {
        -- Header
        brand_title = "MS BOOSTER",
        brand_subtitle = "Performance Screen",
        fps_boost_tab = "FPS Boost",
        optimizer_tab = "Optimizer",
        
        -- Performance Presets
        presets_title = "Performance Presets",
        reset_settings = "Reset Settings",
        
        high_quality = "High Quality",
        high_quality_desc = "Full visual fidelity. Enables all shadows, particles, and post-processing.",
        
        balanced = "Balanced",
        balanced_desc = "The sweet spot. Optimized textures with essential visual effects enabled.",
        
        fps_boost = "FPS Boost",
        fps_boost_desc = "Maximal performance. Disables shadows, reduces textures & distance.",
        
        -- Manual Overrides
        manual_overrides = "Manual Overrides",
        
        disable_shadows = "Disable Shadows",
        disable_shadows_desc = "Turn ON to disable shadows (FPS boost)",
        
        disable_particles = "Disable Particles",
        disable_particles_desc = "Turn ON to disable smoke & effects (FPS boost)",
        
        disable_water = "Disable Water FX",
        disable_water_desc = "Turn ON to flatten ocean waves (FPS boost)",
        
        disable_lights = "Disable Distant Lights",
        disable_lights_desc = "Turn ON to disable city lights (FPS boost)",
        
        disable_fog = "Disable Fog",
        disable_fog_desc = "Turn ON for crystal clear view (No Fog)",
        
        disable_weather = "Disable Weather Sync",
        disable_weather_desc = "Turn ON to lock weather to Sunny (FPS boost)",
        
        entity_optimizer = "Entity Optimizer",
        entity_optimizer_desc = "Turn ON to reduce Peds/Vehicles & Decals",
        
        disable_clouds = "Disable Clouds",
        disable_clouds_desc = "Turn ON to remove clouds (FPS boost)",
        
        object_detail = "Object Detail",
        object_detail_desc = "Adjust distance reliability",
        
        visual_quality = "Visual Quality",
        visual_quality_desc = "Select graphics quality level",
        
        -- Dropdown Options
        high = "High",
        medium = "Medium",
        low = "Low",
        default = "Default",
        
        -- Admin Panel
        admin_only = "ONLY ADMIN PANEL",
        system_live = "SYSTEM LIVE MONITOR",
        
        server_uptime = "Server Uptime",
        script_usage = "Script Usage",
        latency = "Ms (Personal)",
        
        active_peds = "Active Peds",
        vehicles = "Vehicles",
        prop_entities = "Prop Entities",
        live = "Live",
        
        -- Command Center
        command_center = "Command Center",
        
        global_purge = "Global Purge",
        global_purge_desc = "Remove ALL broken objects & debris from world.",
        
        clear_vehicles = "Clear Vehicles",
        clear_vehicles_desc = "Remove unused/damaged vehicles.",
        
        clear_peds = "Clear Peds",
        clear_peds_desc = "Reset pedestrian density & remove dead bodies.",
        
        clear_props = "Clear Props",
        clear_props_desc = "Clean non-networked props & objects.",
        
        ready = "READY",
        
        -- Status
        healthy = "Healthy",
        normal = "Normal",
        excellent = "Excellent",
        optimized = "Optimized",
        high_latency = "High Latency",
        high_load = "High Load",
        restart_rec = "Restart Rec.",
        
        -- Footer
        footer_text = "MS Booster v1.0 • Press ESC to close"
    },
    
    -- Discord Webhook Messages
    discord = {
        admin_panel_title = "🎮 Admin Panel Opened (Optimizer)",
        admin_panel_desc = "An admin opened the Optimizer panel.",
        
        cleanup_title = "🧹 Cleanup Command Used",
        cleanup_desc = "An admin started server cleanup.",
        
        field_player = "👤 Player",
        field_status = "🔐 Status",
        field_identifiers = "🆔 Identifiers",
        field_admin = "👤 Admin",
        field_cleanup_type = "🧹 Cleanup Type",
        
        status_secure = "✅ Secure",
        
        cleanup_all = "🔥 Global Purge (All)",
        cleanup_vehicles = "🚗 Vehicle Cleanup",
        cleanup_peds = "🚶 Ped Cleanup",
        cleanup_objects = "📦 Object Cleanup",
        
        steam = "**Steam:**",
        steam_hex = "**Steam Hex:**",
        discord_id = "**Discord:**",
        license = "**License:**",
        not_found = "Not Found"
    },
    
    -- Console Messages
    console = {
        exploit_warning = "^1[Exploit Warning]^7 Player %s (ID: %s) attempted to trigger cleanup without permission.",
        admin_action = "^2[Admin Action]^7 %s cleaned %s (%s removed)",
        global_purge = "^2[Admin Action]^7 Global Purge by %s | Vehicles: %s",
        countdown_finished = "^3[MS-FPSBooster] ^7Vehicle countdown finished. Starting vehicle cleanup (Triggered by: %s)...",
        cleanup_triggered = "^2[Admin Action]^7 Cleanup Triggered by %s | Type: %s | Removed: %s",
        client_cleanup = "^2[Admin Action]^7 Triggered client-side object cleanup for all players.",
        removed_props = "^2[MS-FPSBooster]^7 Removed %s broken props/debris."
    },
    
    -- Notifications
    notifications = {
        vehicle_warning = "⚠️ WARNING: Unused vehicles will be cleaned in 20 seconds! Please stay in your vehicle."
    }
}
