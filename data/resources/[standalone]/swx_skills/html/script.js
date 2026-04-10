let skillBars = {};

window.addEventListener('message', function(event) {
    const data = event.data;
    
    switch(data.type) {
        case 'showSkillBar':
            showSkillBar(data);
            break;
        case 'hideSkillBar':
            hideSkillBar(data.skill);
            break;
        case 'updateSkill':
            updateSkill(data);
            break;
        case 'showAllSkills':
            showAllSkills(data.skills);
            break;
        case 'hideAllSkills':
            hideAllSkills();
            break;
    }
});

function showSkillBar(data) {
    const skillBarsContainer = document.getElementById('skill-bars');
    
    // Eğer bu skill zaten gösteriliyorsa güncelle
    if (skillBars[data.skill]) {
        updateSkillBar(data.skill, data.level, data.xp, data.requiredXP, data.config);
        return;
    }
    
    // Yeni skill bar oluştur
    const skillBar = createSkillBar(data.skill, data.level, data.xp, data.requiredXP, data.config);
    skillBarsContainer.appendChild(skillBar);
    skillBars[data.skill] = skillBar;
    
    // Belirli süre sonra gizle
    setTimeout(() => {
        hideSkillBar(data.skill);
    }, 5000);
}

function hideSkillBar(skillName) {
    if (skillBars[skillName]) {
        skillBars[skillName].remove();
        delete skillBars[skillName];
    }
}

function updateSkill(data) {
    if (skillBars[data.skill]) {
        updateSkillBar(data.skill, data.level, data.xp, data.requiredXP, data.config);
    }
}

function createSkillBar(skillName, level, xp, requiredXP, config) {
    const skillBar = document.createElement('div');
    skillBar.className = 'skill-bar';
    skillBar.id = `skill-${skillName}`;
    
    const progressPercent = Math.min((xp / requiredXP) * 100, 100);
    
    skillBar.innerHTML = `
        <div class="skill-icon" style="color: ${config.color}">
            <i class="${config.icon}"></i>
        </div>
        <div class="skill-info">
            <div class="skill-header">
                <div class="skill-name">${config.label}</div>
                <div class="skill-level" style="background: ${config.color}40">LVL ${level}</div>
            </div>
            <div class="skill-progress">
                <div class="skill-progress-bar" style="width: ${progressPercent}%; background: ${config.color}; color: ${config.color}"></div>
            </div>
        </div>
    `;
    
    return skillBar;
}

function updateSkillBar(skillName, level, xp, requiredXP, config) {
    const skillBar = document.getElementById(`skill-${skillName}`);
    if (!skillBar) return;
    
    const progressPercent = Math.min((xp / requiredXP) * 100, 100);
    
    skillBar.querySelector('.skill-name').textContent = config.label;
    skillBar.querySelector('.skill-level').textContent = `LVL ${level}`;
    skillBar.querySelector('.skill-level').style.background = `${config.color}40`;
    skillBar.querySelector('.skill-progress-bar').style.width = `${progressPercent}%`;
    skillBar.querySelector('.skill-progress-bar').style.background = config.color;
    skillBar.querySelector('.skill-progress-bar').style.color = config.color;
    
    // Level atladıysa animasyon ekle
    const progressBar = skillBar.querySelector('.skill-progress-bar');
    progressBar.classList.add('level-up-animation');
    setTimeout(() => {
        progressBar.classList.remove('level-up-animation');
    }, 600);
}

function showAllSkills(skills) {
    const skillBarsContainer = document.getElementById('skill-bars');
    skillBarsContainer.innerHTML = '';
    skillBars = {};
    
    skills.forEach(skill => {
        const skillBar = createSkillBar(skill.name, skill.level, skill.xp, skill.requiredXP, skill.config);
        skillBarsContainer.appendChild(skillBar);
        skillBars[skill.name] = skillBar;
    });
}

function hideAllSkills() {
    const skillBarsContainer = document.getElementById('skill-bars');
    skillBarsContainer.innerHTML = '';
    skillBars = {};
}
