let skillBars = {};
let hideTimers = {};

window.addEventListener('message', function(event) {
    const data = event.data;
    switch(data.type) {
        case 'showSkillBar':  showSkillBar(data);          break;
        case 'hideSkillBar':  hideSkillBar(data.skill);    break;
        case 'updateSkill':   updateSkill(data);           break;
        case 'showAllSkills': showAllSkills(data.skills);  break;
        case 'hideAllSkills': hideAllSkills();             break;
    }
});

function fmt(n) {
    return Math.floor(n).toLocaleString('de-DE');
}

function createSkillBar(skillName, level, xp, requiredXP, config) {
    const el = document.createElement('div');
    el.className = 'skill-bar';
    el.id = `skill-${skillName}`;

    const pct = Math.min((xp / requiredXP) * 100, 100);

    el.innerHTML = `
        <div class="skill-name">${config.label.toUpperCase()}</div>
        <div class="skill-row">
            <span class="skill-level-num">${level}</span>
            <div class="skill-progress">
                <div class="skill-progress-bar" style="width:0%"></div>
            </div>
            <span class="skill-level-num">${level + 1}</span>
        </div>
        <div class="skill-xp-text">${fmt(xp)} / ${fmt(requiredXP)}</div>
    `;

    // Animate bar after mount
    requestAnimationFrame(() => {
        requestAnimationFrame(() => {
            el.querySelector('.skill-progress-bar').style.width = pct + '%';
        });
    });

    return el;
}

function showSkillBar(data) {
    const container = document.getElementById('skill-bars');

    // Clear pending hide timer
    if (hideTimers[data.skill]) {
        clearTimeout(hideTimers[data.skill]);
        delete hideTimers[data.skill];
    }

    if (skillBars[data.skill]) {
        // Already visible – just update values
        updateBarDOM(data.skill, data.level, data.xp, data.requiredXP);
        // Remove hiding class if mid-animation
        skillBars[data.skill].classList.remove('hiding');
        return;
    }

    const el = createSkillBar(data.skill, data.level, data.xp, data.requiredXP, data.config);
    container.appendChild(el);
    skillBars[data.skill] = el;
}

function hideSkillBar(skillName) {
    const el = skillBars[skillName];
    if (!el) return;

    el.classList.add('hiding');
    hideTimers[skillName] = setTimeout(() => {
        el.remove();
        delete skillBars[skillName];
        delete hideTimers[skillName];
    }, 500); // Match fadeOutDown duration
}

function updateBarDOM(skillName, level, xp, requiredXP) {
    const el = skillBars[skillName];
    if (!el) return;
    const pct = Math.min((xp / requiredXP) * 100, 100);
    el.querySelector('.skill-name');                                    // unchanged
    const nums = el.querySelectorAll('.skill-level-num');
    nums[0].textContent = level;
    nums[1].textContent = level + 1;
    el.querySelector('.skill-progress-bar').style.width = pct + '%';
    el.querySelector('.skill-xp-text').textContent = `${fmt(xp)} / ${fmt(requiredXP)}`;
}

function updateSkill(data) {
    if (skillBars[data.skill]) {
        updateBarDOM(data.skill, data.level, data.xp, data.requiredXP);
    } else {
        showSkillBar(data);
    }
}

function showAllSkills(skills) {
    hideAllSkills();
    skills.forEach(s => showSkillBar({
        skill: s.name, level: s.level, xp: s.xp, requiredXP: s.requiredXP, config: s.config
    }));
}

function hideAllSkills() {
    Object.keys(skillBars).forEach(name => hideSkillBar(name));
}
