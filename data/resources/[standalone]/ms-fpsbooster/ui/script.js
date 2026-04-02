let currentTranslations = null;

window.addEventListener('message', function (event) {
    const data = event.data;

    if (data.action === "open") {
        document.body.classList.add('active');

        if (data.translations) {
            currentTranslations = data.translations;
            applyTranslations(data.translations);
        }

        if (data.isAdmin) {
            document.getElementById('main-nav-tabs').style.display = "flex";
            document.getElementById('admin-tab-btn').style.display = "block";
            if (data.stats) updateStats(data.stats);
        } else {
            document.getElementById('main-nav-tabs').style.display = "none";
            document.getElementById('admin-tab-btn').style.display = "none";
        }
    } else if (data.action === "close") {
        document.body.classList.remove('active');
    } else if (data.action === "updateStats") {
        if (data.stats) updateStats(data.stats);
    } else if (data.action === "updateInterface") {
        if (data.visual) {
            let val = data.visual.charAt(0).toUpperCase() + data.visual.slice(1);
            if (currentTranslations) {
                if (data.visual === 'high') val = currentTranslations.high;
                if (data.visual === 'medium') val = currentTranslations.medium;
                if (data.visual === 'low') val = currentTranslations.low;
                if (data.visual === 'default') val = currentTranslations.default;
            }
            document.querySelector('#quality-dropdown .select-selected').innerHTML = val;
        }
        if (data.lod) {
            let val = data.lod.charAt(0).toUpperCase() + data.lod.slice(1);
            if (currentTranslations) {
                if (data.lod === 'high') val = currentTranslations.high;
                if (data.lod === 'medium') val = currentTranslations.medium;
                if (data.lod === 'low') val = currentTranslations.low;
                if (data.lod === 'default') val = currentTranslations.default;
            }
            document.querySelector('#lod-dropdown .select-selected').innerHTML = val;
        }
        if (data.toggles) {
            for (const [key, value] of Object.entries(data.toggles)) {
                const checkbox = document.getElementById(`check-${key}`);
                if (checkbox) checkbox.checked = value;
            }
        }
    }
});

document.querySelectorAll('.nav-btn').forEach(btn => {
    btn.addEventListener('click', () => {
        document.querySelectorAll('.nav-btn').forEach(b => b.classList.remove('active'));
        document.querySelectorAll('.tab-content').forEach(t => t.classList.remove('active'));

        btn.classList.add('active');
        document.getElementById(`${btn.dataset.tab}-tab`).classList.add('active');

        if (btn.dataset.tab === 'admin') {
            fetch(`https://${GetParentResourceName()}/optimizerAccessed`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json; charset=UTF-8' },
                body: JSON.stringify({})
            });
        }
    });
});

document.addEventListener('keydown', function (event) {
    if (event.key === "Escape") {
        closeUI();
    }
});

function closeUI() {
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify({})
    });
}

function applyPreset(level) {
    const card = document.getElementById(`card-${level}`);
    if (card.classList.contains('active')) return;

    document.querySelectorAll('.fps-card').forEach(card => card.classList.remove('active'));
    card.classList.add('active');

    fetch(`https://${GetParentResourceName()}/applyPreset`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify({ preset: level })
    });
}

function toggleOption(option) {
    const checked = event.target.checked;
    fetch(`https://${GetParentResourceName()}/toggleOption`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify({ option: option, state: checked })
    });
}

function setVisualQuality(level) {
    document.querySelectorAll('.preset-card').forEach(card => card.classList.remove('active'));

    fetch(`https://${GetParentResourceName()}/setVisualQuality`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify({ quality: level })
    });
}

function toggleDropdown(id) {
    const dropdown = document.getElementById(id);
    const items = dropdown.querySelector('.select-items');
    const selected = dropdown.querySelector('.select-selected');

    document.querySelectorAll('.custom-select').forEach(d => {
        if (d.id !== id) {
            d.querySelector('.select-items').classList.add('select-hide');
            d.querySelector('.select-selected').classList.remove('select-arrow-active');
        }
    });

    items.classList.toggle('select-hide');
    selected.classList.toggle('select-arrow-active');
}

function selectOption(dropdownId, value, text, type) {
    const dropdown = document.getElementById(dropdownId);
    const selected = dropdown.querySelector('.select-selected');
    selected.innerHTML = text;
    toggleDropdown(dropdownId);

    if (type === 'visual') {
        setVisualQuality(value);
    } else if (type === 'lod') {
        setObjectDetail(value);
    }
}

function setObjectDetail(level) {
    fetch(`https://${GetParentResourceName()}/setObjectDetail`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify({ level: level })
    });
}

window.onclick = function (event) {
    if (!event.target.closest('.custom-select')) {
        document.querySelectorAll('.select-items').forEach(items => {
            items.classList.add('select-hide');
        });
        document.querySelectorAll('.select-selected').forEach(selected => {
            selected.classList.remove('select-arrow-active');
        });
    }
}

function triggerReset() {
    document.querySelectorAll('.fps-card').forEach(card => card.classList.remove('active'));

    fetch(`https://${GetParentResourceName()}/resetSettings`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify({})
    });
}

function triggerCleanup(type) {
    fetch(`https://${GetParentResourceName()}/triggerCleanup`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify({ type: type })
    });
}

function updateStats(stats) {
    if (!stats) return;

    document.getElementById('stat-peds').innerText = stats.peds || 0;
    document.getElementById('stat-vehicles').innerText = stats.vehicles || 0;
    document.getElementById('stat-objects').innerText = stats.objects || 0;

    const ping = stats.ping || 0;
    const pingEl = document.getElementById('stat-ping');
    if (pingEl) pingEl.innerText = ping + " ms";

    const pingStatus = document.getElementById('status-ping');
    const pingBar = document.getElementById('bar-ping');
    if (pingStatus && pingBar) {
        pingStatus.className = 't-status';

        let pingPct = (ping / 100) * 100;
        if (pingPct > 100) pingPct = 100;
        pingBar.style.width = pingPct + "%";

        if (ping < 40) {
            pingStatus.innerText = currentTranslations ? currentTranslations.excellent : "Excellent";
            pingBar.style.backgroundColor = "var(--success)";
            pingBar.style.boxShadow = "0 0 10px var(--success)";
            pingStatus.style.color = "var(--success)";
            pingStatus.style.borderColor = "rgba(16, 185, 129, 0.2)";
            pingStatus.style.background = "rgba(16, 185, 129, 0.1)";
        } else if (ping < 80) {
            pingStatus.innerText = currentTranslations ? currentTranslations.normal : "Normal";
            pingStatus.classList.add('warning');
            pingBar.style.backgroundColor = "var(--warning)";
            pingBar.style.boxShadow = "0 0 10px var(--warning)";
        } else {
            pingStatus.innerText = currentTranslations ? currentTranslations.high_latency : "High Latency";
            pingStatus.classList.add('danger');
            pingBar.style.backgroundColor = "var(--danger)";
            pingBar.style.boxShadow = "0 0 10px var(--danger)";
        }
    }

    const ram = parseFloat(stats.ram) || 0;
    const ramEl = document.getElementById('stat-ram');
    if (ramEl) ramEl.innerText = ram + " MB";

    const ramStatus = document.getElementById('status-ram');
    const ramBar = document.getElementById('bar-ram');
    if (ramStatus && ramBar) {
        ramStatus.className = 't-status';

        let ramPct = (ram / 5.0) * 100;
        if (ramPct > 100) ramPct = 100;
        ramBar.style.width = ramPct + "%";

        if (ram < 3.0) {
            ramStatus.innerText = currentTranslations ? currentTranslations.optimized : "Optimized";
            ramBar.style.backgroundColor = "var(--success)";
            ramBar.style.boxShadow = "0 0 10px var(--success)";
            ramStatus.style.color = "var(--success)";
            ramStatus.style.borderColor = "rgba(16, 185, 129, 0.2)";
            ramStatus.style.background = "rgba(16, 185, 129, 0.1)";
        } else if (ram < 5.0) {
            ramStatus.innerText = currentTranslations ? currentTranslations.normal : "Normal";
            ramStatus.classList.add('warning');
            ramBar.style.backgroundColor = "var(--warning)";
            ramBar.style.boxShadow = "0 0 10px var(--warning)";
        } else {
            ramStatus.innerText = currentTranslations ? currentTranslations.high_load : "High Load";
            ramStatus.classList.add('danger');
            ramBar.style.backgroundColor = "var(--danger)";
            ramBar.style.boxShadow = "0 0 10px var(--danger)";
        }
    }

    const uptimeStr = stats.uptime || "0h 0m";
    const uptimeEl = document.getElementById('stat-uptime');
    if (uptimeEl) uptimeEl.innerText = uptimeStr;

    const uptimeStatus = document.getElementById('status-uptime');
    const uptimeBar = document.getElementById('bar-uptime');
    if (uptimeStatus && uptimeBar) {
        let hours = 0;
        if (typeof uptimeStr === 'string' && uptimeStr.includes('h')) {
            hours = parseFloat(uptimeStr.split('h')[0]) || 0;
        }

        let uptimePct = (hours / 10.0) * 100;
        if (uptimePct > 100) uptimePct = 100;
        uptimeBar.style.width = uptimePct + "%";

        uptimeStatus.className = 't-status';
        if (hours < 5) {
            uptimeStatus.innerText = currentTranslations ? currentTranslations.healthy : "Healthy";
            uptimeBar.style.backgroundColor = "var(--success)";
            uptimeBar.style.boxShadow = "0 0 10px var(--success)";
            uptimeStatus.style.color = "var(--success)";
            uptimeStatus.style.borderColor = "rgba(16, 185, 129, 0.2)";
            uptimeStatus.style.background = "rgba(16, 185, 129, 0.1)";
        } else if (hours < 10) {
            uptimeStatus.innerText = currentTranslations ? currentTranslations.normal : "Normal";
            uptimeStatus.classList.add('warning');
            uptimeBar.style.backgroundColor = "var(--warning)";
            uptimeBar.style.boxShadow = "0 0 10px var(--warning)";
        } else {
            uptimeStatus.innerText = currentTranslations ? currentTranslations.restart_rec : "Restart Rec.";
            uptimeStatus.classList.add('danger');
            uptimeBar.style.boxShadow = "0 0 10px var(--danger)";
        }
    }
}

function applyTranslations(t) {
    if (!t) return;

    const brandTitle = document.querySelector('.logo-text h1');
    if (brandTitle) brandTitle.textContent = t.brand_title;

    const brandSubtitle = document.querySelector('.logo-text span');
    if (brandSubtitle) brandSubtitle.textContent = t.brand_subtitle;

    const fpsTabBtn = document.querySelector('.nav-btn[data-tab="fps"]');
    if (fpsTabBtn) fpsTabBtn.innerHTML = `<i class="fa-solid fa-gauge-high" style="margin-right: 8px;"></i>${t.fps_boost_tab}`;

    const adminTabBtn = document.getElementById('admin-tab-btn');
    if (adminTabBtn) adminTabBtn.innerHTML = `<i class="fa-solid fa-server" style="margin-right: 8px;"></i>${t.optimizer_tab}`;

    const presetsTitle = document.querySelector('#fps-tab .section-header-row .title');
    if (presetsTitle) presetsTitle.innerHTML = `<i class="fa-solid fa-layer-group"></i> ${t.presets_title}`;

    const resetBtn = document.querySelector('.reset-mini-btn');
    if (resetBtn) resetBtn.innerHTML = `<i class="fa-solid fa-rotate-left"></i> ${t.reset_settings}`;

    const cardHigh = document.querySelector('#card-high');
    if (cardHigh) {
        cardHigh.querySelector('.card-title').textContent = t.high_quality;
        cardHigh.querySelector('.card-desc').textContent = t.high_quality_desc;
    }

    const cardMedium = document.querySelector('#card-medium');
    if (cardMedium) {
        cardMedium.querySelector('.card-title').textContent = t.balanced;
        cardMedium.querySelector('.card-desc').textContent = t.balanced_desc;
    }

    const cardLow = document.querySelector('#card-low');
    if (cardLow) {
        cardLow.querySelector('.card-title').textContent = t.fps_boost;
        cardLow.querySelector('.card-desc').textContent = t.fps_boost_desc;
    }

    const manualTitle = document.querySelector('.section-title');
    if (manualTitle) manualTitle.innerHTML = `<i class="fa-solid fa-sliders"></i> ${t.manual_overrides}`;

    const updateToggle = (id, title, desc) => {
        const el = document.getElementById(id)?.closest('.toggle-item');
        if (el) {
            el.querySelector('h4').textContent = title;
            el.querySelector('p').textContent = desc;
        }
    };

    updateToggle('check-shadows', t.disable_shadows, t.disable_shadows_desc);
    updateToggle('check-particles', t.disable_particles, t.disable_particles_desc);
    updateToggle('check-water', t.disable_water, t.disable_water_desc);
    updateToggle('check-lights', t.disable_lights, t.disable_lights_desc);
    updateToggle('check-fog', t.disable_fog, t.disable_fog_desc);
    updateToggle('check-weather', t.disable_weather, t.disable_weather_desc);
    updateToggle('check-entity', t.entity_optimizer, t.entity_optimizer_desc);
    updateToggle('check-clouds', t.disable_clouds, t.disable_clouds_desc);

    const updateDropdown = (id, title, desc, options) => {
        const dropdown = document.getElementById(id);
        if (!dropdown) return;

        const el = dropdown.closest('.quality-controls').parentElement.querySelector('.toggle-info');
        if (el) {
            el.querySelector('h4').textContent = title;
            el.querySelector('p').textContent = desc;
        }

        if (options) {
            const items = dropdown.querySelectorAll('.select-item');
            if (items.length >= 3) {
                items[0].textContent = options.high || 'High';
                items[1].textContent = options.medium || 'Medium';
                items[2].textContent = options.low || 'Low';
            }

            const selected = dropdown.querySelector('.select-selected');
            if (selected) {
                const current = selected.textContent.trim();
                if (current === 'High' || current === 'Yüksek') selected.textContent = options.high;
                else if (current === 'Medium' || current === 'Orta') selected.textContent = options.medium;
                else if (current === 'Low' || current === 'Düşük') selected.textContent = options.low;
                else if (current === 'Default' || current === 'Varsayılan') selected.textContent = options.default;
            }
        }
    };

    updateDropdown('lod-dropdown', t.object_detail, t.object_detail_desc, { high: t.high, medium: t.medium, low: t.low, default: t.default });
    updateDropdown('quality-dropdown', t.visual_quality, t.visual_quality_desc, { high: t.high, medium: t.medium, low: t.low, default: t.default });

    const liveInd1 = document.querySelectorAll('.live-indicator')[0];
    if (liveInd1) liveInd1.innerHTML = `<i class="fa-solid fa-lock" style="font-size: 9px;"></i> ${t.admin_only}`;

    const liveInd2 = document.querySelectorAll('.live-indicator')[1];
    if (liveInd2) liveInd2.innerHTML = `<span class="pulse-dot"></span> ${t.system_live}`;

    const telCards = document.querySelectorAll('.telemetry-card');
    if (telCards[0]) telCards[0].querySelector('.t-label').textContent = t.server_uptime;
    if (telCards[1]) telCards[1].querySelector('.t-label').textContent = t.script_usage;
    if (telCards[2]) telCards[2].querySelector('.t-label').textContent = t.latency;

    const eCards = document.querySelectorAll('.e-card');
    if (eCards[0]) {
        eCards[0].querySelector('.e-header').textContent = t.active_peds;
        eCards[0].querySelector('.e-trend').innerHTML = `<i class="fa-solid fa-wifi"></i> ${t.live}`;
    }
    if (eCards[1]) {
        eCards[1].querySelector('.e-header').textContent = t.vehicles;
        eCards[1].querySelector('.e-trend').innerHTML = `<i class="fa-solid fa-wifi"></i> ${t.live}`;
    }
    if (eCards[2]) {
        eCards[2].querySelector('.e-header').textContent = t.prop_entities;
        eCards[2].querySelector('.e-trend').innerHTML = `<i class="fa-solid fa-wifi"></i> ${t.live}`;
    }

    const cmdHeader = document.querySelector('#admin-tab .section-header-row .title');
    if (cmdHeader) cmdHeader.innerHTML = `<i class="fa-solid fa-terminal"></i> ${t.command_center}`;

    const cmdCards = document.querySelectorAll('.command-card');
    if (cmdCards[0]) {
        cmdCards[0].querySelector('h3').textContent = t.global_purge;
        cmdCards[0].querySelector('p').textContent = t.global_purge_desc;
        cmdCards[0].querySelector('.cmd-status').textContent = t.ready;
    }
    if (cmdCards[1]) {
        cmdCards[1].querySelector('h3').textContent = t.clear_vehicles;
        cmdCards[1].querySelector('p').textContent = t.clear_vehicles_desc;
    }
    if (cmdCards[2]) {
        cmdCards[2].querySelector('h3').textContent = t.clear_peds;
        cmdCards[2].querySelector('p').textContent = t.clear_peds_desc;
    }
    if (cmdCards[3]) {
        cmdCards[3].querySelector('h3').textContent = t.clear_props;
        cmdCards[3].querySelector('p').textContent = t.clear_props_desc;
    }

    const footer = document.querySelector('footer span');
    if (footer) footer.textContent = t.footer_text;
}
