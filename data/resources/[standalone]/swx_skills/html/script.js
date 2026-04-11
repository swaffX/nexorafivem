let skillBars = {};
let hideTimers = {};
let currentXPValues = {}; // Store current XP values for animation

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

// Counting animation for numbers
function animateNumber(element, start, end, duration) {
    const startTime = performance.now();
    const startTimeValue = start;
    const endTimeValue = end;

    function update(currentTime) {
        const elapsed = currentTime - startTime;
        const progress = Math.min(elapsed / duration, 1);

        // Ease out cubic
        const easeProgress = 1 - Math.pow(1 - progress, 3);

        const currentValue = startTimeValue + (endTimeValue - startTimeValue) * easeProgress;
        element.textContent = fmt(currentValue);

        if (progress < 1) {
            requestAnimationFrame(update);
        }
    }

    requestAnimationFrame(update);
}

function createSkillBar(skillName, level, xp, requiredXP, config) {
    const el = document.createElement('div');
    el.className = 'skill-bar';
    el.id = `skill-${skillName}`;

    const pct = Math.min((xp / requiredXP) * 100, 100);

    // Initialize current XP value
    currentXPValues[skillName] = 0;

    el.innerHTML = `
        <div class="skill-name">${config.label.toUpperCase()}</div>
        <div class="skill-row">
            <span class="skill-level-num">${level}</span>
            <div class="skill-progress">
                <div class="skill-progress-bar" style="width:0%"></div>
            </div>
            <span class="skill-level-num">${level + 1}</span>
        </div>
        <div class="skill-xp-text">
            <span class="xp-current">${fmt(0)}</span> / <span class="xp-required">${fmt(requiredXP)}</span>
        </div>
    `;

    // Animate bar and XP after mount
    requestAnimationFrame(() => {
        requestAnimationFrame(() => {
            el.querySelector('.skill-progress-bar').style.width = pct + '%';
            const xpCurrent = el.querySelector('.xp-current');
            animateNumber(xpCurrent, 0, xp, 2000);
            currentXPValues[skillName] = xp;
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

    // Update required XP (no animation needed)
    el.querySelector('.xp-required').textContent = fmt(requiredXP);

    // Animate current XP number
    const xpCurrent = el.querySelector('.xp-current');
    const oldXP = currentXPValues[skillName] || 0;
    currentXPValues[skillName] = xp;
    animateNumber(xpCurrent, oldXP, xp, 2000); // 2 second animation
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
