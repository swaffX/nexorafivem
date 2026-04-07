let rules = true
let gallery = true
let media = true
let team = true
let updates = true
let music = true
let video = true

function convertValue (value, oldMin, oldMax, newMin, newMax) {
    const oldRange = oldMax - oldMin
    const newRange = newMax - newMin
    const newValue = ((value - oldMin) * newRange) / oldRange + newMin
    return newValue
}

$(async function () {
    // Fallback config (tarayıcıda file:// ile fetch çalışmaz, FiveM NUI'de çalışır)
    const fallbackConfig = {
        "Rules": [
            { "title": "Kural 1", "rule": "ADK DDK MDK Yasaktır" },
            { "title": "Kural 2", "rule": "TT Yasaktır" },
            { "title": "Kural 3", "rule": "RDM VDM Yasaktır" }
        ],
        "Gallery": [],
        "Team": [
            { "img": "swaffdev.gif", "rank": "Developer", "name": "swaffdev" },
            { "img": "oguzdev.gif", "rank": "Developer", "name": "oguzxdev" }
        ],
        "Updates": [
            { "img": "", "title": "Nexora Roleplay Açıldı!", "update": "Sunucumuz yepyeni içeriklerle hizmetinize açıldı." },
            { "img": "", "title": "Performans Güncellemesi", "update": "FPS optimizasyonları ve bug fixleri uygulandı." }
        ],
        "Music": [
            { "name": "ÇIKTIN KARŞIMA 2.0", "author": "DEEPRISE & JABBAR ft. UZI", "path": "../music.mp3" }
        ],
        "Keys": {
            "1": { "title": "Telefon", "description": "Telefonu açmanızı sağlar" },
            "2": { "title": "Envanter", "description": "Envanteri açmanızı sağlar" },
            "3": { "title": "Radialmenu", "description": "Radialmenu açmanızı sağlar" }
        },
        "Discord": "https://discord.gg/Nexora",
        "Instagram": "yok",
        "Youtube": "yok"
    };

    let Config;
    try {
        Config = await fetch(`../config.json`).then((res) => res.json());
    } catch (e) {
        console.log("[izzy_loading] Config fetch failed, using fallback config");
        Config = fallbackConfig;
    }

    let rulehtml = ''
    let galleryhtml = ''
    let teamhtml = ''
    let updatehtml = ''
    let keys = Config.Keys

    for (const key in keys) {
		const data = keys[key]
		const $el = $(`[data-key="${key}"]`)

		$el.addClass("selectkey")

		$el.click(() => {
			$(".keyInfoBox").html(`
            <div class="keyInfo">
              <div class="keyIcon">${key.toLocaleUpperCase()}</div>
              <h2>
              ${data.title}
                <p>${data.description}</p>
              </h2>
            </div>`)
		})
	}

    $(".keyboardBox>div").data("key", function(){
        console.log()
    });

    Config.Rules.forEach(rule => {
        rulehtml += `
        <div class="rulesBox">
            <h2>
                <span>${rule.title}</span>
                <p>${rule.rule}</p>
            </h2>
        </div>`
    });

    Config.Gallery.forEach(photo => {
        if (photo && photo.length > 0) {
            galleryhtml += `<img src="img/gallery/${photo}" class="galleryImg"/>`
        }
    });

    Config.Team.forEach(member => {
        teamhtml += `
        <div class="teamBox">
            <div class="teamProfileImg" style="background-image: url(${member.img});"></div>
            <div class="teamName">${member.name}</div>
            <h2 class="teamRank">${member.rank}</h2>
        </div>`

    });

    Config.Updates.forEach(update => {
        updatehtml += `
        <div class="updateBox" style="background-image: url(img/updates/${update.img})">
            <h2>
                <span>${update.title}</span>
                <p>${update.update}</p>
            </h2>
        </div>`
    });

    $(".updateListBox").html(updatehtml)
    $(".teamListBox").html(teamhtml)
    $(".imagesWrapper").html(galleryhtml)
    $(".rulesList").html(rulehtml)

    $(".galleryImg").click(function(){
        $(".galleryBig img").attr("src", $(this).attr("src"))
        $(".galleryBig").fadeIn()
    })

    $(".galleryBig").click(function(){
        $(".galleryBig").fadeOut()
    })

    $("#hideBtn").click(function(){
        $("#rulesBtn").click()
        $("#galleryBox").click()
        $("#socialBtn").click()
        $("#teamBtn").click()
        $("#updatesBtn").click()
        $("#musicBtn").click()
    })

    $("#keysBtn").click(function(){
        $(".keyboardSide-wrapper").fadeIn()
    })

    $(".keyboardExitBox").click(function(){
        $(".keyboardSide-wrapper").fadeOut()
    })

    $("#rulesBtn").click(function(){
        if(rules){
            rules = false
            $(".serverRules").css({
                transform: "translateX(-27vw)",
            })
            $(this).css({
                rotate: "180deg",
                transform: "translateX(-100px)",
            })
        }else{
            rules = true
            $(".serverRules").css({
                transform: "translateX(0)",
            })
            $(this).css({
                rotate: "0deg",
                transform: "translateX(0)",
            })
        }
    })

    $("#socialBtn").click(function(){
        if(media){
            media = false
            $(".socialMediaBox").css({
                transform: "translateX(-27vw)",
            })
            $(this).css({
                rotate: "180deg",
                transform: "translateX(-100px)",
            })
        }else{
            media = true
            $(".socialMediaBox").css({
                transform: "translateX(0)",
            })
            $(this).css({
                rotate: "0deg",
                transform: "translateX(0)",
            })
        }
    })

    $("#teamBtn").click(function(){
        if(team){
            team = false
            $(".authorizedTeamBox").css({
                transform: "translateX(24vw)",
            })
            $(this).css({
                rotate: "180deg",
                transform: "translateX(100px)",
            })
        }else{
            team = true
            $(".authorizedTeamBox").css({
                transform: "translateX(0)",
            })
            $(this).css({
                rotate: "0deg",
                transform: "translateX(0)",
            })
        }
    })

    $("#updatesBtn").click(function(){
        if(updates){
            updates = false
            $(".serverUpdateBox").css({
                transform: "translateX(24vw)",
            })
            $(this).css({
                rotate: "180deg",
                transform: "translateX(100px)",
            })
        }else{
            updates = true
            $(".serverUpdateBox").css({
                transform: "translateX(0)",
            })
            $(this).css({
                rotate: "0deg",
                transform: "translateX(0)",
            })
        }
    })

    $("#musicBtn").click(function(){
        if(music){
            music = false
            $(".serverMusicBox").css({
                transform: "translateX(-27vw)",
            })
            $(this).css({
                rotate: "180deg",
                transform: "translateX(-100px)",
            })
        }else{
            music = true
            $(".serverMusicBox").css({
                transform: "translateX(0)",
            })
            $(this).css({
                rotate: "0deg",
                transform: "translateX(0)",
            })
        }
    })

    $(".volumeBox input").on("change", function(){
        $(".volumeBox output").text($(this).val()+"%")
        audio.volume($(this).val() / 100)
    })

    function secondsToDuration(sec) {
		return `${Math.floor(sec / 60)
			.toString()
			.padStart(2, "0")}:${Math.round(sec % 60)
			.toString()
			.padStart(2, "0")}`
	}
	
	let audio = null
	let audioId = -1
	let audioInterval = null
	let audioTime = 0
	
	function stopAudio() {
		if (audio) {
			audio.stop()
	
			clearInterval(audioInterval)
	
			audio = null
			audioId = -1
			audioInterval = null
	
			$(".current-music span").text("Not Playing")
		}
	}
	
	function playAudio(id) {
		stopAudio()
	
		const music = Config.Music[id]
	
		if (music) {
			audio = new Howl({
				src: music.path,
				volume: $(".volumeBox input").val() / 100,
				onend: () => nextSong(),
			})
	
			resumeAudio()
			audioId = id
			audioInterval = setInterval(() => {
				if (audio.playing()) {
					$(".musicRightBox .custom-range").val((audio.seek() / audio.duration()) * 100)
                    $("#musicTime").text(secondsToDuration(audio.seek()))
				}
			}, 1000)
	
			$(".musicName span").text(music.name)
			$(".musicName p").text(music.author)
		}
	}

    $(".musicRightBox .custom-range").on("change", function(){
        audio.seek(convertValue($(this).val(), 0, 100, 0, audio.duration()))
    })
	
	function pauseAudio() {
		if (audio) {
			audio.pause()
	
			$("#play").show()
			$("#stop").hide()
		}
	}
	
	function resumeAudio() {
		if (audio) {
			audio.play()
	
			$("#play").hide()
			$("#stop").show()
		}
	}
	
	function nextSong(prev) {
		if (audio) {
			prev ? audioId-- : audioId++
	
			if (audioId >= Config.Music.length) audioId = 0
			else if (audioId < 0) audioId = Config.Music.length - 1
	
			playAudio(audioId)
		}
	}
	
	$(function () {
		$("#play").click(() => resumeAudio())
		$("#stop").click(() => pauseAudio())
		$("#next").click(() => nextSong())
		$("#prev").click(() => nextSong(true))
	
		playAudio(0)
	})

    $(window).on("message", function ({ originalEvent: e }) {
		if (e.data.eventName === "loadProgress") {
			$(".loadingCar").css("width", (e.data.loadFraction * 100).toFixed(0) + "%")
			$(".loadingSay").text((e.data.loadFraction * 100).toFixed(0) + "%")
		}
	})

    $("#discord").click(() => window.invokeNative('openUrl', Config.Discord))
    $("#instagram").click(() => window.invokeNative('openUrl', Config.Instagram))
    $("#youtube").click(() => window.invokeNative('openUrl', Config.Youtube))
});