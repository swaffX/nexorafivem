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
    console.log('[SWX Skills UI] showSkillBar:', data.skill, 'Level:', data.level, 'XP:', data.xp, '/', data.requiredXP);
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
}

function hideSkillBar(skillName) {
    if (skillBars[skillName]) {
        skillBars[skillName].remove();
        delete skillBars[skillName];
    }
}

function updateSkill(data) {
    console.log('[SWX Skills UI] updateSkill:', data.skill, 'Level:', data.level, 'XP:', data.xp, '/', data.requiredXP);
    
    if (skillBars[data.skill]) {
        // Var olan barı güncelle
        updateSkillBar(data.skill, data.level, data.xp, data.requiredXP, data.config);
    } else {
        // Bar yoksa oluştur ve göster
        showSkillBar(data);
    }
}

function createSkillBar(skillName, level, xp, requiredXP, config) {
    const skillBar = document.createElement('div');
    skillBar.className = 'skill-bar';
    skillBar.id = `skill-${skillName}`;
    
    const progressPercent = Math.min((xp / requiredXP) * 100, 100);
    
    // Format XP numbers with commas
    const currentXPFormatted = Math.floor(xp).toLocaleString();
    const requiredXPFormatted = requiredXP.toLocaleString();
    
    skillBar.innerHTML = `
        <div class="skill-name" style="color: ${config.color}">${config.label.toUpperCase()}</div>
        <div class="skill-levels">
            <div class="skill-level-current">${level}</div>
            <div class="skill-level-next">${level + 1}</div>
        </div>
        <div class="skill-progress-wrapper">
            <div class="skill-progress">
                <div class="skill-progress-bar" style="width: ${progressPercent}%; background: ${config.color}"></div>
            </div>
        </div>
        <div class="skill-xp-text">${currentXPFormatted} / ${requiredXPFormatted}</div>
    `;
    
    return skillBar;
}

function updateSkillBar(skillName, level, xp, requiredXP, config) {
    const skillBar = document.getElementById(`skill-${skillName}`);
    if (!skillBar) return;
    
    const progressPercent = Math.min((xp / requiredXP) * 100, 100);
    
    // Format XP numbers with commas
    const currentXPFormatted = Math.floor(xp).toLocaleString();
    const requiredXPFormatted = requiredXP.toLocaleString();
    
    skillBar.querySelector('.skill-name').textContent = config.label.toUpperCase();
    skillBar.querySelector('.skill-name').style.color = config.color;
    skillBar.querySelector('.skill-level-current').textContent = level;
    skillBar.querySelector('.skill-level-next').textContent = level + 1;
    skillBar.querySelector('.skill-progress-bar').style.width = `${progressPercent}%`;
    skillBar.querySelector('.skill-progress-bar').style.background = config.color;
    skillBar.querySelector('.skill-xp-text').textContent = `${currentXPFormatted} / ${requiredXPFormatted}`;
    
    // Level atladıysa animasyon ekle
    skillBar.classList.add('level-up-animation');
    setTimeout(() => {
        skillBar.classList.remove('level-up-animation');
    }, 800);
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
