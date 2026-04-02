DP = {}

DP.Expressions = {
   ["Sinirli"] = {"Expression", "mood_angry_1"},
   ["Sarhoş"] = {"Expression", "mood_drunk_1"},
   ["Yaralı"] = {"Expression", "pose_injured_1"},
   ["Çarpılmış"] = {"Expression", "electrocuted_1"},
   ["Sinirli 2"] = {"Expression", "effort_1"},
   ["Sinirli 3"] = {"Expression", "mood_drivefast_1"},
   ["Sinirli 4"] = {"Expression", "pose_angry_1"},
   ["Mutlu"] = {"Expression", "mood_happy_1"},
   ["Yaralı"] = {"Expression", "mood_injured_1"},
   ["Neşeli"] = {"Expression", "mood_dancing_low_1"},
   ["Tek göz"] = {"Expression", "pose_aiming_1"},
   ["Şaşırmış"] = {"Expression", "shocked_1"},
   ["Şaşırmış 2"] = {"Expression", "shocked_2"},
   ["Uykulu"] = {"Expression", "mood_sleeping_1"},
   ["Ölü"] = {"Expression", "dead_1"},
   ["Ölü 2"] = {"Expression", "dead_2"},
   ["Kendini Beğenmiş"] = {"Expression", "mood_smug_1"},
   ["Spekülatif"] = {"Expression", "mood_aiming_1"},
   ["Stresli"] = {"Expression", "mood_stressed_1"},
   ["Somurtkan"] = {"Expression", "mood_sulk_1"},
   ["Sinirli 5"] = {"Expression", "effort_2"},
   ["Sinirli 6"] = {"Expression", "effort_3"},
   ["Dudak Büz"] = {"Expression", "smoking_hold_1"},
}

DP.Walks = {
  ["Uzaylı"] = {"move_m@alien"},
  ["Zırhlı"] = {"anim_group_move_ballistic"},
  ["Kibirli"] = {"move_f@arrogant@a"},
  ["Cesur"] = {"move_m@brave"},
  ["Normal"] = {"move_m@casual@a"},
  ["Normal 2"] = {"move_m@casual@b"},
  ["Normal 3"] = {"move_m@casual@c"},
  ["Normal 4"] = {"move_m@casual@d"},
  ["Normal 5"] = {"move_m@casual@e"},
  ["Normal 6"] = {"move_m@casual@f"},
  ["Kırıt 3"] = {"move_f@chichi"},
  ["Özgüvenli"] = {"move_m@confident"},
  ["Polis"] = {"move_m@business@a"},
  ["Polis 2"] = {"move_m@business@b"},
  ["Polis 3"] = {"move_m@business@c"},
  ["Sıradan Kadın"] = {"move_f@multiplayer"},
  ["Sıradan Erkek"] = {"move_m@multiplayer"},
  ["Sarhoş"] = {"move_m@drunk@a"},
  ["Hafif Sarhoş"] = {"move_m@drunk@slightlydrunk"},
  ["Sarhoş 2"] = {"move_m@buzzed"},
  ["Sarhoş 3"] = {"move_m@drunk@verydrunk"},
  ["Kırıt 5"] = {"move_f@femme@"},
  ["Ateş"] = {"move_characters@franklin@fire"},
  ["Ateş 2"] = {"move_characters@michael@fire"},
  ["Ateş 3"] = {"move_m@fire"},
  ["Franklin"] = {"move_p_m_one"},
  ["Gangster"] = {"move_m@gangster@generic"},
  ["Gangster 2"] = {"move_m@gangster@ng"},
  ["Gangster 3"] = {"move_m@gangster@var_e"},
  ["Gangster 4"] = {"move_m@gangster@var_f"},
  ["Gangster 5"] = {"move_m@gangster@var_i"},
  ["Sallan"] = {"anim@move_m@grooving@"},
  ["Silah Tut"] = {"move_m@prison_gaurd"},
  ["Kelepçeli"] = {"move_m@prisoner_cuffed"},
  ["Topuklu"] = {"move_f@heels@c"},
  ["Topuklu 2"] = {"move_f@heels@d"},
  ["Yürüyüş"] = {"move_m@hiking"},
  ["Hipster"] = {"move_m@hipster@a"},
  ["Hafif Sarhoş 2"] = {"move_m@hobo@a"},
  ["Acele"] = {"move_f@hurry@a"},
  ["Ateş 4"] = {"move_p_m_zero_janitor"},
  ["Normal 7"] = {"move_p_m_zero_slow"},
  ["Sportif"] = {"move_m@jog@"},
  ["Lamar"] = {"anim_group_move_lemar_alley"},
  ["Yaralı 2"] = {"move_heist_lester"},
  ["Yaralı 3"] = {"move_lester_caneup"},
  ["Yollu"] = {"move_f@maneater"},
  ["Michael"] = {"move_ped_bucket"},
  ["Zengin"] = {"move_m@money"},
  ["Kaslı"] = {"move_m@muscle@a"},
  ["Posh"] = {"move_m@posh@"},
  ["Kırıt 4"] = {"move_f@posh@"},
  ["Koşar Adım"] = {"move_m@quick"},
  ["Podyum"] = {"female_fast_runner"},
  ["Üzgün"] = {"move_m@sad@a"},
  ["Kırıt"] = {"move_m@sassy"},
  ["Kırıt 2"] = {"move_f@sassy"},
  ["Korkmuş"] = {"move_f@scared"},
  ["Seksi"] = {"move_f@sexy@a"},
  ["Yaylan"] = {"move_m@shadyped@a"},
  ["Yavaş"] = {"move_characters@jimmy@slow@"},
  ["Artist"] = {"move_m@swagger"},
  ["Sert"] = {"move_m@tough_guy@"},
  ["Sert 2"] = {"move_f@tough_guy@"},
  ["Çöp Taşı"] = {"clipset@move@trash_fast_turn"},
  ["Çöp Taşı 2"] = {"missfbi4prepp1_garbageman"},
  ["Trevor"] = {"move_p_m_two"},
  ["Kolları Salla"] = {"move_m@bag"},
}

DP.Shared = {
    ["dizineyat1"] = {"tigerle@custom@couple@cuddle1a", "tigerle_couple_cuddle1a", "Dizine Yat [Erkek]", "dizineyat2", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.0,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 0.0,
    }},
    ["dizineyat2"] = {"tigerle@custom@couple@cuddle1b", "tigerle_couple_cuddle1b", "Dizine Yat [Kadın]", "dizineyat1", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.0,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 0.0,
    }},

    ["döpe"] = {"tigerle@custom@couple@kissing1a", "tigerle_couple_kissing1a", "Dudaktan Öp [Erkek]", "döpk", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.0,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 0.0,
    }},
    ["döpk"] = {"tigerle@custom@couple@kissing1b", "tigerle_couple_kissing1b", "Dudaktan Öp [Kadın]", "döpe", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.0,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 0.0,
    }},
    ["dkoltukope"] = {"tigerle@custom@couple@kissing2a", "tigerle_couple_kissing2a", "Koltukta Dudaktan Öp [Erkek]", "dkoltukopk", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.0,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 0.0,
    }},
    ["dkoltukopk"] = {"tigerle@custom@couple@kissing2b", "tigerle_couple_kissing2b", "Koltukta Dudaktan Öp [Kadın]", "dkoltukope", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.0,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 0.0,
    }},

    ["ysarile"] = {"tigerle@custom@couple@laying1a", "tigerle_couple_laying1a", "Yatak'ta Sarıl [Erkek]", "ysarile", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.0,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 0.0,
    }},
    ["ysarilk"] = {"tigerle@custom@couple@laying1b", "tigerle_couple_laying1b", "Yatak'ta Sarıl [Kadın]", "ysarilk", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.0,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 0.0,
    }},

    ["kucaklaveop"] = {"tigerle@custom@couple@standcuddle_a", "tigerle_couple_standcuddle_a", "Kucakla ve ÖP [Erkek]", "kucaklaveop2", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.35,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 180.0,
    }},
    ["kucaklaveop2"] = {"tigerle@custom@couple@standcuddle_b", "tigerle_couple_standcuddle_b", "Kucakla ve ÖP [Kadın]", "kucaklaveop", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.35,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 180.0,
    }},

    ["handshake"] = {"mp_ped_interaction", "handshake_guy_a", "Mahalle Tarzı Tokalaşma", "handshake2", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteDuration = 3000,
       SyncOffsetFront = 0.9
    }},
    ["handshake2"] = {"mp_ped_interaction", "handshake_guy_b", "Mahalle Tarzı Tokalaşma 2", "handshake", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteDuration = 3000
    }},
    ["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Sarıl", "hug2", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 5000,
       SyncOffsetFront = 1.05,
    }},
    ["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Sarıl 2", "hug", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 5000,
       SyncOffsetFront = 1.13
    }},
    ["hug3"] = {"misscarsteal2chad_goodbye", "chad_armsaround_chad", "Flörtöz Sarılma (Erkek)", "hug4", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
       SyncOffsetFront = 0.05,
    }},
    ["hug4"] = {"misscarsteal2chad_goodbye", "chad_armsaround_girl", "Flörtöz Sarılma (Kadın)", "hug3", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
       SyncOffsetFront = 0.13
    }},
    ["beso"] = {"hs3_ext-20", "cs_lestercrest_3_dual-20", "Öpüşmek (Erkek)", "beso2", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 60000,
        SyncOffsetFront = 0.40,
    }},
    ["beso2"] = {"hs3_ext-20", "csb_georginacheng_dual-20", "Öpüşmek (Kadın)", "beso", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 60000,
        SyncOffsetFront = 0.40,
    }},
    ["bro"] = {"mp_ped_interaction", "hugs_guy_a", "Mahalle Tarzı Tokalaşma 3", "bro2", AnimationOptions =
    {
       SyncOffsetFront = 1.14
    }},
    ["bro2"] = {"mp_ped_interaction", "hugs_guy_b", "Mahalle Tarzı Tokalaşma 4", "bro", AnimationOptions =
    {
       SyncOffsetFront = 1.14
    }},
    ["dyat1"] = {"cuddlepartner1@pawuk", "cuddlepartner1_clip", "Dizinde Yat 1", "dyat2", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        SyncOffsetFront = 0.40,
    }},
    ["dyat2"] = {"cuddlepartner2@pawuk", "cuddlepartner2_clip", "Dizinde Yat 2", "dyat1", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        SyncOffsetFront = 0.40,
    }},
    ["kucaklae"] = {"mx@couple4_a", "mx@couple4_a_clip", "Kucakla [Erkek]", "kucaklak", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        SyncOffsetKordinat = { x = 0.0, y = 0.40, z = 0.0 },
    }},
    ["kucaklak"] = {"mx@couple4_b", "mx@couple4_b_clip", "Kucakla [Kadın]", "kucaklae", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        SyncOffsetKordinat = { x = 0.0, y = 0.40, z = 0.0 },
    }},
    ["ysarila"] = {"mx@couple5_a", "mx@couple5_a_clip", "Yatakta Sarıl [Erkek]", "ysarilk", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        SyncOffsetFront = 0.40,
    }},
    ["ysarilk"] = {"mx@couple5_b", "mx@couple5_b_clip", "Yatakta Sarıl [Kadın]", "ysarila", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        SyncOffsetFront = 0.40,
    }},
    ["give"] = {"mp_common", "givetake1_a", "Tokalaşma", "give2", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteDuration = 2000
    }},
    ["give2"] = {"mp_common", "givetake1_b", "Tokalaşma 2", "give", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteDuration = 2000
    }},
    ["baseball"] = {"anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_a", "Beyzbol Topuna Sopayla Vurmak", "baseballthrow"},
    ["baseballthrow"] = {"anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_b", "Beyzbol Topunu Fırlatmak", "baseball"},
    ["stickup"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Silah Doğrult", "stickupscared", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = true,
    }},
    ["stickupscared"] = {"missminuteman_1ig_2", "handsup_base", "Ellerini Kaldır", "stickup", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteLoop = true,
    }},
    ["punch"] = {"melee@unarmed@streamed_variations", "plyr_takedown_rear_lefthook", "Yumruk Atmak", "punched"},
    ["punched"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_cross_r", "Yumruk Ye", "punch"},
    ["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Kafa At", "headbutted"},
    ["headbutted"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_headbutt", "Kafa Ye", "headbutt"},
    ["slap2"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_backslap", "Elinin Tersiyle Tokat At", "slapped2", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = true,
       EmoteDuration = 2000,
    }},
    ["slap"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Tokat At", "slapped", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = true,
       EmoteDuration = 2000,
    }},
    ["slapped"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_slap", "Tokat Ye", "slap"},
    ["slapped2"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_backslap", "Elinin Tersiyle Tokat At", "slap2"},
 }

DP.Dances = {
    ["drill1"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v1_male^3", "Drill  ", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["drill2"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_13_v2_male^1", "Drill 2  ", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["drill3"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_male^4", "Drill 3  ", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["drill4"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^4", "Drill 4  ", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["drill5"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_male^5", "Drill 5  ", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["drill6"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_male^5", "Drill 6  ", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["drill7"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_right_up", "Drill 7  ", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["drill8"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "med_center", "Drill 8 ", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["drill9"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_right_down", "Drill 9  ", AnimationOptions =
    {
        EmoteLoop = true,
    }}, 
    ["drill10"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_center", "Drill 10  ", AnimationOptions =
    {
         EmoteLoop = true,
    }}, 
    ["drill11"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_left_down", "Drill 11  ", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["hiphop"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_d@", "ped_a_dance_idle", "Hip Hop Dans  ", AnimationOptions =
    {
       EmoteLoop = true
    }},
   ["hiphop2"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_b@", "ped_a_dance_idle", "Hip Hop Dans 2  ", AnimationOptions =
   {
       EmoteLoop = true
     }},
    ["hiphop3"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_a@", "ped_a_dance_idle", "Hip Hop Dans 3  ", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["maymundans"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_center", "Maymun Dans   ", AnimationOptions =
    {
        EmoteLoop = true
     }},
     ["maymundans2"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_center_down", "Maymun Dans 2   ", AnimationOptions =
     {
         EmoteLoop = true
      }},
      ["maymundans3"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "med_center_down", "Maymun Dans 3   ", AnimationOptions =
      {
          EmoteLoop = true
       }},
       ["drill12"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "med_right_down", "Drill 12   ", AnimationOptions =
       {
           EmoteLoop = true
        }},
    ["dans"] = {"anim@amb@nightclub@dancers@podium_dancers@", "hi_dance_facedj_17_v2_male^5", "Dans", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dans2"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_down", "Dans 2", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dans3"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_center", "Dans 3", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dans4"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_up", "Dans 4", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dans5"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_center", "Dans 5", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["dans6"] = {"misschinese2_crystalmazemcs1_cs", "dance_loop_tao", "Dans 6", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dans7"] = {"misschinese2_crystalmazemcs1_ig", "dance_loop_tao", "Dans 7", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dans8"] = {"missfbi3_sniping", "dance_m_default", "Dans 8", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dans9"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center_up", "Dans 9", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dansk"] = {"anim@amb@nightclub@dancers@solomun_entourage@", "mi_dance_facedj_17_v1_female^1", "Dans (Kadın)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dansk2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center", "Dans 2 (Kadın)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dansk3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Dans 3 (Kadın)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dansk4"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^1", "Dans 4 (Kadın)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dansk5"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^3", "Dans 5 (Kadın)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dansk6"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Dans 6 (Kadın)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["danceclub"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_a_m03", "Dans (Kulüp)", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["danceclub2"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_a_m05", "Dans 2 (Kulüp)", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["danceclub3"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_a_m02", "Dans 3 (Kulüp)", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["danceclub4"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_b_f01", "Dans 4 (Kulüp)", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["danceclub5"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_a_f02", "Dans 5 (Kulüp)", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["danceclub6"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_b_m03", "Dans 6 (Kulüp)", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["danceclub7"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_d_f01", "Dans 7 (Kulüp)", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["dancedrink"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_c_m01", "Dans (Bira)", AnimationOptions =
    {
       Prop = 'prop_beer_amopen',
       PropBone = 28422,
       PropPlacement = {0.0, 0.00,0.0, 0.0, 0.0, 20.00},
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["dancedrink2"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_loop_f1", "Dans (Şarap)", AnimationOptions =
    {
       Prop = 'p_wine_glass_s',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0,-0.0900, 0.0, 0.0, 0.00},
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["dancedrink3"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_loop_m04", "Dans (Viski)", AnimationOptions =
    {
       Prop = 'ba_prop_battle_whiskey_opaque_s',
       PropBone = 28422,
       PropPlacement = {-0.0100, 0.00,0.0, 0.0, 0.0, 10.00},
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["dancedrink4"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "mi_idle_b_m04", "Dans 2 (Viski)", AnimationOptions =
    {
       Prop = 'ba_prop_battle_whiskey_opaque_s',
       PropBone = 28422,
       PropPlacement = {-0.0100, 0.00,0.0, 0.0, 0.0, 10.00},
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["dancedrink5"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^3", "Dans 2 (Şarap)", AnimationOptions =
    {
       Prop = 'p_wine_glass_s',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0,-0.0900, 0.0, 0.0, 0.00},
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["dancedrink6"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^3", "Dans 2 (Bira)", AnimationOptions =
    {
       Prop = 'prop_beer_logopen',
       PropBone = 28422,
       PropPlacement = {0.0090, 0.0010,-0.0310, 180.0, 180.0, -69.99},
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["dancedrink7"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_11_v1_female^3", "Dans 2 (Şarap)", AnimationOptions =
    {
       Prop = 'p_wine_glass_s',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0,-0.0900, 0.0, 0.0, 0.00},
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["dancedrink8"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_11_v1_female^1", "Dans 3 (Şarap)", AnimationOptions =
    {
       Prop = 'p_wine_glass_s',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0,-0.0900, 0.0, 0.0, 0.00},
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["danceslow2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center", "Dans 2 (Yavaş)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["danceslow3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center_down", "Dans 3 (Yavaş)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["danceslow4"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center", "Dans 4 (Yavaş)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["danceupper"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center", "Dans (Üst)", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = true,
    }},
    ["danceupper2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_up", "Dans 2 (Üst)", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = true,
    }},
    ["danceshy"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "low_center", "Dans (Utangaç)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["danceshy2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center_down", "Dans 2 (Utangaç)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["danceslow"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "low_center", "Dans (Yavaş)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dancesilly9"] = {"rcmnigel1bnmt_1b", "dance_loop_tyler", "Dans 9 (Şebek)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dancesilly"] = {"special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag", "Dans (Şebek)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dancesilly2"] = {"move_clown@p_m_zero_idles@", "fidget_short_dance", "Dans 2 (Şebek)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dancesilly3"] = {"move_clown@p_m_two_idles@", "fidget_short_dance", "Dans 3 (Şebek)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dancesilly4"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_buttwiggle_b_laz", "Dans 4 (Şebek)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dancesilly5"] = {"timetable@tracy@ig_5@idle_a", "idle_a", "Dans 5 (Şebek)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dancesilly6"] = {"timetable@tracy@ig_8@idle_b", "idle_d", "Dans 6 (Şebek)", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["dancesilly8"] = {"anim@mp_player_intcelebrationfemale@the_woogie", "the_woogie", "Dans 8 (Şebek)", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["dancesilly7"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_center", "Dans 7 (Şebek)", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["danceglowstick"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_13_mi_hi_sexualgriding_laz", "Dans (Çubuk)", AnimationOptions =
    {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
       EmoteMoving = true,
    }},
    ["danceglowstick2"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_12_mi_hi_bootyshake_laz", "Dans 2 (Çubuk)", AnimationOptions =
    {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
    }},
    ["danceglowstick3"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_09_mi_hi_bellydancer_laz", "Dans 3 (Çubuk)", AnimationOptions =
    {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
    }},
    ["dancehorse"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_15_handup_laz", "Dans (At)", AnimationOptions =
    {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
    }},
    ["dancehorse2"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_11_handup_laz", "Dans 2 (At)", AnimationOptions =
    {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
    }},
    ["dancehorse3"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_11_hu_shimmy_laz", "Dans 3 (At)", AnimationOptions =
    {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
    }},
    ["dj"] = {"anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_open_dix", "DJ", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = true,
    }},
    ["dj2"] = {"anim@amb@nightclub@djs@solomun@", "sol_idle_ctr_mid_a_sol", "DJ 2", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["dj3"] = {"anim@amb@nightclub@djs@solomun@", "sol_dance_l_sol", "DJ 3", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["dj4"] = {"anim@amb@nightclub@djs@black_madonna@", "dance_b_idle_a_blamadon", "DJ 4", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["dj5"] = {"anim@amb@nightclub@djs@dixon@", "dixn_end_dix", "DJ 5", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["dj5"] = {"anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_a_dix", "DJ 5", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["dj6"] = {"anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_b_dix", "DJ 6", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["dj7"] = {"anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_g_dix", "DJ 7", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["dj8"] = {"anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_gb_dix", "DJ 8", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["dj9"] = {"anim@amb@nightclub@djs@dixon@", "dixn_sync_cntr_j_dix", "DJ 9", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["twerk"] = {"switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", "Twerk", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapdance2"] = {"mini@strip_club@private_dance@idle", "priv_dance_idle", "Striptiz", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapdance3"] = {"mini@strip_club@private_dance@part1", "priv_dance_p1", "Striptiz 2", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapdance4"] = {"mini@strip_club@private_dance@part2", "priv_dance_p2", "Striptiz 3", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapdance5"] = {"mini@strip_club@private_dance@part3", "priv_dance_p3", "Striptiz 4", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapdance6"] = {"oddjobs@assassinate@multi@yachttarget@lapdance", "yacht_ld_f", "Striptiz 5", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapdancewith"] = {"mini@strip_club@lap_dance_2g@ld_2g_p3", "ld_2g_p3_s2", "Kucak Dansı 6", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapdancewith2"] = {"mini@strip_club@lap_dance_2g@ld_2g_p2", "ld_2g_p2_s2", "Kucak Dansı 5", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapdancewith3"] = {"mini@strip_club@lap_dance_2g@ld_2g_p1", "ld_2g_p1_s2", "Kucak Dansı 4", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapchair"] = {"mini@strip_club@lap_dance@ld_girl_a_song_a_p1", "ld_girl_a_song_a_p1_f", "Kucak Dansı", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapchair2"] = {"mini@strip_club@lap_dance@ld_girl_a_song_a_p2", "ld_girl_a_song_a_p2_f", "Kucak Dansı 2", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapchair3"] = {"mini@strip_club@lap_dance@ld_girl_a_song_a_p3", "ld_girl_a_song_a_p3_f", "Kucak Dansı 3", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["kalcadansi"] = {"mini@strip_club@lap_dance@ld_girl_a_song_a_p3", "ld_girl_a_song_a_p3_f", "Kalça Dansı", AnimationOptions =
    {
       EmoteLoop = true,
    }},
}

DP.Emotes = {
   ["iç"] = {"mp_player_inteat@pnq", "loop", "İç", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["jpbox"] = {"mp_am_hold_up", "purchase_beerbox_shopkeeper", "Yerden Kutu Al  ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 2500,
   }},
   ["yeriara"] = {"amb@code_human_police_investigate@idle_b", "idle_f", "Yeri Ara (Polis)  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 7000,
    
   }},
   ["çıldır"] = {"anim@mp_fm_event@intro", "beast_transform", "Sinirden Çıldır", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 5000,
   }},
   ["anlatkanka"] = {"switch@trevor@scares_tramp", "trev_scares_tramp_idle_tramp", "Anlat Kanka Dinliyorum", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sırtuzan"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_girl", "Sırt Üstü Uzan", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sırtuzan2"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_guy", "Sırt Üstü Uzan 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["yüzuzan"] = {"missfbi3_sniping", "prone_dave", "Yüz Üstü Telefon", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["devamet"] = {"misscarsteal3pullover", "pull_over_right", "Devam Et", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1300,
   }},
   ["boşta"] = {"anim@heists@heist_corona@team_idles@male_a", "idle", "Boşta Bekleme", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["boşta8"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_b", "Boşta Bekleme 8"},
   ["boşta9"] = {"friends@fra@ig_1", "base_idle", "Boşta Bekleme 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["boşta10"] = {"mp_move@prostitute@m@french", "idle", "Boşta Bekleme 10", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["boşta11"] = {"random@countrysiderobbery", "idle_a", "Boşta Bekleme 11", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["boşta2"] = {"anim@heists@heist_corona@team_idles@female_a", "idle", "Boşta Bekleme 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["boşta3"] = {"anim@heists@humane_labs@finale@strip_club", "ped_b_celebrate_loop", "Boşta Bekleme 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["boşta4"] = {"anim@mp_celebration@idles@female", "celebration_idle_f_a", "Boşta Bekleme 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["boşta5"] = {"anim@mp_corona_idles@female_b@idle_a", "idle_a", "Boşta Bekleme 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["boşta6"] = {"anim@mp_corona_idles@male_c@idle_a", "idle_a", "Boşta Bekleme 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["boşta7"] = {"anim@mp_corona_idles@male_d@idle_a", "idle_a", "Boşta Bekleme 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["bekle3"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", "Sıkıntılı Bekleme", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["boştas"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd1", "Sarhoş Bekleme", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["boştas2"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd2", "Sarhoş Bekleme 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["boştas3"] = {"missarmenian2", "standing_idle_loop_drunk", "Sarhoş Bekleme 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["hgitar"] = {"anim@mp_player_intcelebrationfemale@air_guitar", "air_guitar", "Hayali Gitar"},
   ["hklavye"] = {"anim@mp_player_intcelebrationfemale@air_synth", "air_synth", "Hayali Klavye"},
   ["tartış"] = {"misscarsteal4@actor", "actor_berating_loop", "Tartışma", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tartış2"] = {"oddjobs@assassinate@vice@hooker", "argue_a", "Tartışma 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["öpücük"] = {"anim@mp_player_intcelebrationfemale@blow_kiss", "blow_kiss", "Öpücük At"},
   ["öpücük2"] = {"anim@mp_player_intselfieblow_kiss", "exit", "Öpücük At 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000

   }},
   ["reverans"] = {"anim@mp_player_intcelebrationpaired@f_f_sarcastic", "sarcastic_left", "Bale Reverans"},
   ["yollagelsin"] = {"misscommon@response", "bring_it_on", "Yolla Gelsin", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["gelhelegel"] = {"mini@triathlon", "want_some_of_this", "Gel Hele Gel", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000
   }},
   ["kollarsabit2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Kollar Bağlı (Sabit)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["telsiz3"] = {"amb@code_human_police_investigate@idle_a", "idle_b", "Telsizle Konuş", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kollar"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", "Kollar Bağlı", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["ellerbelde2"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_b", "Eller Belde", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["kollar3"] = {"anim@heists@heist_corona@single_team", "single_team_loop_boss", "Kollar Bağlı 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kollar4"] = {"random@street_race", "_car_b_lookout", "Kollar Bağlı 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kollar5"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Kollar Bağlı 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kollark2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Kollar Bağlı 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kalinka"] = {"random@shop_gunstore", "_idle", "Kalinka", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kolbaşs"] = {"rcmnigel1a_band_groupies", "base_m2", "Kollar Bağlı Baş Sağa", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hayamk"] = {"gestures@m@standing@casual", "gesture_damn", "Hay Amk", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["hayamk2"] = {"anim@am_hold_up@male", "shoplift_mid", "Hay Amk 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["yerişa"] = {"gestures@f@standing@casual", "gesture_hand_down", "Yeri İşaret Et", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["teslim"] = {"random@arrests@busted", "idle_a", "Diz Çök Teslim Ol", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["utan"] = {"anim@mp_player_intcelebrationfemale@face_palm", "face_palm", "Utan 1", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["utan2"] = {"random@car_thief@agitated@idle_a", "agitated_idle_a", "Utan 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["utan3"] = {"missminuteman_1ig_2", "tasered_2", "Utan 3", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["utan4"] = {"anim@mp_player_intupperface_palm", "idle_a", "Utan 4", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["yeredüş"] = {"random@drunk_driver_1", "drunk_fall_over", "Yere Düş"},
   ["intihar"] = {"mp_suicide", "pistol", "Yere Düş (İntihar) 1"},
   ["intihar2"] = {"mp_suicide", "pill", "Yere Düş (İntihar) 2"},
   ["yeredüşt"] = {"friends@frf@ig_2", "knockout_plyr", "Yere Düş (Tokat)"},
   ["yeredüş2"] = {"anim@gangops@hostage@", "victim_fail", "Yere Düş 2"},
   ["başöne"] = {"mp_sleep", "sleep_loop", "Başını Öne Eğ", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["dövüşhaz"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_c", "Dövüşe Hazırlık"},
   ["dövüşhaz2"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_e", "Dövüşe Hazırlık 2"},
   ["hareketçek"] = {"anim@mp_player_intselfiethe_bird", "idle_a", "Hareket Çek", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hareketçek2"] = {"anim@mp_player_intupperfinger", "idle_a_fp", "Hareket Çek İkili", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["mahalletoka"] = {"mp_ped_interaction", "handshake_guy_a", "Tokalaş Mahalle", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["mahalletoka2"] = {"mp_ped_interaction", "handshake_guy_b", "Tokalaş Mahalle 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["elbelde4"] = {"amb@world_human_hang_out_street@Female_arm_side@idle_a", "idle_a", "Tek El Belde Bekleme", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["baraj5"] = {"missclothing", "idle_storeclerk", "Baraj Kur", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["elbelde6"] = {"timetable@amanda@ig_2", "ig_2_base_amanda", "Eller Belde 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["elbelde7"] = {"rcmnigel1cnmt_1c", "base", "Tek El Belde Bekleme 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bekle8"] = {"rcmjosh1", "idle", "Eller Belde 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kafakıskaç"] = {"rcmjosh2", "josh_2_intp1_base", "Kafa Kıskacı", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["elbelde10"] = {"timetable@amanda@ig_3", "ig_3_base_tracy", "Eller Belde 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["elbelde11"] = {"misshair_shop@hair_dressers", "keeper_base", "Eller Belde 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["askıtut"] = {"move_m@hiking", "idle", "Çanta Askısı Tut", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["sarıl"] = {"mp_ped_interaction", "kisses_guy_a", "Sarıl"},
   ["sarıl2"] = {"mp_ped_interaction", "kisses_guy_b", "Sarıl 2"},
   ["sarıl3"] = {"mp_ped_interaction", "hugs_guy_a", "Sarıl (mahalle) 3"},
   ["inceleme"] = {"random@train_tracks", "idle_e", "İnceleme"},
   ["tadaaaa"] = {"anim@mp_player_intcelebrationfemale@jazz_hands", "jazz_hands", "Ta Daaaa", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 6000,
   }},
   ["ısınma2"] = {"amb@world_human_jog_standing@male@idle_a", "idle_a", "Isınma", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["ısınma3"] = {"amb@world_human_jog_standing@female@idle_a", "idle_a", "Isınma 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["ısınma4"] = {"amb@world_human_power_walker@female@idle_a", "idle_a", "Isınma 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["ısınma5"] = {"move_m@joy@a", "walk", "Isınma 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["ısınma"] = {"timetable@reunited@ig_2", "jimmy_getknocked", "Isınma 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["semtotur"] = {"rcmextreme3", "idle", "Semt Oturuşu", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["semtotur2"] = {"amb@world_human_bum_wash@male@low@idle_a", "idle_a", "Semt Oturuşu 2 ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kapıçal"] = {"timetable@jimmy@doorknock@", "knockdoor_idle", "Kapı Çal", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["kapıçal2"] = {"missheistfbi3b_ig7", "lift_fibagent_loop", "Kapı Zorla", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["parmakkıt"] = {"anim@mp_player_intcelebrationfemale@knuckle_crunch", "knuckle_crunch", "Parmak Kütlet", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["yaslan2"] = {"amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", "Yaslan 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["yaslan3"] = {"amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", "Yaslan 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["yaslan4"] = {"amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", "Yaslan 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["yaslan5"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_idle_nowork", "Yaslan 5 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["yaslan6"] = {"amb@world_human_leaning@male@wall@back@legs_crossed@base", "base", "Yaslan 6 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["önee"] = {"random@street_race", "_car_a_flirt_girl", "Öne Eğil", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["ybar"] = {"amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", "Yaslan Bar", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["ybar2"] = {"anim@amb@nightclub@lazlow@ig1_vip@", "clubvip_base_laz", "Yaslan Bar 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["ybar3"] = {"anim@heists@prison_heist", "ped_b_loop_a", "Yaslan Bar 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["ybar4"] = {"anim@mp_ferris_wheel", "idle_a_player_one", "Yaslan Bar 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["ybar5"] = {"anim@mp_ferris_wheel", "idle_a_player_two", "Yaslan Bar 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["yanayas"] = {"timetable@mime@01_gc", "idle_a", "Yana Yaslan", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},

   ["tyaslan"] = {"anim@amb@nightclub@peds@", "amb_world_human_leaning_female_wall_back_texting_idle_a", "Telefonla Yaslan~b~ LDI", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.030, 0.0, 0.030, 0.0, 10.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},

   ["yanayas2"] = {"misscarstealfinale", "packer_idle_1_trevor", "Yana Yaslan 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},


   ["yanayas3"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Yana Yaslan 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["yanayas4"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Yana Yaslan 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["yanayas5"] = {"rcmjosh2", "josh_2_intp1_base", "Yana Yaslan 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["kendim"] = {"gestures@f@standing@casual", "gesture_me_hard", "Kendini İşaret Et", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["tamir"] = {"mini@repair", "fixing_a_ped", "Tamir", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["semt3"] = {"amb@medic@standing@tendtodead@base", "base", "Semt Oturuşu 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["meditas"] = {"rcmcollect_paperleadinout@", "meditiate_idle", "Meditasyon", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["meditas2"] = {"rcmepsilonism3", "ep_3_rcm_marnie_meditating", "Meditasyon 2", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["meditas3"] = {"rcmepsilonism3", "base_loop", "Meditasyon 3", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["metal"] = {"anim@mp_player_intincarrockstd@ps@", "idle_a", "Metal Müzik İşareti", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hayır"] = {"anim@heists@ornate_bank@chat_manager", "fail", "Hayır", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hayır2"] = {"mp_player_int_upper_nod", "mp_player_int_nod_no", "Hayır 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["burunkar"] = {"anim@mp_player_intcelebrationfemale@nose_pick", "nose_pick", "Sümük Fırlat", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hayır3"] = {"gestures@m@standing@casual", "gesture_no_way", "Hayır 3", AnimationOptions =
   {
       EmoteDuration = 1500,
       EmoteMoving = true,
   }},
   ["ok"] = {"anim@mp_player_intselfiedock", "idle_a", "OK İşareti", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["nefessiz"] = {"re@construction", "out_of_breath", "Nefessiz Kal", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["yerdenal"] = {"random@domestic", "pickup_low", "Yerden Al"},
   ["ittir"] = {"missfinale_c2ig_11", "pushcar_offcliff_f", "İttir", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["ittir2"] = {"missfinale_c2ig_11", "pushcar_offcliff_m", "İttir 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["göster"] = {"gestures@f@standing@casual", "gesture_point", "Karşıyı İşaret Et", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = true,
   }},
   ["şınav"] = {"amb@world_human_push_ups@male@idle_a", "idle_d", "Şınav", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["yarış"] = {"random@street_race", "grid_girl_race_start", "Yarış Başlat", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["sağıgs"] = {"mp_gun_shop_tut", "indicate_right", "Sağı Göster", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["selamd"] = {"anim@mp_player_intincarsalutestd@ds@", "idle_a", "o7", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["selamd2"] = {"anim@mp_player_intincarsalutestd@ps@", "idle_a", "o7 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["selamd3"] = {"anim@mp_player_intuppersalute", "idle_a", "o7 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["korkm"] = {"random@domestic", "f_distressed_loop", "Korkmuş", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["korkm2"] = {"random@homelandsecurity", "knees_loop_girl", "Korkmuş 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["sanagirsin"] = {"misscommon@response", "screw_you", "Sana Girsin", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["temizlen"] = {"move_m@_idles@shake_off", "shakeoff_1", "Üstünü Temizle", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3500,
   }},
   ["vurulmermi"] = {"random@dealgonewrong", "idle_a", "Vurulmuş", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["uyku"] = {"timetable@tracy@sleep@", "idle_c", "Uyku", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["eee"] = {"gestures@f@standing@casual", "gesture_shrug_hard", "Eee", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["eee2"] = {"gestures@m@standing@casual", "gesture_shrug_hard", "Eeee 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["otur"] = {"rcm_barry3", "barry_3_sit_loop", "Yere Otur 1", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["otur2"] = {"amb@world_human_picnic@male@idle_a", "idle_a", "Yere Otur 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["otur3"] = {"amb@world_human_picnic@female@idle_a", "idle_a", "Yere Otur 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["otur4"] = {"anim@heists@fleeca_bank@ig_7_jetski_owner", "owner_idle", "Yere Otur 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["otur5"] = {"timetable@jimmy@mics3_ig_15@", "idle_a_jimmy", "Yere Otur 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["otur6"] = {"anim@amb@nightclub@lazlow@lo_alone@", "lowalone_base_laz", "Yere Otur 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["otur7"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_jimmy", "Yere Otur 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["otur8"] = {"amb@world_human_stupor@male@idle_a", "idle_a", "Yere Otur 8", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["otur9"] = {"anim@heists@narcotics@funding@gang_chat", "gang_chatting_combined", "Yere Otur 9 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["otur10"] = {"anim@heists@prison_heistig_5_p1_rashkovsky_idle", "idle_180", "Yere Otur 10 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["otur11"] = {"anim@mp_rollarcoaster", "hands_up_idle_a_player_one", "Yere Otur 11 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }}, 
   ["oturyas"] = {"timetable@tracy@ig_14@", "ig_14_base_tracy", "Otur (Yaslanarak)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["oturkork"] = {"anim@heists@ornate_bank@hostages@hit", "hit_loop_ped_b", "Otur (Korkak)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["oturkork2"] = {"anim@heists@ornate_bank@hostages@ped_c@", "flinch_loop", "Otur (Korkak) 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["oturkork3"] = {"anim@heists@ornate_bank@hostages@ped_e@", "flinch_loop", "Otur (Korkak) 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["oturalkol"] = {"timetable@amanda@drunk@base", "base", "Otur (Sarhoş)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sotur"] = {"timetable@ron@ig_5_p3", "ig_5_p3_base", "Otur (Sandalye)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sotur2"] = {"timetable@reunited@ig_10", "base_amanda", "Otur (Sandalye) 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sotur3"] = {"timetable@ron@ig_3_couch", "base", "Otur (Sandalye) 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sotur4"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_tracy", "Otur (Sandalye) 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sotur5"] = {"timetable@maid@couch@", "base", "Otur (Sandalye) 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sotur6"] = {"timetable@ron@ron_ig_2_alt1", "ig_2_alt1_base", "Otur (Sandalye) 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sotur7"] = {"missfbi4leadinoutfbi_4_int", "fbi_4_int_trv_idle_andreas", "Otur (Sandalye) 7 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sotur8"] = {"safe@franklin@ig_13", "base", "Otur (Sandalye) 8 ~r~ +", AnimationOptions =
   {
        EmoteLoop = true,
        EmoteMoving = false,
   }},
   ["mekik"] = {"amb@world_human_sit_ups@male@idle_a", "idle_a", "Mekik", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["alkışhey"] = {"anim@arena@celeb@flat@solo@no_props@", "angry_clap_a_player_a", "Alkışla (Heyecanlı)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["alkışaşal"] = {"anim@mp_player_intupperslow_clap", "idle_a", "Alkışla (Aşağılayarak)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["alkışel"] = {"amb@world_human_cheering@male_a", "base", "Alkışla (Eller Yukarıda)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["alkışyav"] = {"anim@mp_player_intcelebrationfemale@slow_clap", "slow_clap", "Alkışla (Yavaşça)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["alkışyav2"] = {"anim@mp_player_intcelebrationmale@slow_clap", "slow_clap", "Alkışla (Yavaşça) 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["elkokla"] = {"move_p_m_two_idles@generic", "fidget_sniff_fingers", "Elini Kokla", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["nişanal"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Nişan Al", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["dengek"] = {"misscarsteal4@actor", "stumble", "Dengeni Kaybet", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["elektrik"] = {"stungun@standing", "damage", "Elektrik Şoku", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["uzansü"] = {"amb@world_human_sunbathe@male@back@base", "base", "Sırt Üstü Uzan", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["uzansü2"] = {"amb@world_human_sunbathe@female@back@base", "base", "Sırt Üstü Uzan 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["uçak"] = {"missfam5_yoga", "a2_pose", "Kolları Yana Aç", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["t2"] = {"mp_sleep", "bind_pose_180", "T 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kafakaşı"] = {"mp_cp_welcome_tutthink", "b_think", "Kafa Kaşı", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["düşün"] = {"misscarsteal4@aliens", "rehearsal_base_idle_director", "Düşün", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["düşün2"] = {"timetable@tracy@ig_8@base", "base", "Düşün 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},

   ["düşün3"] = {"missheist_jewelleadinout", "jh_int_outro_loop_a", "Düşün 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["helal3"] = {"anim@mp_player_intincarthumbs_uplow@ds@", "enter", "Helal 3", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["helal2"] = {"anim@mp_player_intselfiethumbs_up", "idle_a", "Helal 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["helal"] = {"anim@mp_player_intupperthumbs_up", "idle_a", "Helal", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["klavye"] = {"anim@heists@prison_heiststation@cop_reactions", "cop_b_idle", "Bilgisayar Klavyesi", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["klavye2"] = {"anim@heists@prison_heistig1_p1_guard_checks_bus", "loop", "Bilgisayar Klavyesi 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["klavye3"] = {"mp_prison_break", "hack_loop", "Bilgisayar Klavyesi 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["klavye4"] = {"mp_fbi_heist", "loop", "Bilgisayar Klavyesi 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["elısıt"] = {"amb@world_human_stand_fire@male@idle_a", "idle_a", "Ellerini Isıt", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["elsalla4"] = {"random@mugging5", "001445_01_gangintimidation_1_female_idle_b", "El Salla 4", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["elsalla2"] = {"anim@mp_player_intcelebrationfemale@wave", "wave", "El Salla 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["eyw"] = {"friends@fra@ig_1", "over_here_idle_a", "Ben Kaçar", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = true,
   }},
   ["elsalla"] = {"friends@frj@ig_1", "wave_a", "El Salla", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hopbura"] = {"friends@frj@ig_1", "wave_b", "Hop Buradayız", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hopbura2"] = {"friends@frj@ig_1", "wave_c", "Hop Buradayız 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["görüşürüz"] = {"friends@frj@ig_1", "wave_d", "Görüşürüz", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["eyw2"] = {"friends@frj@ig_1", "wave_e", "Ben Kaçar 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["neyseya"] = {"gestures@m@standing@casual", "gesture_hello", "Neyse Ya", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["ıslık"] = {"taxi_hail", "hail_taxi", "Islık", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1300,
   }},
   ["ıslık2"] = {"rcmnigel1c", "hailing_whistle_waive_a", "Islık 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["yeah"] = {"anim@mp_player_intupperair_shagging", "idle_a", "Yeah", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["otostop"] = {"random@hitch_lift", "idle_f", "Otostop", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["güldalga"] = {"anim@arena@celeb@flat@paired@no_props@", "laugh_a_player_b", "Gülerek Aşağıla", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["güldalga2"] = {"anim@arena@celeb@flat@solo@no_props@", "giggle_a_player_b", "Gülerek Aşağıla 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["heykel"] = {"fra_0_int-1", "cs_lamardavis_dual-1", "Heykel", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["heykel2"] = {"club_intro2-0", "csb_englishdave_dual-0", "Heykel 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["çetes"] = {"mp_player_int_uppergang_sign_a", "mp_player_int_gang_sign_a", "Çete Hareketi", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["çetes2"] = {"mp_player_int_uppergang_sign_b", "mp_player_int_gang_sign_b", "Çete Hareketi 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["çetes3"] = {"amb@code_human_in_car_mp_actions@gang_sign_a@bodhi@rds@base", "idle_a", "Çete Hareketi (East) 3 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["çetes4"] = {"amb@code_human_in_car_mp_actions@gang_sign_a@low@ps@base", "idle_a", "Çete Hareketi (East) 4 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["çetes5"] = {"amb@code_human_in_car_mp_actions@gang_sign_b@std@ds@base", "idle_a", "Çete Hareketi (East) 5 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["çetes6"] = {"anim@mp_player_intincarphotographybodhi@rps@", "idle_a", "Çete İşareti (East) 6 ~r~ +", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,  
   }},
   ["v"] = {"amb@code_human_in_car_mp_actions@v_sign@bodhi@rps@base", "idle_a", "V İşareti ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kalsın"] = {"gestures@f@standing@casual", "gesture_bye_hard", "Kalsın ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bitkidik"] = {"missarmenian3_gardener", "idle_a", "Bitki Dik ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["yiç"] = {"amb@world_human_leaning@male@coffee@idle_a", "idle_a", "Yaslanarak İç ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["başarızilkyardım"] = {"mini@cpr@char_a@cpr_str", "cpr_fail", "Başarısız İlk Yardım ~r~ +", AnimationOptions =
   {
       EmoteLoop = false,
   }},
   ["özlemek"] = {"missfbi1", "ext_t14_leaning_loop", "Özlemek ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hoşgeldin"] = {"random@shop_tattoo", "_greeting", "Hoşgeldin ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["durun"] = {"anim@amb@casino@peds@", "mini_strip_club_idles_bouncer_stop_stop", "Durdun ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["üstünebas"] = {"rcmjosh2", "stand_lean_back_beckon_b", "Üstüne Bas ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["uzan"] = {"missarmenian2", "drunk_loop", "Uzan", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["uzan2"] = {"missarmenian2", "corpse_search_exit_ped", "Uzan 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["uzan3"] = {"anim@gangops@morgue@table@", "body_search", "Uzan 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["uzan4"] = {"mini@cpr@char_b@cpr_def", "cpr_pumpchest_idle", "Uzan 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["uzan5"] = {"random@mugging4", "flee_backward_loop_shopkeeper", "Uzan 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["uzan6"] = {"random@mugging4", "flee_backward_loop_shopkeeper", "Uzan (Yaralı) 6 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["hayvansev"] = {"creatures@rottweiler@tricks@", "petting_franklin", "Hayvan Sev", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sürün"] = {"move_injured_ground", "front_loop", "Sürün", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["takla2"] = {"anim@arena@celeb@flat@solo@no_props@", "cap_a_player_a", "Takla 2"},
   ["takla"] = {"anim@arena@celeb@flat@solo@no_props@", "flip_a_player_a", "Takla"},
   ["kayarak"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_a_player_a", "Kayarak Kutlama"},
   ["kayarak2"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_b_player_a", "Kayarak Kutlama 2"},
   ["kayarak3"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_c_player_a", "Kayarak Kutlama 3"},
   ["beyzbolvur"] = {"anim@arena@celeb@flat@solo@no_props@", "slugger_a_player_a", "Beyzbol Vuruşu"},
   ["hareketçek3"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_a_1st", "Hareket Çek (Hareketli)", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["hareketçek4"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_c_1st", "Hareket Çek (Hareketli) 2", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["hareketçek5"] = {"anim@mp_player_intcelebrationfemale@finger", "finger", "Hareket Çek (Hareketli) 3 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["sahselam"] = {"anim@arena@celeb@podium@no_prop@", "regal_c_1st", "Sahne Selamı", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["sahselam2"] = {"anim@arena@celeb@podium@no_prop@", "regal_a_1st", "Sahne Selamı 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["anahtara"] = {"anim@mp_player_intmenu@key_fob@", "fob_click", "Araba Anahtarına Bas", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["etrafabakın"] = {"anim@miss@low@fin@lamar@", "idle", "Eğilerek Etrafa Bakın ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["golfv"] = {"rcmnigel1d", "swing_a_mark", "Golf Vuruşu"},
   ["ye"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Yemek Ye", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["silahau"] = {"move_m@intimidation@cop@unarmed", "idle", "Silahına Uzan", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bekle"] = {"random@shop_tattoo", "_idle_a", "Bekle", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tatlıselfie1"] = {"anim@selfie_knees_cute", "knees_cute_clip", "Tatlı Selife", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
   ["bekle2"] = {"missbigscore2aig_3", "wait_for_van_c", "Bekle 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bekle4"] = {"rcmjosh1", "idle", "Bekle 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bekle5"] = {"rcmnigel1a", "base", "Bekle 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,  
   }},
   ["bekle6"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_stretching-noworkfemale", "Bekle 6 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,  
   }},
   ["bekle7"] = {"missarmenian2", "lamar_impatient_a", "Bekle 7 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["m4test"] = {"anim@amb@range@weapon_test@", "weapon_test_01_amy_skater_01", "M4-AK Testi ~r~ +", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = false,
   }},
   ["tabanca"] = {"move_weapon@pistol@copc", "idle", "Tabancanı Göster ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tabanca2"] = {"move_weapon@pistol@cope", "idle", "Tabancanı Göster 2 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["ageriye"] = {"combat@gestures@rifle@beckon", "0", "Ağır Silahla Geri Emiri Vermek ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["striptiz2"] = {"mini@strip_club@private_dance@idle", "priv_dance_idle", "Striptiz 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["striptiz3"] = {"mini@strip_club@private_dance@part2", "priv_dance_p2", "Striptiz 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["striptiz4"] = {"mini@strip_club@private_dance@part3", "priv_dance_p3", "Striptiz 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["telefon1"] = {"cellphone@self@franklin@", "west_coast", "Telefonla Fotoğraf Çek 1 ~r~ +", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["telefon2"] = {"cellphone@self@franklin@", "chest_bump", "Telefonla Fotoğraf Çek 2 ~r~ +", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["telefon3"] = {"cellphone@self@franklin@", "peace", "Telefonla Fotoğraf Çek 3 ~r~ +", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["telefon4"] = {"cellphone@self@michael@", "finger_point", "Telefonla Fotoğraf Çek 4 ~r~ +", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["telefon5"] = {"cellphone@self@michael@", "run_chin", "Telefonla Fotoğraf Çek 5 ~r~ +", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["telefon6"] = {"cellphone@self@michael@", "stretch_neck", "Telefonla Fotoğraf Çek 6 ~r~ +", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["telefon7"] = {"cellphone@self@trevor@", "aggressive_finger", "Telefonla Fotoğraf Çek 7 ~r~ +", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["telefon8"] = {"cellphone@self@trevor@", "proud_finger", "Telefonla Fotoğraf Çek 8 ~r~ +", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["telefon9"] = {"cellphone@self@trevor@", "throat_slit", "Telefonla Fotoğraf Çek 9 ~r~ +", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["stut"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Silah Tutmak ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stut2"] = {"combat@aim_variations@1h@gang", "aim_variation_b", "Silah Tutmak 2 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }}, 
   ["stut3"] = {"move_m@intimidation@cop@unarmed", "idle", "Silah Tutmak 3 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stut4"] = {"random@atmrobberygen", "b_atm_mugging", "Silah Tutmak 4 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stut5"] = {"random@arrests", "radio_chatter", "Silah Tutmak 5 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["twerk"] = {"switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", "Twerk", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["tokatat"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Tokat At", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["kafaat"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Kafa At"},
   ["balıkdans"] = {"anim@mp_player_intupperfind_the_fish", "idle_a", "Balık Dansı", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = true,
   }},
   ["barış"] = {"mp_player_int_upperpeace_sign", "mp_player_int_peace_sign", "Barış Sembolu", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["barış2"] = {"anim@mp_player_intupperpeace", "idle_a", "Barış Sembolu 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cpr"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "Kalp Masajı", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cpr2"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "Kalp Masajı 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["uçakt2"] = {"missfbi1", "ledge_loop", "Uçak Taklidi (Sabit)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["uçak"] = {"missfbi1", "ledge_loop", "Uçak Taklidi (Hareketli)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gözetlek"] = {"random@paparazzi@peek", "left_peek_a", "Köşeden Gözetle", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["öksür"] = {"timetable@gardener@smoking_joint", "idle_cough", "Öksür", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["esneme"] = {"mini@triathlon", "idle_e", "Esneme", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["esneme2"] = {"mini@triathlon", "idle_f", "Esneme 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["esneme3"] = {"mini@triathlon", "idle_d", "Esneme 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["esneme4"] = {"rcmfanatic1maryann_stretchidle_b", "idle_e", "Esneme 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kutlamac"] = {"rcmfanatic1celebrate", "celebrate", "Kutlama (Coşkulu)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["yumrukla"] = {"rcmextreme2", "loop_punching", "Yumrukla", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pozver"] = {"rcmbarry", "base", "Poz Ver", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["pozver2"] = {"rcmbarry", "base", "Poz Ver 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["zk"] = {"rcmbarry", "mind_control_b_loop", "Zihin Kontrolü 1", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["zk2"] = {"rcmbarry", "bar_1_attack_idle_aln", "Zihin Kontrolü 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sdalga"] = {"rcm_barry2", "clown_idle_0", "Silahlı Aşağıla", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sdalga2"] = {"rcm_barry2", "clown_idle_1", "Silahlı Aşağıla 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sdalga3"] = {"rcm_barry2", "clown_idle_2", "Silahlı Aşağıla 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sdalga4"] = {"rcm_barry2", "clown_idle_3", "Silahlı Aşağıla 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["sdalga5"] = {"rcm_barry2", "clown_idle_6", "Silahlı Aşağıla 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kendinebak"] = {"mp_clothing@female@trousers", "try_trousers_neutral_a", "Kendine Bak", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kendinebak2"] = {"mp_clothing@female@shirt", "try_shirt_positive_a", "Kendine Bak 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kendinebak3"] = {"mp_clothing@female@shoes", "try_shoes_positive_a", "Kendine Bak 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gergin2"] = {"mp_missheist_countrybank@nervous", "nervous_idle", "Gergin 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gergin"] = {"amb@world_human_bum_standing@twitchy@idle_a", "idle_c", "Gergin", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gergin3"] = {"rcmme_tracey1", "nervous_loop", "Gergin 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kelepçesök"] = {"mp_arresting", "a_uncuff", "Kelepçe Sök", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["namaste"] = {"timetable@amanda@ig_4", "ig_4_base", "Namaste", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["dj"] = {"anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_open_dix", "DJ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["silahte"] = {"random@atmrobberygen", "b_atm_mugging", "Silahla Tehdit Et", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["telsize"] = {"random@arrests", "generic_radio_chatter", "Telsiz", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["çek"] = {"random@mugging4", "struggle_loop_b_thief", "Çek", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kuş"] = {"random@peyote@bird", "wakeup", "Kuş"},
   ["tavuk"] = {"random@peyote@chicken", "wakeup", "Tavuk", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["köpek"] = {"random@peyote@dog", "wakeup", "Köpek Taklidi"},
   ["tavşan"] = {"random@peyote@rabbit", "wakeup", "Tavşan"},
   ["domal"] = {"missexile3", "ex03_train_roof_idle", "Domal", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["azarla"] = {"special_ped@jane@monologue_5@monologue_5c", "brotheradrianhasshown_2", "Azarla", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 3000,
   }},
   ["üstdüzelt"] = {"missmic4", "michael_tux_fidget", "Üstünü Düzenle (Takım)", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 4000,
   }},
   ["teslim2"] = {"anim@heists@ornate_bank@hostages@cashier_b@", "flinch_loop_underfire", "Teslim Ol (Korkarak) ~r~ +", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,
   }},
   ["teslim3"] = {"missminuteman_1ig_2", "handsup_base", "Teslim Ol (Elleri Kaldır)", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,
   }},
   ["işe"] = {"misscarsteal2peeing", "peeing_loop", "İşe", AnimationOptions =
   {
       EmoteStuck = true,
       PtfxAsset = "scr_amb_chop",
       PtfxName = "ent_anim_dog_peeing",
       PtfxNoProp = true,
       PtfxPlacement = {-0.05, 0.3, 0.0, 0.0, 90.0, 90.0, 1.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['pee'],
       PtfxWait = 3000,
   }},
   ["gel"] = {"swat", "come", "Gel ~r~ +", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = false,
   }},
   ["dur"] = {"swat", "freeze", "Dur ~r~ +", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = false,
   }},
   ["ilerle"] = {"swat", "go_fwd", "İlerle ~r~ +", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = false,
   }},
   ["edön"] = {"swat", "rally_point", "Etrafında Dön ~r~ +", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = false,
   }},
   ["anlaşıldı"] = {"swat", "understood", "Anlaşıldı ~r~ +", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = false,
   }},
   ["sahteyumruk"] = {"missarmenian2", "fake_punch_walk_by_lamar", "Sahte Yumruk ~r~ +", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = false,
   }},
   ["nevar"] = {"missarmenian2", "lamar_impatient_a", "Ne Var? ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["parmaksok"] = {"anim@mp_player_intupperdock", "idle_a", "Parmak Sok ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["saatkaç"] = {"amb@code_human_wander_idles_fat@male@idle_a", "idle_a_wristwatch", "Saate Bakmak ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["elmatopla"] = {"amb@prop_human_movie_bulb@idle_a", "idle_a", "Elma Toplamak ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true, 
   }},
   ["kasıl"] = {"amb@world_human_muscle_flex@arms_at_side@idle_a", "idle_a", "Kasılmak ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kyaz5"] = {"anim@heists@fleeca_bank@scope_out@cashier_loop", "cashier_loop", "Klavyeye Yazmak ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
   }}, 
   ["kasaaç"] = {"mini@safe_cracking", "dial_turn_anti_slow", "Kasa Açmak ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["memegöster"] = {"mini@strip_club@backroom@", "stripper_b_backroom_idle_b", "Meme Göstermek ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }}, 
   ["bit"] = {"mini@strip_club@backroom@", "stripper_c_leadin_backroom_idle_a", "Bacak Arası ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["memesalla"] = {"mini@strip_club@idles@stripper", "stripper_idle_05", "Meme Sallamak ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }}, 

   ["çeteduruşu"] = {"anim@miss@low@fin@vagos@", "idle_ped01", "Çete Duruşu ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["çeteduruşu2"] = {"anim@miss@low@fin@vagos@", "idle_ped02", "Çete Duruşu 2 ~r~ +", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["çeteduruşu3"] = {"anim@miss@low@fin@vagos@", "idle_ped03", "Çete Duruşu 3 ~r~ +", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["çeteduruşu4"] = {"anim@miss@low@fin@vagos@", "idle_ped04", "Çete Duruşu 4 ~r~ +", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["çeteduruşu5"] = {"anim@miss@low@fin@vagos@", "idle_ped05", "Çete Duruşu 5 ~r~ +", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["çeteduruşu6"] = {"anim@miss@low@fin@vagos@", "idle_ped06", "Çete Duruşu 6 ~r~ +", AnimationOptions =
   {
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["çeteduruşu7"] = {"anim@miss@low@fin@vagos@", "idle_ped07", "Çete Duruşu 7 ~r~ +", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["çeteduruşu8"] = {"anim@miss@low@fin@vagos@", "idle_ped08", "Çete Duruşu 8 ~r~ +", AnimationOptions =
   {
      EmoteLoop = true,
   }},

-----------------------------------------------------------------------------------------------------------
------ These are Scenarios, some of these dont work on women and some other issues, but still good to have.
-----------------------------------------------------------------------------------------------------------

   ["atm"] = {"Scenario", "PROP_HUMAN_ATM", "ATM"},
   ["mangal"] = {"MaleScenario", "PROP_HUMAN_BBQ", "Mangal"},
   ["çöpk"] = {"Scenario", "PROP_HUMAN_BUM_BIN", "Çöp Karıştır"},
   ["baygın"] = {"Scenario", "WORLD_HUMAN_BUM_SLUMPED", "Baygın"},
   ["alkışya"] = {"Scenario", "WORLD_HUMAN_CHEERING", "Alkışla (Yandan)"},
   ["barfiks"] = {"Scenario", "PROP_HUMAN_MUSCLE_CHIN_UPS", "Barfiks"},
   ["notlarabak"] = {"MaleScenario", "WORLD_HUMAN_CLIPBOARD", "Notlara Bak"},
   ["ot"] = {"Scenario", "WORLD_HUMAN_SMOKING_POT", "Ot İç"},
   ["kemer"] = {"Scenario", "WORLD_HUMAN_COP_IDLES", "Eller Kemerde"},
   ["kemer2"] = {"amb@code_human_police_investigate@base", "base", "Eller Kemerde 2 ~r~ +", AnimationOptions = { EmoteLoop = true, EmoteMoving = true, }}, -- sonradan
   ["kemer3"] = {"amb@world_human_cop_idles@female@idle_b", "idle_d", "Eller Kemerde 3 ~r~ +", AnimationOptions = { EmoteLoop = true }}, -- sonradan
   ["trafikpolis"] = {"MaleScenario", "WORLD_HUMAN_CAR_PARK_ATTENDANT", "Trafik Polisi"},
   ["videoçek"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Telefon Video Çek"},
   ["kaslar"] = {"Scenario", "WORLD_HUMAN_MUSCLE_FLEX", "Kaslar"},
   ["koruma"] = {"Scenario", "WORLD_HUMAN_GUARD_STAND", "Koruma Bekleyişi"},
   ["çivi"] = {"Scenario", "WORLD_HUMAN_HAMMERING", "Çivi Çak"},
   ["sohbet"] = {"Scenario", "WORLD_HUMAN_HANG_OUT_STREET", "Sohbet"},
   ["sabırsız"] = {"Scenario", "WORLD_HUMAN_STAND_IMPATIENT", "Sabırsız"},
   ["paspas"] = {"Scenario", "WORLD_HUMAN_JANITOR", "Paspas Çek"},
   ["ısınmad"] = {"Scenario", "WORLD_HUMAN_JOG_STANDING", "Isınma (Diğer)"},
   ["dizçök"] = {"Scenario", "CODE_HUMAN_MEDIC_KNEEL", "Diz Çök İncele"},
   ["yaprak"] = {"MaleScenario", "WORLD_HUMAN_GARDENER_LEAF_BLOWER", "Yaprak Üfle"},
   ["yaslan"] = {"Scenario", "WORLD_HUMAN_LEANING", "Yaslan (Normal)"},
   ["barmen"] = {"Scenario", "PROP_HUMAN_BUM_SHOPPING_CART", "Barmen (Normal)"},
   ["gözetle"] = {"Scenario", "CODE_HUMAN_CROSS_ROAD_WAIT", "Etrafa Bakın"},
   ["temizle"] = {"Scenario", "WORLD_HUMAN_MAID_CLEAN", "Temizle"},
   ["yerincele"] = {"Scenario", "CODE_HUMAN_MEDIC_TEND_TO_DEAD", "Yeri İncele"},
   ["müzika"] = {"MaleScenario", "WORLD_HUMAN_MUSICIAN", "Müzik Aleti Çal"},
   ["nottut"] = {"Scenario", "CODE_HUMAN_MEDIC_TIME_OF_DEATH", "Not Tut"},
   ["bozukluk"] = {"Scenario", "PROP_HUMAN_PARKING_METER", "Bozukluk At"},
   ["mesajat"] = {"Scenario", "WORLD_HUMAN_STAND_MOBILE", "Mesaj Gönder"},
   ["işara"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", "Yolda İş Ara"},
   ["işara2"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_LOW_CLASS", "Yolda İş Ara 2"},
   ["sudael"] = {"Scenario", "WORLD_HUMAN_BUM_WASH", "Suda Elini Yıka"},
   ["videoçek2"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Telefon Video Çek 2"},
   -- Sitchair is a litte special, since you want the player to be seated correctly.
   -- So we set it as "ScenarioObject" and do TaskStartScenarioAtPosition() instead of "AtPlace"
   ["soo"] = {"ScenarioObject", "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", "Sandalye Oturuşu"},
   ["heykel3"] = {"Scenario", "WORLD_HUMAN_HUMAN_STATUE", "Heykel (Alternatif)"},
   ["uzan6"] = {"Scenario", "WORLD_HUMAN_SUNBATHE", "Uzan (Yüz Üstü)"},
   ["uzan7"] = {"Scenario", "WORLD_HUMAN_SUNBATHE_BACK", "Uzan (Sırt Üstü)"},
   ["kaynak"] = {"Scenario", "WORLD_HUMAN_WELDING", "Kaynak"},
   ["yoga"] = {"Scenario", "WORLD_HUMAN_YOGA", "Yoga"},
   -- CASINO DLC EMOTES (STREAMED)
   ["karate"] = {"anim@mp_player_intcelebrationfemale@karate_chops", "karate_chops", "Karate"},
   ["karate2"] = {"anim@mp_player_intcelebrationmale@karate_chops", "karate_chops", "Karate 2"},
   ["boğaz"] = {"anim@mp_player_intcelebrationmale@cut_throat", "cut_throat", "Boğaz Kesme"},
   ["boğaz2"] = {"anim@mp_player_intcelebrationfemale@cut_throat", "cut_throat", "Boğaz Kesme 2"},
   ["zeki"] = {"anim@mp_player_intcelebrationmale@mind_blown", "mind_blown", "Bir Zeki Sensin", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["zk3"] = {"anim@mp_player_intcelebrationfemale@mind_blown", "mind_blown", "Zihin Kontrolü 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["kutu"] = {"anim@mp_player_intcelebrationmale@shadow_boxing", "shadow_boxing", "Kutu", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["kutu2"] = {"anim@mp_player_intcelebrationfemale@shadow_boxing", "shadow_boxing", "Kutu 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["koktu"] = {"anim@mp_player_intcelebrationfemale@stinker", "stinker", "Koktu", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["düşün4"] = {"anim@amb@casino@hangout@ped_male@stand@02b@idles", "idle_a", "Düşün 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["yelekgiy"] = {"clothingtie", "try_tie_positive_a", "Yelek Giy", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 5000
   }},
   ["jreactiona"] = {"random@shop_robbery_reactions@", "absolutely", "Kesinlikle  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactanger"] = {"random@shop_robbery_reactions@", "anger_a", "Kızgın Tepki  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactwhy"] = {"random@shop_robbery_reactions@", "is_this_it", "Neden?  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["siktirgit"] = {"random@shop_robbery_reactions@", "screw_you", "Siktir Git  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactshock"] = {"random@shop_robbery_reactions@", "shock", "Söyler Misin?  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactgoodc"] = {"missclothing", "good_choice_storeclerk", "İyi Seçim  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jtrynewc"] = {"clothingtie", "try_tie_neutral_c", "Yeni Kıyafet Dene  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jtrynewc2"] = {"clothingtie", "try_tie_neutral_d", "Yeni Kıyafet Dene 2  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreacteasy"] = {"gestures@m@car@std@casual@ds", "gesture_easy_now", "Şuan Kolay  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactıwill"] = {"gestures@m@car@std@casual@ds", "gesture_i_will", "Tepki Ver  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactnoway"] = {"gestures@m@car@std@casual@ds", "gesture_no_way", "Şu Anda Olamaz  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactbye"] = {"gestures@f@standing@casual", "gesture_bye_hard", "Güle Güle  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
      ["jlookatplayer"] = {"friends@frl@ig_1", "look_lamar", "Sağa Bak  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
     ["jreactgreat"] = {"mp_cp_welcome_tutgreet", "greet", "Mütiş  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jfakepunch"] = {"missarmenian2", "fake_punch_walk_by_lamar", "Sahte Yumruk", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
     ["sanakatılıyorum"] = {"missheist_jewel", "im_telling_you", "Sana Katılıyorum  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["kalsın"] = {"missheist_jewel", "despair", "Kalsın  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["teslim4"] = {"missheist_jewel", "manageress_kneel_loop", "Teslim Ol (Dizüstü)  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["öldünçık"] = {"anim@mp_player_intcelebrationfemale@bang_bang", "bang_bang", "Öldün Çık  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jtryshirtn"] = {"clothingshirt", "try_shirt_negative_a", "Kötü Kıyafet Seçimi  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jtryshirtp"] = {"clothingshirt", "try_shirt_positive_a", "İyi Kıyafet Seçimi  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
      ["jtryshoes"] = {"clothingshoes", "try_shoes_positive_d", "Ayakkabı Dene  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
    ["jtryshoes2"] = {"clothingshoes", "try_shoes_positive_c", "Ayakkabı Dene 2  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
    ["aeo"] = {"friends@fra@ig_1", "over_here_idle_a", "Allah Emanet", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
    ["jwashingface"] = {"missmic2_washing_face", "michael_washing_face", "Yüzünü Yıka  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
    ["mbağla"] = {"misstrevor1", "ortega_outro_loop_ort", "Mezar Başında Ağla  ", AnimationOptions =
   {
    EmoteLoop = true,
   }},
    ["jtryg"] = {"mp_clothing@female@glasses", "try_glasses_positive_a", "Gözlük Dene · Kadın  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
    ["jpickup"] = {"pickup_object", "pickup_low", "Yerden Al  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jstretchl"] = {"switch@franklin@bed", "stretch_long", "İyice Esne  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["maybe"] = {"amb@world_human_hang_out_street@male_a@idle_a", "idle_a", "Bilmem Ki?  ", AnimationOptions =
   {
    EmoteLoop = true,
   }},
   ["jhos2"] = {"amb@world_human_hang_out_street@male_c@base", "base", "Evet Seni Dinliyorum.  ", AnimationOptions =
   {
    EmoteLoop = true,
   }},
   ["silahtut"] = {"guard_reactions", "1hand_aiming_cycle", "Silah Tut  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["hazırlan"] = {"switch@franklin@getting_ready", "002334_02_fras_v2_11_getting_dressed_exit", "Hazırlan  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jlao"] = {"move_clown@p_m_two_idles@", "fidget_look_at_outfit", "Kıyafetime Bak  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 6000,
   }},
   ["selfiepoz1"] = {"lunyx@rgmp01", "rgmp01", "Selfie Pozu 1", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["selfiepoz2"] = {"lunyx@rgmp02", "rgmp02", "Selfie Pozu 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["selfiepoz3"] = {"lunyx@rgmp03", "rgmp03", "Selfie Pozu 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["selfiepoz4"] = {"lunyx@rgmp04", "rgmp04", "Selfie Pozu 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["selfiepoz5"] = {"lunyx@rgmp05", "rgmp05", "Selfie Pozu 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["selfiepoz6"] = {"lunyx@rgmp06", "rgmp06", "Selfie Pozu 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["selfiepoz7"] = {"lunyx@rgmp07", "rgmp07", "Selfie Pozu 7", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["selfiepoz7"] = {"fingerrheart@animation", "fingerrheart_clip", "Selfie Pozu 8 [Kalp]", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["sıç"] = {"timetable@trevor@on_the_toilet", "trevonlav_struggleloop", "Klozete Sıç  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["kork"] = {"amb@code_human_cower@male@base", "base", "Kork  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["melkoy"] = {"anim@amb@world_human_valet@normal@base@", "base_a_m_y_vinewood_01", "Ellerini Masaya Koy  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteLoop = true,
   }},
   ["vale"] = {"anim@amb@world_human_valet@formal_right@base@", "base_a_m_y_vinewood_01", "Vale ", AnimationOptions =
   {
    EmoteMoving = true,
    EmoteLoop = true,
   }},
   ["çuzan"] = {"amb@world_human_sunbathe@male@back@idle_a", "idle_c", "Çimene Uzan ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
   }},
   ["çuzan2"] = {"amb@world_human_sunbathe@male@front@base", "base", "Çimene Uzan 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["somurtgan"] = {"anim@scripted@carmeet@tun_meet_ig2_race@", "base", "Somurtgan  ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kontrolet"] = {"anim@amb@carmeet@checkout_car@male_a@idles", "idle_b", "Kontrol Et  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kontrolet2"] = {"anim@amb@carmeet@checkout_car@male_c@idles", "idle_a", "Kontrol Et 2  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dizçök2"] = {"anim@amb@carmeet@checkout_car@female_d@base", "base", "Diz Çök 2  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mesajoku"] = {"anim@amb@carmeet@take_photos@male_a@base", "base", "Mesaj Oku · Erkek  ", AnimationOptions =
   {
       EmoteMoving = false,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["mesajoku2"] = {"anim@amb@carmeet@take_photos@female_b@base", "base", "Mesaj Oku 2 · Kadın  ", AnimationOptions =
   {
       EmoteMoving = false,  
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["mdinle"] = {"anim@amb@carmeet@listen_music@male_a@trans", "a_trans_d", "Müzik Dinle ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["jogger"] = {"move_f@jogger", "idle", "Tekerleme · Kadın  ", AnimationOptions =
   {
       EmoteDuration = 2500,
       EmoteMoving = true,
   }},
   ["jogger2"] = {"move_m@jogger", "idle", "Tekerleme · Erkek  ", AnimationOptions =
   {
       EmoteDuration = 2500,
       EmoteMoving = true,
   }},
   ["esne"] = {"mini@triathlon", "wot_the_fuck", "Esne  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jucdt"] = {"mini@triathlon", "u_cant_do_that", "Asla Yapamazsın  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["ısın"] = {"mini@triathlon", "ig_2_gen_warmup_01", "Isın  ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["ısın2"] = {"mini@triathlon", "ig_2_gen_warmup_02", "Isın 2  ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["ısın3"] = {"mini@triathlon", "jog_idle_f", "Isın 3  ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["ısın4"] = {"mini@triathlon", "jog_idle_e", "Isın 4  ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["kmasaj"] = {"missheistfbi3b_ig8_2", "cpr_loop_paramedic", "Kalp Masajı  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["baygın2"] = {"missheistfbi3b_ig8_2", "cower_loop_victim", "Baygın 2  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["torbacı"] = {"amb@world_human_drug_dealer_hard@male@base", "base", "Torbacı  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["bravo"] = {"amb@world_human_strip_watch_stand@male_c@idle_a", "idle_b", "Gerçekten Bravo ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["suyadokun"] = {"amb@world_human_bum_wash@male@high@base", "base", "Suya Dokun  ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["tbekle"] = {"oddjobs@taxi@", "idle_a", "Taksi Bekle  ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["olamaz"] = {"oddjobs@towingpleadingbase", "base", "Olamaz ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jtsomething"] = {"oddjobs@bailbond_hobohang_out_street_c", "idle_c", "Sadece Söyle  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jlfh"] = {"oddjobs@assassinate@old_lady", "looking_for_help", "Yardım Bekle  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["kaslar2"] = {"oddjobs@assassinate@multi@", "idle_a", "Kaslar 2  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["jdj"] = {"anim@mp_player_intcelebrationmale@dj", "dj", "DJ  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdj2"] = {"anim@scripted@nightclub@dj@dj_moodm@", "moodm_cdj_left_a_12", "DJ 2  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdj3"] = {"anim@amb@nightclub@djs@switch@dixn_djset_switchover@", "dix_end_bg_female1", "DJ 3  ", AnimationOptions =
   {
    EmoteLoop = true,
   }},
   ["jdj4"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", "trans_dance_facedj_li_to_mi_11_v1_male^3", "DJ 4  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["amüzikdinle"] = {"anim@veh@lowrider@std@ds@arm@music@hiphopidle_a", "idle", "Arabada Müzik Dinle", AnimationOptions =
   {
    EmoteMoving = true,
    EmoteDuration = 2500,
   }},
   ["jvsad"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Aşşırı Üzgün ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kaz"] = {"anim@amb@drug_field_workers@rake@male_a@base", "base", "Kaz  ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
       Prop = 'prop_tool_shovel006',
       PropBone = 28422,
       PropPlacement = {0.0, 0.1, -0.6, 0.0, 0.0, 180.0},
   }},
   ["jbow3"] = {"missheistdockssetup1ig_10@base", "talk_pipe_base_worker1", "Elinde Tut Ve Bekle  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jweeding"] = {"anim@amb@drug_field_workers@weeding@male_a@base", "base", "Diz Çök · Erkek  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jlookplan"] = {"missheist_agency2aig_4", "look_plan_c_worker2", "İyi Plan  ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["jgangdrink"] = {"amb@world_human_drinking_fat@beer@male@base", "base", "Gang İçkisi  ", AnimationOptions =
   {
       Prop = 'prop_cs_beer_bot_40oz_03',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jgangdrink"] = {"amb@world_human_drinking_fat@beer@male@idle_a", "idle_b", "Gang İçkisi 2  ", AnimationOptions =
   {
       Prop = 'prop_cs_beer_bot_40oz_03',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jmleaning"] = {"amb@world_human_leaning@male@wall@back@mobile@base", "base", "Telefonla Konuş · Erkek  ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
   }},
   ["jthanks"] = {"random@arrests", "thanks_male_05", "Teşekkürler  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jtextingmale"] = {"amb@world_human_stand_mobile_fat@male@text@base", "base", "Telefonla Yazış · Erkek  ", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
   }},
   ["sik"] = {"timetable@trevor@skull_loving_bear", "skull_loving_bear", "Kayayı Sik", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sotur9"] = {"timetable@reunited@ig_10", "isthisthebest_jimmy", " Sandalye Otur 9 ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sotur10"] = {"timetable@michael@on_sofabase", "sit_sofa_base", "Sandalye Otur 10  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sotur11"] = {"timetable@trevor@smoking_meth@base", "base", "Sandalye Otur 11  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sotur12"] = {"timetable@tracy@ig_7@base", "base", "Sandalye Otur 12  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["tırnaktemizle"] = {"amb@world_human_bum_standing@twitchy@base", "base", "Tırnaklarını Temizle  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["hazirlan"] = {"amb@world_human_jog_standing@male@fitbase", "base", "Hazırlan  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sebelde"] = {"anim@amb@casino@hangout@ped_male@stand@03b@base", "base", "Sol El Belde · Erkek", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sebelde2"] = {"anim@amb@casino@hangout@ped_female@stand@02a@base", "base", "Sol El Belde · Kadın  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["zeki2"] = {"anim@mp_player_intcelebrationfemale@mind_blown", "mind_blown", "Bir Zeki Sensin 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["boks"] = {"anim@mp_player_intcelebrationmale@shadow_boxing", "shadow_boxing", "Boks", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["boks2"] = {"anim@mp_player_intcelebrationfemale@shadow_boxing", "shadow_boxing", "Boks 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["pis"] = {"anim@mp_player_intcelebrationfemale@stinker", "stinker", "Pis Koku", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["düşün4"] = {"anim@amb@casino@hangout@ped_male@stand@02b@idles", "idle_a", "Düşün 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kravat"] = {"clothingtie", "try_tie_positive_a", "Kravatını Düzelt", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 5000
   }},
   ["boombox2"] = {"missfinale_c2mcs_1", "fin_c2_mcs_1_camman", "Hiphop 2 ~r~ +", AnimationOptions =
   {
       Prop = "prop_boombox_01",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.1, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kol"] = {"anim@veh@lowrider@std@ds@arm@base", "sit", "Kol (Araba Camı) ~r~ +", AnimationOptions = 
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["kol2"] = {"anim@veh@lowrider@std@ds@arm@base", "sit_high", "Kol (Araba Camı) 2 ~r~ +", AnimationOptions =  
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["kol3"] = {"anim@veh@lowrider@std@ds@arm@base", "sit_high_lowdoor", "Kol (Araba Camı) 3 ~r~ +", AnimationOptions =  
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["kol4"] = {"anim@veh@lowrider@std@ds@arm@base", "sit_low", "Kol (Araba Camı) 4 ~r~ +", AnimationOptions = 
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["kol5"] = {"anim@veh@lowrider@std@ds@arm@base", "sit_low_lowdoor", "Kol (Araba Camı) 5 ~r~ +", AnimationOptions =  
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["kol6"] = {"anim@veh@lowrider@std@ds@arm@base", "sit_lowdoor", "Kol (Araba Camı) 6 ~r~ +", AnimationOptions = 
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["cleanhands"] = {"missheist_agency3aig_23", "urinal_sink_loop", "Kirli Ellerini Temizle", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,

   }},
   ["cleanface"] = {"switch@michael@wash_face", "loop_michael", "Yüzünü Temizle", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,

   }},
   ["buzz"] = {"anim@apt_trans@buzzer", "buzz_reg", "Kapıyı Çal", AnimationOptions =
   {
      EmoteLoop = false,
      EmoteMoving = false,

   }},
   ["piss"] = {"missbigscore1switch_trevor_piss", "piss_loop", "İşe (Erkek)", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,

   }},
   ["picklock"] = {"missheistfbisetup1", "hassle_intro_loop_f", "Maymuncukla", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,

   }},
   ["fspose3"] = {"anim@amb@carmeet@checkout_car@", "female_c_idle_d", "Seks Pozisyonu (Kadın)", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["highlow3"] = {"anim@tactical_highlow_high_leftlean", "high_leftlean_clip", "Highlow Left Lean High (Smos)", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = false,
   }}, 
   ["highlow4"] = {"anim@tactical_highlow_low_leftlean", "low_leftlean_clip", "Highlow Left Lean Low (Smos)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},   
   ["kneeltalkie"] = {"anim@tactical_kneel_walkie", "kneel_walkie_clip", "Communication Relaxed Rifle (Smos)", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = true,
   }},  
   ["aimkneel"] = {"anim@tactical_kneel_aiming", "kneel_aiming_clip", "Kneeling and Aiming Rifle (Smos)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},  
   ["riflerelax1"] = {"anim@male_tactical_collapsed_lowready", "collapsed_lowready_clip", "Collapsed Lowready Relaxed Rifle (Smos)", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = true,
   }},   
   ["riflerelax2"] = {"anim@male_tactical_highready_relaxed", "highready_relaxed_clip", "Highready Relaxed Rifle (Smos)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   
}

DP.PropEmotes = {
   ["şemsiye"] = {"amb@world_human_drinking@coffee@male@base", "base", "Şemsiye", AnimationOptions =
   {
       Prop = "p_amb_brolly_01",
       PropBone = 57005,
       PropPlacement = {0.15, 0.005, 0.0, 87.0, -20.0, 180.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ['umbrella2'] = {'rcmnigel1d', 'base_club_shoulder', 'Şemsiye 2', AnimationOptions =
   {
      Prop = 'p_amb_brolly_01',
      PropBone = 28422,
      PropPlacement = {0.0700, 0.0100, 0.1100, 2.3402393, -150.9605721, 57.3374916},
      EmoteLoop = true,
      EmoteMoving = true,
   }},

   ["bubbletea"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Bubble Tea", 
   AnimationOptions = { Prop = 'apa_prop_cs_plastic_cup_01', 
   PropBone = 28422, 
   PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, 
   EmoteLoop = true,
   EmoteMoving = true,
   }}, 
   ["uwusandy"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Uwu Kek", 
   AnimationOptions = { Prop = 'ng_proc_food_ornge1a', 
   PropBone = 18905, 
   PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0}, 
   EmoteMoving = true, }}, 
   ["budhabowl"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "Yeşil Çorba", 
   AnimationOptions = { Prop = "prop_cs_bowl_01b", 
   PropBone = 60309, 
   PropPlacement = {0.0, 0.0300, 0.0100, 0.0, 0.0, 0.0}, 
   SecondProp = 'h4_prop_h4_caviar_spoon_01a', 
   SecondPropBone = 28422, 
   SecondPropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0}, 
   EmoteLoop = true, 
   EmoteMoving = true, }},

   ["graffiti"] = {"switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar", "Graffiti ~r~ +", AnimationOptions =
   {
       Prop = "prop_paint_spray01a",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.070, 0.0, 0.0, 0.0},
       EmoteMoving = false,
       EmoteLoop = true,
   }},
   ["graffiti2"] = {"switch@franklin@lamar_tagging_wall", "lamar_tagging_exit_loop_lamar", "Graffiti 2 ~r~ +", AnimationOptions =
   {
       Prop = "prop_spraygun_01",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.070, 0.0, 0.0, 0.0},
       EmoteMoving = false,
       EmoteLoop = true,
   }},
       ["graffiti3"] = {"anim@scripted@freemode@postertag@graffiti_spray@male@", "shake_can_male", "Graffiti 3 ~r~ +", AnimationOptions =
   {
      Prop = "prop_cs_spray_can",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
    ["graffiti4"] = {"anim@scripted@freemode@postertag@graffiti_spray@heeled@", "shake_can_female", "Graffiti 4 ~r~ +", AnimationOptions =
   {
      Prop = "prop_cs_spray_can",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["graffiti5"] = {"anim@scripted@freemode@postertag@graffiti_spray@male@", "spray_can_var_01_male", "Graffiti 5 ~r~ +", AnimationOptions =
   {
      Prop = "prop_cs_spray_can",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["graffiti6"] = {"anim@scripted@freemode@postertag@graffiti_spray@male@", "spray_can_var_02_male", "Graffiti 6 ~r~ +", AnimationOptions =
   {
      Prop = "prop_cs_spray_can",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["graffiti7"] = {"anim@scripted@freemode@postertag@graffiti_spray@heeled@", "spray_can_var_01_female", "Graffiti 7 ~r~ +", AnimationOptions =
   {
      Prop = "prop_cs_spray_can",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
     }},
    ["graffiti8"] = {"anim@scripted@freemode@postertag@graffiti_spray@heeled@", "spray_can_var_02_female", "Graffiti 8 ~r~ +", AnimationOptions =
   {
      Prop = "prop_cs_spray_can",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},

   ["boombox"] = {"missheistdocksprep1hold_cellphone", "static", "Boombox ~r~ +", AnimationOptions =
   {
       Prop = "prop_boombox_01",
       PropBone = 57005,
       PropPlacement = {0.29, 0.0, -0.012, 0.0, 266.0, 60.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},

["dürbün"] = {"amb@world_human_binoculars@male@idle_b", "idle_f", "Dürbün", AnimationOptions =
{
   Prop = "prop_binoc_01",
   PropBone = 28422,
   PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
   EmoteLoop = true,
   EmoteMoving = true,
}},

 ["dürbün2"] = {"amb@world_human_binoculars@male@idle_a", "idle_c", "Dürbün 2", AnimationOptions =
{
   Prop = "prop_binoc_01",
   PropBone = 28422,
   PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
   EmoteLoop = true,
   EmoteMoving = true,
}},
["tenis"] = {"move_weapon@jerrycan@generic", "idle", "Tenis Oyna", AnimationOptions =
{
   Prop = "prop_tennis_bag_01",
   PropBone = 57005,
   PropPlacement = {0.27, 0.0, 0.0, 91.0, 0.0, -82.9999951},
   SecondProp = 'prop_tennis_rack_01',
   SecondPropBone = 60309,
   SecondPropPlacement = {0.0800, 0.0300, 0.0, -130.2907295, 3.8782324, 6.588224},
   EmoteLoop = true,
   EmoteMoving = true,


}},
["ağırlık"] = {"amb@world_human_muscle_free_weights@male@barbell@base", "base", "Ağırlık Kaldır", AnimationOptions =
{
   Prop = "prop_curl_bar_01",
   PropBone = 28422,
   PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
   EmoteLoop = true,
   EmoteMoving = true,
}},
["ağırlık2"] = {"amb@world_human_muscle_free_weights@male@barbell@idle_a", "idle_d", "Ağırlık Kaldır 2", AnimationOptions =
{
   Prop = "prop_curl_bar_01",
   PropBone = 28422,
   PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
   EmoteLoop = true,
   EmoteMoving = true,
}},
["benzin"] = {"weapons@misc@jerrycan@", "fire", "Benzin", AnimationOptions =
{
   Prop = "w_am_jerrycan",
   PropBone = 57005,
   PropPlacement = {0.1800, 0.1300, -0.2400, -165.8693883, -11.2122753, -32.9453021},
   EmoteLoop = true,
   EmoteMoving = true,
}},
["benzin2"] = {"weapons@misc@jerrycan@franklin", "idle", "Benzin 2", AnimationOptions =
{
   Prop = "w_am_jerrycan",
   PropBone = 28422,
   PropPlacement = {0.26, 0.050, 0.0300, 80.00, 180.000, 79.99},
   EmoteLoop = true,
   EmoteMoving = true,
}},
["benzinotostop"] = {"random@hitch_lift", "idle_f", "Benzin Otostop", AnimationOptions =
{
   Prop = "w_am_jerrycan",
   PropBone = 18905,
   PropPlacement = {0.32, -0.0100, 0.0, -162.423, 74.83, 58.79},
    SecondProp = 'prop_michael_backpack',
   SecondPropBone = 40269,
   SecondPropPlacement = {-0.07, -0.21, -0.11, -144.93, 117.358, -6.16},
   EmoteLoop = true,
   EmoteMoving = true,
}},
   ["tabela"] = {"rcmnigel1d", "base_club_shoulder", "Dur Tabelası", AnimationOptions =
   {
      Prop = "prop_sign_road_01a",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
  }},
   ["tabela2"] = {"rcmnigel1d", "base_club_shoulder", "Yol Tabelası ", AnimationOptions =
   {
      Prop = "prop_sign_road_02a",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
   ["tabela3"] = {"rcmnigel1d", "base_club_shoulder", "Hastane Tabelası ", AnimationOptions =
   {
      Prop = "prop_sign_road_03d",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["tabela4"] = {"rcmnigel1d", "base_club_shoulder", "Park Tabelası", AnimationOptions =
   {
      Prop = "prop_sign_road_04a",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["tabela5"] = {"rcmnigel1d", "base_club_shoulder", "Park Tabelası 2 ", AnimationOptions =
   {
      Prop = "prop_sign_road_04w",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
   ["tabela6"] = {"rcmnigel1d", "base_club_shoulder", "Yaya Yolu Tabelası ", AnimationOptions =
   {
      Prop = "prop_sign_road_05a",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
   ["tabela7"] = {"rcmnigel1d", "base_club_shoulder", "Cadde Tabelası ", AnimationOptions =
   {
      Prop = "prop_sign_road_05t",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["tabela8"] = {"rcmnigel1d", "base_club_shoulder", "Oto Yol Tabelası ", AnimationOptions =
   {
      Prop = "prop_sign_freewayentrance",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["tabela9"] = {"rcmnigel1d", "base_club_shoulder", "Karlı Dur Tabelası ", AnimationOptions =
   {
      Prop = "prop_snow_sign_road_01a",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["koni"] = {"move_m@drunk@verydrunk_idles@", "fidget_07", "Koni Kafa ", AnimationOptions =
   {
      Prop = "prop_roadcone02a",
      PropBone = 31086,
      PropPlacement = {-0.0300, 0.0200, 0.000, 0.000, 83.9000, 0.000},
      --
      EmoteLoop = true,
      EmoteMoving = true,
   }},


   ["pizza"] = {"anim@heists@box_carry@", "idle", "Pizza Kutusu", AnimationOptions =
   {
      Prop = "prop_pizza_box_02",
      PropBone = 28422,
      PropPlacement = {0.0100, -0.1000, -0.1590,20.0000007, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
    ["poşet"] = {"move_weapon@jerrycan@generic", "idle", "Yemek Paketi", AnimationOptions =
   {
      Prop = "prop_food_bs_bag_01",
      PropBone = 57005,
      PropPlacement = {0.3300, 0.0, -0.0300, 0.0017365, -79.9999997, 110.0651988},
      EmoteLoop = true,
      EmoteMoving = true,
     }},
    ["poşet2"] = {"move_weapon@jerrycan@generic", "idle", "Yemek Paketi 2", AnimationOptions =
   {
      Prop = "prop_food_cb_bag_01",
      PropBone = 57005,
      PropPlacement = {0.3800, 0.0, -0.0300, 0.0017365, -79.9999997, 110.0651988},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["poşet3"] = {"move_weapon@jerrycan@generic", "idle", "Yemek Paketi 3", AnimationOptions =
   {
      Prop = "prop_food_bag1",
      PropBone = 57005,
      PropPlacement = {0.3800, 0.0, -0.0300, 0.0017365, -79.9999997, 110.0651988},
      EmoteLoop = true,
      EmoteMoving = true,
    }},

   ["gül2"] = {"creatures@pug@move", "nill", "Gül", AnimationOptions =
   {
      Prop = 'prop_single_rose',
      PropBone = 12844,
      PropPlacement = {0.025, 0.12, 0.20, 0.0, 10.0, 40.0}, 
      EmoteLoop = true,
      EmoteMoving = false,
    }},


   ["tepsi"] = {"anim@heists@box_carry@", "idle", "Yemek Tepsisi", AnimationOptions =
   {
      Prop = "prop_food_tray_02",
      PropBone = 28422,
      PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
     }},
     
    ["tepsi2"] = {"anim@heists@box_carry@", "idle", "Yemek Tepsisi 2", AnimationOptions =
    {
       Prop = "prop_food_tray_02",
       PropBone = 28422,
       PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
       }},  

       ["tepsi3"] = {"anim@heists@box_carry@", "idle", "Yemek Tepsisi 3", AnimationOptions =
       {
          Prop = "prop_food_tray_03",
          PropBone = 28422,
          PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
          EmoteLoop = true,
          EmoteMoving = true,
       }},
          
       ["tepsi4"] = {"anim@heists@box_carry@", "idle", "Yemek Tepsisi 4", AnimationOptions =
       {
          Prop = "prop_food_bs_tray_03",
          PropBone = 28422,
          PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
          EmoteLoop = true,
          EmoteMoving = true,
        }},

        ["tepsi5"] = {"anim@heists@box_carry@", "idle", "Yemek Tepsisi 5", AnimationOptions =
        {
           Prop = "prop_food_bs_tray_02",
           PropBone = 28422,
           PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
           EmoteLoop = true,
           EmoteMoving = true,
        }},

        ["tepsi6"] = {"anim@heists@box_carry@", "idle", "Yemek Tepsisi 6", AnimationOptions =
        {
           Prop = "prop_food_cb_tray_02",
           PropBone = 28422,
           PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
           EmoteLoop = true,
           EmoteMoving = true,
          }},

   ["not"] = {"missheistdockssetup1clipboard@base", "base", "Not Defteri", AnimationOptions =
   {
       Prop = 'prop_notepad_01',
       PropBone = 18905,
       PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
       SecondProp = 'prop_pencil_01',
       SecondPropBone = 58866,
       SecondPropPlacement = {0.11, -0.02, 0.001, -120.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kutu"] = {"anim@heists@box_carry@", "idle", "Kutu", AnimationOptions =
   {
       Prop = "hei_prop_heist_box",
       PropBone = 60309,
       PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gül"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Çiçek", AnimationOptions =
   {
       Prop = "prop_single_rose",
       PropBone = 18905,
       PropPlacement = {0.13, 0.15, 0.0, -100.0, 0.0, -20.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["çanta"] = {"missheistdocksprep1hold_cellphone", "static", "Çanta", AnimationOptions =
   {
       Prop = "prop_ld_suitcase_01",
       PropBone = 57005,
       PropPlacement = {0.39, 0.0, 0.0, 0.0, 266.0, 60.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["çanta2"] = {"missheistdocksprep1hold_cellphone", "static", "Çanta 2", AnimationOptions =
   {
       Prop = "prop_security_case_01",
       PropBone = 57005,
       PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["mugshot"] = {"mp_character_creation@customise@male_a", "loop", "Pano Tut", AnimationOptions =
   {
       Prop = 'prop_police_id_board',
       PropBone = 58868,
       PropPlacement = {0.12, 0.24, 0.0, 5.0, 0.0, 70.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kahve"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Kahve", AnimationOptions =
   {
       Prop = 'p_amb_coffeecup_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["viski"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Viski", AnimationOptions =
   {
       Prop = 'prop_drink_whisky',
       PropBone = 28422,
       PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bardak"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Bardak", AnimationOptions =
   {
       Prop = 'prop_plastic_cup_02',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["donut"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut", AnimationOptions =
   {
       Prop = 'prop_amb_donut',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["burger"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Burger", AnimationOptions =
   {
       Prop = 'prop_cs_burger_01',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["süpürge"] = {"anim@amb@drug_field_workers@rake@male_a@base", "base", "Süpürge", AnimationOptions =
   {
      Prop = "prop_tool_broom",
      PropBone = 28422,
      PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
      EmoteLoop = true,
   }},
   ["süpürge2"] = {"anim@amb@drug_field_workers@rake@male_a@idles", "idle_b", "Süpürge 2", AnimationOptions =
   {
      Prop = "prop_tool_broom",
      PropBone = 28422,
      PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
      EmoteLoop = true,
   }},
   ["jgotc"] = {"random@getawaydriver@thugs", "base_a", "Araca Bin!  ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["jvsad"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Very Sad  ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kaz"] = {"anim@amb@drug_field_workers@rake@male_a@base", "base", "Kaz  ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
       Prop = 'prop_tool_shovel006',
       PropBone = 28422,
       PropPlacement = {0.0, 0.1, -0.6, 0.0, 0.0, 180.0},
   }},
   ["tırpan"] = {"anim@amb@drug_field_workers@rake@male_a@base", "base", "Tırmık", AnimationOptions =
   {
      Prop = "prop_tool_rake",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, -0.0300, 0.0, 0.0, 0.0},
      EmoteLoop = true,
   }},
   ["tırpan2"] = {"anim@amb@drug_field_workers@rake@male_a@idles", "idle_b", "Tırmık 2", AnimationOptions =
   {
      Prop = "prop_tool_rake",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, -0.0300, 0.0, 0.0, 0.0},
      EmoteLoop = true,
   }},
   ["tırpan3"] = {"anim@amb@drug_field_workers@rake@male_b@base", "base", "Tırmık 3", AnimationOptions =
   {
      Prop = "prop_tool_rake",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, -0.0300, 0.0, 0.0, 0.0},
      EmoteLoop = true,
   }},
   ["tırpan4"] = {"anim@amb@drug_field_workers@rake@male_b@idles", "idle_d", "Tırmık 4", AnimationOptions =
   {
      Prop = "prop_tool_rake",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, -0.0300, 0.0, 0.0, 0.0},
      EmoteLoop = true,
   }},
      ["selfie"] = {"anim@mp_player_intuppertake_selfie", "idle_a", "Selfie", AnimationOptions =
   {
      Prop = "prop_phone_ing",
      PropBone = 60309,
      PropPlacement = {0.0, 0.0,0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["süpürge3"] = {"anim@amb@drug_field_workers@rake@male_b@base", "base", "Süpürge 3", AnimationOptions =
   {
      Prop = "prop_tool_broom",
      PropBone = 28422,
      PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
      EmoteLoop = true,
   }},
   ["süpürge4"] = {"anim@amb@drug_field_workers@rake@male_b@idles", "idle_d", "Süpürge 4", AnimationOptions =
   {
      Prop = "prop_tool_broom",
      PropBone = 28422,
      PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
      EmoteLoop = true,
   }},
   ["tşampanya"] = {"anim@move_f@waitress", "idle", "Şampanya", AnimationOptions =
   {
      Prop = "vw_prop_vw_tray_01a",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0100,0.0,0.0,0.0},
      SecondProp = 'prop_champ_cool',
      SecondPropBone = 28422,
      SecondPropPlacement = {0.0,0.0,0.010,0.0,0.0,0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["sandviç"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Sandviç", AnimationOptions =
   {
       Prop = 'prop_sandwich_01',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["kola"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Kola", AnimationOptions =
   {
       Prop = 'prop_ecola_can',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gofret"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Gofret", AnimationOptions =
   {
       Prop = 'prop_choc_ego',
       PropBone = 60309,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
   }},
   ["candy"] = {"mp_player_inteat@pnq", "loop", "Şeker", AnimationOptions =
   {
      Prop = 'prop_candy_pqs',
      PropBone = 60309,
      PropPlacement = {-0.0300, 0.0180, 0.0, 180.0, 180.0, -88.099},
      EmoteMoving = true,
   }},
   ["beerf4"] = {"amb@world_human_drinking@beer@female@idle_a", "idle_e", "Bira Kadın 4", AnimationOptions =
   {
      Prop = 'prop_wine_rose',
      PropBone = 28422,
      PropPlacement = {-0.0, 0.04, -0.19, 10.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = false,
      ---       PropPlacement = {-0.0, 0.03, -0.20, 5.0, 0.0, 0.0},
      ---                         F&B   L&R   U&D  R.F&B
   }},
   ["paraylakonuş"] = {"cellphone@", "cellphone_call_listen_base", "Parayla Konuş ~r~ +", AnimationOptions =
   {
      Prop = "prop_anim_cash_pile_02",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, -0.0, -270.8, 180.0, 200.5},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["whiskeyb"] = {"amb@world_human_drinking@beer@male@idle_a", "idle_a", "Viski Şişesi", AnimationOptions =
   {
      Prop = 'ba_prop_battle_whiskey_bottle_2_s',
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.05, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["beerf3"] = {"amb@world_human_drinking@beer@female@idle_a", "idle_a", "Bira Kadın 3", AnimationOptions =
   {
      Prop = 'prop_amb_beer_bottle',
      PropBone = 28422,
      PropPlacement = {0.0, -0.0, 0.05, 15.0, 15.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = false,
   }},
   ["beerf2"] = {"amb@world_human_drinking@beer@female@idle_a", "idle_e", "Bira Kadın 2", AnimationOptions =
   {
      Prop = 'prop_wine_rose',
      PropBone = 28422,
      PropPlacement = {-0.0, 0.04, -0.19, 10.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
      ---       PropPlacement = {-0.0, 0.03, -0.20, 5.0, 0.0, 0.0},
      ---                         F&B   L&R   U&D  R.F&B
   }},
   ["şarap"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Şarap", AnimationOptions =
   {
       Prop = 'prop_drink_redwine',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["üfle"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Kadehe Üfle", AnimationOptions =
   {
       Prop = 'prop_champ_flute',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["şampanya"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Şampanya", AnimationOptions =
   {
       Prop = 'prop_drink_champ',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["puro"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Puro", AnimationOptions =
   {
       Prop = 'prop_cigar_02',
       PropBone = 47419,
       PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["puro2"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Puro 2", AnimationOptions =
   {
       Prop = 'prop_cigar_01',
       PropBone = 47419,
       PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["gitar"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Gitar", AnimationOptions =
   {
       Prop = 'prop_acc_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["gitar2"] = {"switch@trevor@guitar_beatdown", "001370_02_trvs_8_guitar_beatdown_idle_busker", "Gitar 2", AnimationOptions =
   {
       Prop = 'prop_acc_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["egitar"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Gitar Elektro", AnimationOptions =
   {
       Prop = 'prop_el_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["egitar2"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Gitar Elektro 2", AnimationOptions =
   {
       Prop = 'prop_el_guitar_03',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["kitap"] = {"cellphone@", "cellphone_text_read_base", "Kitap", AnimationOptions =
   {
       Prop = 'prop_novel_01',
       PropBone = 6286,
       PropPlacement = {0.15, 0.03, -0.065, 0.0, 180.0, 90.0}, -- This positioning isnt too great, was to much of a hassle
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["buket"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Çiçek Buketi", AnimationOptions =
   {
       Prop = 'prop_snow_flower_02',
       PropBone = 24817,
       PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["ayı"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Oyuncak Ayı", AnimationOptions =
   {
       Prop = 'v_ilev_mr_rasberryclean',
       PropBone = 24817,
       PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["sırtç"] = {"move_p_m_zero_rucksack", "idle", "Sırt Çantası", AnimationOptions =
   {
       Prop = 'p_michael_backpack_s',
       PropBone = 24818,
       PropPlacement = {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["dosya"] = {"missfam4", "base", "Dosyaya Bak", AnimationOptions =
   {
       Prop = 'p_amb_clipboard_01',
       PropBone = 36029,
       PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["harita"] = {"amb@world_human_tourist_map@male@base", "base", "Harita", AnimationOptions =
   {
       Prop = 'prop_tourist_map_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["ktabela"] = {"amb@world_human_bum_freeway@male@base", "base", "Karton Tabela", AnimationOptions =
   {
       Prop = 'prop_beggers_sign_03',
       PropBone = 58868,
       PropPlacement = {0.19, 0.18, 0.0, 5.0, 0.0, 40.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["parasaç"] = {"anim@mp_player_intupperraining_cash", "idle_a", "Para Saç", AnimationOptions =
   {
       Prop = 'prop_anim_cash_pile_01',
       PropBone = 60309,
       PropPlacement = {0.0, 0.0, 0.0, 180.0, 0.0, 70.0},
       EmoteMoving = true,
       EmoteLoop = true,
       PtfxAsset = "scr_xs_celebration",
       PtfxName = "scr_xs_money_rain",
       PtfxPlacement = {0.0, 0.0, -0.09, -80.0, 0.0, 0.0, 1.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['makeitrain'],
       PtfxWait = 500,
   }},
   ["fotoğraf"] = {"amb@world_human_paparazzi@male@base", "base", "Fotoğraf Makinesi", AnimationOptions =
   {
       Prop = 'prop_pap_camera_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
       PtfxAsset = "scr_bike_business",
       PtfxName = "scr_bike_cfid_camera_flash",
       PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
       PtfxWait = 200,
   }},
   ["şampanyaşişe"] = {"anim@mp_player_intupperspray_champagne", "idle_a", "Şampanya Şişesi", AnimationOptions =
   {
       Prop = 'ba_prop_battle_champ_open',
       PropBone = 28422,
       PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
       EmoteMoving = true,
       EmoteLoop = true,
       PtfxAsset = "scr_ba_club",
       PtfxName = "scr_ba_club_champagne_spray",
       PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['spraychamp'],
       PtfxWait = 500,
   }},
   ["çanta3"] = {"missheistdocksprep1hold_cellphone", "static", "Çanta 3", AnimationOptions =
   {
       Prop = "prop_ld_case_01",
       PropBone = 57005,
       PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tablet"] = {"amb@world_human_tourist_map@male@base", "base", "Tablet", AnimationOptions =
   {
       Prop = "prop_cs_tablet",
       PropBone = 28422,
       PropPlacement = {0.0, -0.03, 0.0, 20.0, -90.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tablet2"] = {"amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_a", "Tablet 2", AnimationOptions =
   {
       Prop = "prop_cs_tablet",
       PropBone = 28422,
       PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},

   ["map"] = {"amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_a", "Harita 2", AnimationOptions =
   {
      Prop = "prop_tourist_map_01",
      PropBone = 28422,
      PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},

   ["telefon"] = {"cellphone@", "cellphone_call_listen_base", "Telefonla Konuş", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},

   ["carryfood9"] = {"anim@heists@box_carry@", "idle", "Yemek Tepsisi 9", AnimationOptions =
   {
      Prop = "prop_food_tray_02",
      PropBone = 57005,
      PropPlacement = {0.2500, 0.1000, 0.0700,-110.5483936, 73.3529273, -16.338362},
	  SecondProp = 'prop_food_tray_03',
      SecondPropBone =18905,
      SecondPropPlacement = {0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263},
      EmoteLoop = true,
      EmoteMoving = true,
     }},

   ["carryfoodten"] = {"anim@heists@box_carry@", "idle", "Yemek Tepsisi 10", AnimationOptions =
   {
      Prop = "prop_food_tray_02",
      PropBone = 57005,
      PropPlacement = {0.2500, 0.1000, 0.0700,-110.5483936, 73.3529273, -16.338362},
	  SecondProp = 'prop_food_tray_02',
      SecondPropBone =18905,
      SecondPropPlacement = {0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["carryfood"] = {"anim@heists@box_carry@", "idle", "Yemek Tepsisi 11", AnimationOptions =
   {
      Prop = "prop_food_bs_tray_03",
      PropBone = 28422,
      PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["carryfood2"] = {"anim@heists@box_carry@", "idle", "Yemek Tepsisi 12", AnimationOptions =
   {
      Prop = "prop_food_bs_tray_02",
      PropBone = 28422,
      PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
    ["carryfood3"] = {"anim@heists@box_carry@", "idle", "Yemek Tepsisi 13", AnimationOptions =
   {
      Prop = "prop_food_cb_tray_02",
      PropBone = 28422,
      PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
     }},
    ["carryfood4"] = {"anim@heists@box_carry@", "idle", "Yemek Tepsisi 14", AnimationOptions =
   {
      Prop = "prop_food_tray_02",
      PropBone = 28422,
      PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
     }},

     ["kabak"] = {"missfbi4prepp1", "idle", "Balkabağı", AnimationOptions =
     {
        Prop = "prop_veg_crop_03_pump",
        PropBone = 28422,
        PropPlacement = {0.0200, 0.0600, -0.1200, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
     }},
     ["kabak2"] = {"anim@heists@box_carry@", "idle", "Balkabağı 2", AnimationOptions =
     {
        Prop = "prop_veg_crop_03_pump",
        PropBone = 28422,
        PropPlacement = {0.0100, -0.16000, -0.2100, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
     }},
     ["mop2"] = {"move_mop", "idle_scrub_small_player", "Paspas 2", AnimationOptions =
     {
        Prop = "prop_cs_mop_s",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.1200, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
     }},

        ["newsmic"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Haber Mikrofonu", AnimationOptions =
   {
      Prop = "p_ing_microphonel_01",
      PropBone = 4154,
      PropPlacement = {-0.00, -0.0200, 0.1100, 0.00, 0.0, 60.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["newsbmic"] = {"missfra1", "mcs2_crew_idle_m_boom", "Boom Mikrofonu", AnimationOptions =
   {
      Prop = "prop_v_bmike_01",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},

   ["kaz"] = {"anim@amb@drug_field_workers@rake@male_a@base", "base", "Kaz  ", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
       Prop = 'prop_tool_shovel006',
       PropBone = 28422,
       PropPlacement = {0.0, 0.1, -0.6, 0.0, 0.0, 180.0},
    }},

   ["beans"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "Fasulye", AnimationOptions =
   {
      Prop = "h4_prop_h4_caviar_tin_01a",
      PropBone = 60309,
      PropPlacement = {0.0, 0.0300, 0.0100,0.0,0.0,0.0},
      SecondProp = 'h4_prop_h4_caviar_spoon_01a',
      SecondPropBone = 28422,
      SecondPropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},

     ["leafblower"] = {"amb@world_human_gardener_leaf_blower@base", "base", "Ot Vakumlayıcı", AnimationOptions =
     {
        Prop = "prop_leaf_blower_01",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
     }},
     ["bbqf"] = {"amb@prop_human_bbq@male@idle_a", "idle_b", "BBQ (Kadın)", AnimationOptions =
     {
        Prop = "prop_fish_slice_01",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
     }},

     ["shit"] = {"missfbi3ig_0", "shit_loop_trev", "Bok", AnimationOptions =
     {
        Prop = "prop_toilet_roll_01",
        PropBone = 28422,
        PropPlacement = {0.0700, -0.02000, -0.2100, 0,0, 0.0, 0.0},
        SecondProp = 'prop_big_shit_01',
        SecondPropBone = 0,
        SecondPropPlacement = {-0.0100, 0.0600, -0.1550, 101.3015175, 7.3512213,-29.2665794},
        EmoteLoop = true,
        EmoteMoving = false,
     }},

    ["carryfood5"] = {"anim@heists@box_carry@", "idle", "Yemek Tepsisi 15", AnimationOptions =
   {
      Prop = "prop_food_tray_03",
      PropBone = 28422,
      PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},

   ["phonecall"] = {"cellphone@", "cellphone_call_listen_base", "Telefon Araması", AnimationOptions =
   {
      Prop = "prop_phone_ing",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},

   ["joint"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Joint", AnimationOptions =
   {
       Prop = 'p_cs_joint_02',
       PropBone = 47419,
       PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   
   ["brief"]  = {"move_weapon@jerrycan@generic", "idle", "Çanta", AnimationOptions =
   {
      Prop = "prop_ld_case_01",
      PropBone = 57005,
      PropPlacement = {0.12, 0.0, 0.0, 0.0, 255.0, 80.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["mop"] = {"missfbi4prepp1", "idle", "Paspas", AnimationOptions =
   {
      Prop = "prop_cs_mop_s",
      PropBone = 28422,
      PropPlacement = {-0.0200,-0.0600,-0.2000, -13.377, 10.3568, 17.9681},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["beerbox"] = {"move_weapon@jerrycan@generic", "idle", "Bira Kutusu 1", AnimationOptions =
   {
      Prop = "v_ret_ml_beerdus",
      PropBone = 57005,
      PropPlacement = {0.22, 0.0, 0.0, 0.0, 266.0, 48.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["beerbox2"] = {"move_weapon@jerrycan@generic", "idle", "Bira Kutusu 2", AnimationOptions =
   {
      Prop = "v_ret_ml_beeram",
      PropBone = 57005,
      PropPlacement = {0.22, 0.0, 0.0, 0.0, 266.0, 48.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["toolbox2"] = {"move_weapon@jerrycan@generic", "idle", "Alet Çantası 2", AnimationOptions =
   {
      Prop = "imp_prop_tool_box_01a",
      PropBone = 28422,
      PropPlacement = {0.3700,0.0200, 0.0, 90.00, 0.0, -90.00},
      EmoteLoop = true,
      EmoteMoving = true,
   }},

   ["smoke2"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_c", "Tüttür 2", AnimationOptions =
   {
      Prop = 'prop_cs_ciggy_01',
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["smoke3"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_b", "Tüttür 3", AnimationOptions =
   {
      Prop = 'prop_cs_ciggy_01',
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["smoke4"] = {"amb@world_human_smoking@female@idle_a", "idle_b", "Tüttür 4", AnimationOptions =
   {
      Prop = 'prop_cs_ciggy_01',
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
      ["fishing1"] = {"amb@world_human_stand_fishing@idle_a", "idle_a", "Balık Tut", AnimationOptions =
   {
      Prop = 'prop_fishing_rod_01',
      PropBone = 60309,
      PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
      EmoteLoop = true,
      EmoteMoving = false,
   }},
   ["fishing2"] = {"amb@world_human_stand_fishing@idle_a", "idle_b", "Balık Tut 2", AnimationOptions =
   {
      Prop = 'prop_fishing_rod_01',
      PropBone = 60309,
      PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
      EmoteLoop = true,
      EmoteMoving = false,
   }},
   ["fishing3"] = {"amb@world_human_stand_fishing@idle_a", "idle_c", "Balık Tut 3", AnimationOptions =
   {
      Prop = 'prop_fishing_rod_01',
      PropBone = 60309,
      PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
      EmoteLoop = true,
      EmoteMoving = false,
   }},
   ["toolbox"] = {"move_weapon@jerrycan@generic", "idle", "Alet Çantası", AnimationOptions =
   {
      Prop = "prop_tool_box_04",
      PropBone = 28422,
      PropPlacement = {0.3960,0.0410,-0.0030, -90.00, 0.0, 90.00},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["beerbox3"] = {"move_weapon@jerrycan@generic", "idle", "Bira Kutusu 3", AnimationOptions =
   {
      Prop = "v_ret_ml_beerpride",
      PropBone = 57005,
      PropPlacement = {0.22, 0.0, 0.0, 0.0, 266.0, 48.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["beerbox4"] = {"move_weapon@jerrycan@generic", "idle", "Bira Kutusu 4", AnimationOptions =
   {
      Prop = "v_ret_ml_beerbar",
      PropBone = 57005,
      PropPlacement = {0.22, 0.0, 0.0, 0.0, 266.0, 60.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},

   ["phonecall2"] = {"random@kidnap_girl", "ig_1_girl_on_phone_loop", "Telefon Araması 2", AnimationOptions =
   {
      Prop = "prop_phone_ing",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},

   ["phone"] = {"cellphone@", "cellphone_text_read_base", "Telefon", AnimationOptions =
   {
      Prop = "prop_phone_cs_frank",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},

   ["protest"] = {"rcmnigel1d", "base_club_shoulder", "Protesto", AnimationOptions =
   {
      Prop = "prop_cs_protest_sign_01",
      PropBone = 57005,
      PropPlacement = {0.1820, 0.2400, 0.0600, -69.3774235, 5.9142048, -13.9572354},
      --
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   
    ["carryfood6"] = {"anim@heists@box_carry@", "idle", "Pizza Kutusu", AnimationOptions =
   {
      Prop = "prop_pizza_box_02",
      PropBone = 28422,
      PropPlacement = {0.0100, -0.1000, -0.1590,20.0000007, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
    ["carryfood7"] = {"anim@heists@box_carry@", "idle", "Yemek Tepsisi 14", AnimationOptions =
   {
      Prop = "prop_food_bs_tray_02",
      PropBone = 57005,
      PropPlacement = {0.2500, 0.1000, 0.0700,-110.5483936, 73.3529273, -16.338362},
	  SecondProp = 'prop_food_bs_tray_03',
      SecondPropBone =18905,
      SecondPropPlacement = {0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["carryfood8"] = {"anim@heists@box_carry@", "idle", "Yemek Tepsisi 15", AnimationOptions =
    {
       Prop = "prop_food_cb_tray_02",
       PropBone = 57005,
       PropPlacement = {0.2500, 0.1000, 0.0700,-110.5483936, 73.3529273, -16.338362},
       SecondProp = 'prop_food_cb_tray_02',
       SecondPropBone =18905,
       SecondPropPlacement = {0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263},
       EmoteLoop = true,
       EmoteMoving = true,
     }},

   ["telefon2"] = {"cellphone@", "cellphone_text_read_base", "Telefona Bak", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cilala"] = {"timetable@floyd@clean_kitchen@base", "base", "Cilala", AnimationOptions =
   {
       Prop = "prop_sponge_01",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cilala2"] = {"amb@world_human_maid_clean@", "base", "Cilala 2", AnimationOptions =
   {
       Prop = "prop_sponge_01",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bira"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Bira ~r~ +", AnimationOptions =
   {
       Prop = 'prop_cs_beer_bot_40oz',
       PropBone = 28422,
       PropPlacement = {0.02, 0.0, -0.08, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bira2"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Bira 2 ~r~ +", AnimationOptions =
   {
       Prop = 'prop_cs_beer_bot_40oz_02',
       PropBone = 28422,
       PropPlacement = {0.02, 0.0, -0.08, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bira3"] = {"amb@world_human_drinking@beer@female@idle_a", "idle_e", "Bira 3 ~r~ +", AnimationOptions =
   {
       Prop = 'prop_cs_beer_bot_40oz_02',
       PropBone = 28422,
       PropPlacement = {0.0, -0.022, -0.01, 0.1, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["bira4"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Bira 4 ~r~ +", AnimationOptions =
   {
       Prop = 'prop_amb_beer_bottle',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hediye"] = {"bz@give_love@anim", "bz_give", "Hediye", AnimationOptions =
   {
       Prop = "bz_prop_gift",
       PropBone = 57005,
       PropPlacement = {0.15, -0.08, -0.08, -60.0, -120.0, 40.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hediye2"] = {"bz@give_love@anim", "bz_give", "Hediye 2", AnimationOptions =
   {
       Prop = "bz_prop_gift2",
       PropBone = 57005,
       PropPlacement = {0.15, -0.08, -0.08, -60.0, -120.0, 40.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["milka"] = {"bz@give_love@anim", "bz_give", "Milka", AnimationOptions =
   {
       Prop = "bz_prop_milka",
       PropBone = 57005,
       PropPlacement = {0.12, -0.05, -0.14, -19.0, -109.0, 40.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kolye"] = {"bz@give_love@anim", "bz_give", "Mücevher", AnimationOptions =
   {
       Prop = "bz_prop_jewel",
       PropBone = 57005,
       PropPlacement = {0.13, 0.0, -0.19, -38.0, -120.0, 40.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
}

