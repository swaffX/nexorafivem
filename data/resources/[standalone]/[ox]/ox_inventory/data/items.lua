return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['fishbait'] = {
		label = 'Balık Yemi',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	['pantfish'] = {
		label = 'Pantolon Balığı',
		weight = 50,
		stack = true,
		close = true,
		description = "A bag with cash"
	},

	['sise'] = {
		label = 'Şişe',
		weight = 50,
		stack = true,
		close = true,
		description = "Doğruluk, cesaretlik oynarsın bence?"
	},

	['cocoa'] = {
		label = 'Çikolatalı Süt',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},

	['blackcard'] = {
		name = 'blackcard',
		label = 'Blackcard',
		weight = 1000,
		image = 'blackcard.png',
		shouldClose = true,
		combinable = nil,
		description = 'Siyah bir kart.'
	},

	['bluepearl'] = {
		label = 'Mavi İnci',
		weight = 50,
		stack = true,
		close = true,
		description = "On new years eve a nice fire to stand next to"
	},
	['whitepearl'] = {
		label = 'Beyaz İnci',
		weight = 50,
		stack = true,
		close = true,
		description = "Sneaky Breaky..."
	},
	['evlilikyuzugu'] = {
		label = 'Evlilik Yüzüğü',
		weight = 50,
		stack = true,
		close = true,
		description = "Kadınlar sever..."
	},
	['fishingrod3'] = {
		label = 'Olta (3Lv.)',
		weight = 50,
		stack = false,
		close = true,
		description = "A bag with cash"
	},
	['carettacaretta'] = {
		label = 'Kaplumbağa',
		weight = 50,
		stack = true,
		close = false,
		description = "Sometimes handy to remember something :)"
	},
	['fishingrod1'] = {
		label = 'Olta (1Lv.)',
		weight = 50,
		stack = true,
		close = false,
		description = "Chips For Casino Gambling"
	},

	['surfboard'] = {
		label = 'Sorf Tahtası',
		weight = 50,
		stack = false,
		close = false,
		description = ""
	},

	['boombox'] = {
		label = 'Boombox',
		weight = 50,
		stack = false,
		close = false,
		description = ""
	},

	['bluefish'] = {
		label = 'Lüfer',
		weight = 50,
		stack = true,
		close = true,
		description = "Money?"
	},
	['sharkfish'] = {
		label = 'Köpek Balığı',
		weight = 50,
		stack = true,
		close = true,
		description = "The sky is the limit! Woohoo!"
	},
	['ahtapot'] = {
		label = 'Ahtapot',
		weight = 50,
		stack = true,
		close = true,
		description = "The sky is the limit! Woohoo!"
	},
	['altinbalik'] = {
		label = 'Altın Balık',
		weight = 50,
		stack = true,
		close = true,
		description = "The sky is the limit! Woohoo!"
	},
	['kefal'] = {
		label = 'Kefal Balığı',
		weight = 50,
		stack = true,
		close = true,
		description = "The sky is the limit! Woohoo!"
	},
	['kilicbaligi'] = {
		label = 'Kılıç balığı',
		weight = 50,
		stack = true,
		close = true,
		description = "The sky is the limit! Woohoo!"
	},
	['aslanbaligi'] = {
		label = 'Aslan balığı',
		weight = 50,
		stack = true,
		close = true,
		description = "The sky is the limit! Woohoo!"
	},
	['balon'] = {
		label = 'Balon balığı',
		weight = 50,
		stack = true,
		close = true,
		description = "The sky is the limit! Woohoo!"
	},
	['renklibalik'] = {
		label = 'Renkli balığı',
		weight = 50,
		stack = true,
		close = true,
		description = "The sky is the limit! Woohoo!"
	},
	['hayaletvatoz'] = {
		label = 'Vatoz Balığı',
		weight = 50,
		stack = true,
		close = true,
		description = "The sky is the limit! Woohoo!"
	},
	['yellowpearl'] = {
		label = 'Sarı İnci',
		weight = 50,
		stack = true,
		close = true,
		description = "Money?"
	},
	['perch'] = {
		label = 'Levrek',
		weight = 50,
		stack = true,
		close = false,
		description = "Chips For Casino Gambling"
	},
	['fishingrod4'] = {
		label = 'Olta (4Lv.)',
		weight = 50,
		stack = false,
		close = true,
		description = "The sky is the limit! Woohoo!"
	},
	['hotel_card'] = {
		label = 'Otel Kartı',
		weight = 50,
		stack = false,
		close = true,
		description = ""
	},
	
	['anchovy'] = {
		label = 'Hamsi',
		weight = 50,
		stack = true,
		close = true,
		description = "On new years eve a nice fire to stand next to"
	},
	['bonitosfish'] = {
		label = 'Palamut',
		weight = 50,
		stack = true,
		close = true,
		description = "Key for a lock...?"
	},
	['garfish'] = {
		label = 'Zargana',
		weight = 50,
		stack = true,
		close = true,
		description = "A nice document"
	},
	['smallbluefish'] = {
		label = 'Küçük Mavi Balık',
		weight = 50,
		stack = true,
		close = true,
		description = "Certificate that proves you own certain stuff"
	},

	['fishingrod1'] = {
		label = 'Olta (1Lv.)',
		weight = 50,
		stack = false,
		close = false,
		description = "Sometimes handy to remember something :)"
	},
	['fishingrod2'] = {
		label = 'Olta (2Lv.)',
		weight = 50,
		stack = false,
		close = false,
		description = "Sometimes handy to remember something :)"
	},
	['fishingrod3'] = {
		label = 'Olta (3Lv.)',
		weight = 50,
		stack = false,
		close = false,
		description = "Sometimes handy to remember something :)"
	},
	['fishingrod4'] = {
		label = 'Olta (4Lv.)',
		weight = 50,
		stack = false,
		close = false,
		description = "Sometimes handy to remember something :)"
	},
	['fishingrod5'] = {
		label = 'Olta (5Lv.)',
		weight = 50,
		stack = true,
		close = true,
		description = "Sneaky Breaky..."
	},
	['redpearl'] = {
		label = 'Kırmızı İnci',
		weight = 50,
		stack = true,
		close = true,
		description = "Certificate that proves you own certain stuff"
	},
	['greenpearl'] = {
		label = 'Yeşil İnci',
		weight = 50,
		stack = true,
		close = true,
		description = "Key for a lock...?"
	},
	['illegalfishbait'] = {
		label = 'Yasadışı Balık Yemi',
		weight = 50,
		stack = true,
		close = true,
		description = "A nice document"
	},
	['fish'] = {
		label = 'Minik Balık',
		weight = 50,
		stack = true,
		close = true,
		description = "A nice document"
	},

	['bandage'] = {
		label = 'Bandaj',
		weight = 50,
		stack = true,
		close = true,
		description = "A nice document"
	},

	['medkit'] = {
		label = 'İlkyardım Kiti',
		weight = 50,
		stack = true,
		close = true,
		description = "A nice document",
		client = {
			image = "medikit.png",
		}

	},

	['black_money'] = {
		label = 'Kara Para',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	['slicedcake'] = {
		label = 'Dilimlenmiş Pasta',
		weight = 220,
		client = {
			status = { hunger = 200000 },
		},
	},

	['birthdaycake'] = {
		label = 'Pasta',
		weight = 1,
		stack = true,
		close = true,
		consume = 0
	},

	['megaphone'] = {
		label = 'Megafon',
		weight = 1,
		stack = true,
		close = true,
		consume = 0
	},

	['rolex'] = {
		label = 'Altın Saat',
		weight = 100,
		stack = true,
		close = true,
		consume = 0
	},

	['contract'] = {
		label = 'Araç Satış Kontratı',
		weight = 100,
		stack = true,
		close = true,
		consume = 0
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Çöpçü',
	},

	['cookie'] = {
		label = 'Kurabiye',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cookie.png",
		}
	},

	['xmascc'] = {
		label = 'Çilekli Kek',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	['xmascc2'] = {
		label = 'Yaban Mersinli Kek',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "xmascc2.png",
		}
	},

	['donut'] = {
		label = 'Donut',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "donut.png",
		}
	},

	['donut2'] = {
		label = 'Çikolatalı Donut',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "donut2.png",
		}
	},

	['donut3'] = {
		label = 'Çilekli Donut',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "donut3.png",
		}
	},

	['candycaneb'] = {
		label = 'Elmalı Baston Şeker',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "candycaneb.png",
		}
	},

	['candycanef'] = {
		label = 'Baston Şeker',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "candycanef.png",
		}
	},

	['candycanec'] = {
		label = 'Böğürtlenli Baston Şeker',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "candycanec.png",
		}
	},

	['candycaned'] = {
		label = 'Limonlu Baston Şeker',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "candycaned.png",
		}
	},

	['macaroon'] = {
		label = 'Makarna',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "macaroon.png",
		}
	},

	['icecreama'] = {
		label = 'Çilekli Dondurma',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "icecreama.png",
		}
	},

	['icecreamb'] = {
		label = 'Çikolatalı Dondurma',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "icecreamb.png",
		}
	},

	['icecreamc'] = {
		label = 'Vanilyalı Dondurma',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "icecreamc.png",
		}
	},

	['icecreamd'] = {
		label = 'Antep Fıstıklı Dondurma',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "icecreamd.png",
		}
	},

	['icecreame'] = {
		label = 'Ahududulu Dondurma',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "icecreame.png",
		}
	},

	['icecreamf'] = {
		label = 'Karamelli Dondurma',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "icecreamf.png",
		}
	},

	['icecreamg'] = {
		label = 'Frambuazlı Dondurma',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "icecreamg.png",
		}
	},

	['xmasic'] = {
		label = 'Dondurma',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "xmasic.png",
		}
	},

	['stancerkit'] = {
		label = 'Kamber Kiti',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},

	['chameleonpaint_161'] = {
		label = 'Tek Renkli Sprey',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	['chameleonpaint_162'] = {
		label = 'Gece ve Gündüz Spreyi',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	['chameleonpaint_163'] = {
		label = 'Verlier Sprey',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	['chameleonpaint_164'] = {
		label = 'Sprunk Aşırı Sprey',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	['chameleonpaint_165'] = {
		label = 'Vice city Spreyi',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	['chameleonpaint_166'] = {
		label = 'Synthwave Gece Spreyi',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	['chameleonpaint_167'] = {
		label = 'Dört Mevsim Spreyi',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	['chameleonpaint_168'] = {
		label = 'Maisonette 9 Gerileme Spreyi',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	['chameleonpaint_169'] = {
		label = 'Sakız Spreyi',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	['chameleonpaint_170'] = {
		label = 'Full Rainbow Spreyi',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	['chameleonpaint_171'] = {
		label = 'Gün Batımı Spreyi',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	['chameleonpaint_172'] = {
		label = 'Yedi Sprey',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	['chameleonpaint_173'] = {
		label = 'Kamen Binici Sprey',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	['chameleonpaint_174'] = {
		label = 'Kromatik Sapma Spreyi',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	['chameleonpaint_175'] = {
		label = 'Noel! Sprey',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	['chameleonpaint_176'] = {
		label = 'Sıcaklık Spreyi',
		weight = 50,
		stack = true,
		close = true,
		description = ""
	},
	
	
	['drone_lspd'] = {
		label = 'Drone LSPD',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "drone_lspd.png",
		}
	},

	['kq_outfitbag'] = {
		label = 'Kıyafet Çantası',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "kq_outfitbag.png",
		}
	},

	['dagger10'] = {
		label = 'Dagger 10',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "box.png",
		}
	},

	['bat10'] = {
		label = 'Sopa 10',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "box.png",
		}
	},

	['dp910'] = {
		label = 'DP9 10Lu ',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "box.png",
		}
	},
	['g17a10'] = {
		label = 'G17 10Lu ',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "box.png",
		}
	},
	['ek20'] = {
		label = 'Etkinlik 20Li ',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "box.png",
		}
	},
	['g195'] = {
		label = 'G19 5Li ',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "box.png",
		}
	},
	['zirh30'] = {
		label = 'Zırh 30Lu ',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "box.png",
		}
	},
	['anahtar20'] = {
		label = 'Kelepçe Anahtarı 20 ',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "box.png",
		}
	},
	['susturucu10'] = {
		label = 'Susturucu 10 Lu ',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "box.png",
		}
	},
	['mermi30'] = {
		label = 'Mermi 30 Lu ',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "box.png",
		}
	},
	['wrapper'] = {
		label = 'Paket Kağıdı',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "wrapper.png",
		}
	},

	['cardboard'] = {
		label = 'Karton',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cardboard.png",
		}
	},

	['icecreamh'] = {
		label = 'Limonlu Dondurma',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},




	['ticket'] = {
		label = 'ticket',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ticket.png",
		}
	},

	
	['rentalpapers'] = {
		label = 'Araç sözleşmesi',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "rentalpapers.png",
		}
	},

	['uwububbleteamint'] = {
		label = 'BubbleTea Nane',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "uwububbleteamint.png",
		}
	},

	["uwupancake"] = {
		label = "Tuzlu Pankek",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["uwucupcake"] = {
		label = "Kek",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	['uwuchocsandy'] = {
		label = 'Çikolatalı Sandy',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['uwuvanillasandy'] = {
		label = 'Vanilyalı Sandy',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['uwubudhabowl'] = {
		label = 'Budha Bowl',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['uwusushi'] = {
		label = 'Sushi',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	['uwumisosoup'] = {
		label = 'uWu Çorba',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = 100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Maymuncuk',
		weight = 160,
	},

	['phone'] = {
		label = 'Telefon',
		weight = 190,
		stack = false,
		consume = 0,
	},

	['gps'] = {
		label = 'GPS',
		weight = 190,
		stack = false,
		consume = 0,
	},


	['money'] = {
		label = 'Para',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Su',
		weight = 500,
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	['enerji_icecegi'] = {
		label = 'Enerji İçeceği',
		weight = 500,
	},

	['radio'] = {
		label = 'Telsiz',
		weight = 100,
		stack = false,
		allowArmed = true
	},

	['pdkit'] = {
		label = 'PD Kit',
		weight = 100,
		stack = false,
		allowArmed = true
	},

	['radioscanner'] = {
		label = 'Telsiz Tarayıcı',
		weight = 100,
		stack = false,
		allowArmed = true
	},

	["dckart"] = {
		label = "Doğruluk Cesaret",
		weight = 100,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Zırh',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
	},
	
	["karapara"] = {
		label = "Kara Para",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "black_money.png",
		}
	},
	['guitarstand'] = {
		label = 'GuitarZero Stand',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['camera'] = {
		label = 'Kamera',
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "camera.png",
		}
	},
	['photo'] = {
		label = 'Fotoğraf',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['simoncoin'] = {
		label = 'Night Coin',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	["clothing_bag"] = {
		label = "Kıyafet Çantası",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "clothing_bag.png",
		}
	},

	["weed_seed"] = {
		label = "Ot Tohumu",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "weedseed.png",
		}
	},

	["weedwater"] = {
		label = "Ot Suyu",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "weedwater.png",
		}
	},

	["marijuana"] = {
		label = "Kaliteli Ot",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "marijuana.png",
		}
	},

	["marijuana2"] = {
		label = "Sahte Ot",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "marijuana.png",
		}
	},

	["heroin"] = {
		label = "Eroin",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "heroin.png",
		}
	},

	["mdma"] = {
		label = "MDMA",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "mdma.png",
		}
	},

	["cocaine"] = {
		label = "Kokain",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "cocaine.png",
		}
	},

	["weedfertilizer"] = {
		label = "Ot Gübresi",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "weedfertilizer.png",
		}
	},

	["weedlighter"] = {
		label = "Ot Çakmağı",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g White Widow",
		client = {
			image = "weed_baggy.png",
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["weed_white-widow"] = {
		label = "Beyaz Dul 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g White Widow",
		client = {
			image = "weed_baggy.png",
		}
	},

	["radioscanner"] = {
		label = "Radio Scanner",
		weight = 100,
		stack = true,
		close = true,
		description = "With this you can get some police alerts. Not 100% effective however",
		client = {
			image = "radioscanner.png",
		}
	},

	["diamond"] = {
		label = "Elmas",
		weight = 100,
		stack = true,
		close = true,
		description = "A diamond seems like the jackpot to me!",
		client = {
			image = "diamond.png",
		}
	},

	["weed_og-kush_seed"] = {
		label = "OGKush Tohumu",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of OG Kush",
		client = {
			image = "weed_seed.png",
		}
	},

	["electronickit"] = {
		label = "Elektronik Kiti",
		weight = 100,
		stack = true,
		close = true,
		description = "If you've always wanted to build a robot you can maybe start here. Maybe you'll be the new Elon Musk?",
		client = {
			image = "electronickit.png",
		}
	},

	["aluminum"] = {
		label = "Alüminyum",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "aluminum.png",
		}
	},

	["weed_ak47"] = {
		label = "AK47 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g AK47",
		client = {
			image = "weed_baggy.png",
		}
	},

	["samsungphone"] = {
		label = "Samsung S10",
		weight = 100,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "samsungphone.png",
		}
	},

	["water_bottle"] = {
		label = "Su Şişesi",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "water_bottle.png",
		}
	},

	["gatecrack"] = {
		label = "Kapı Çatlağı",
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to tear down some fences",
		client = {
			image = "usb_device.png",
		}
	},

	["advancedrepairkit"] = {
		label = "Gelişmiş Tamir Kiti",
		weight = 4000,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "advancedkit.png",
		}
	},

	["rubber"] = {
		label = "Kauçuk",
		weight = 100,
		stack = true,
		close = false,
		description = "Rubber, I believe you can make your own rubber ducky with it :D",
		client = {
			image = "rubber.png",
		}
	},

	["firework1"] = {
		label = "havai fişek1",
		weight = 100,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework1.png",
		}
	},

	["whiskey"] = {
		label = "Viski",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "whiskey.png",
		}
	},

	["weed_white-widow_seed"] = {
		label = "Beyaz Dul Tohumu",
		weight = 0,
		stack = true,
		close = false,
		description = "A weed seed of White Widow",
		client = {
			image = "weed_seed.png",
		}
	},

	["plastic"] = {
		label = "Plastik",
		weight = 100,
		stack = true,
		close = false,
		description = "RECYCLE! - Greta Thunberg 2019",
		client = {
			image = "plastic.png",
		}
	},

	["vodka"] = {
		label = "Votka",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "vodka.png",
		}
	},

	["advanceddrill"] = {
		label = "Gelişmiş Matkap",
		weight = 500,
		stack = true,
		close = false,
		description = "Büyük İşlerde Kullanılır...",
		client = {
			image = "drill.png",
		}
	},

	["drill"] = {
		label = "Matkap",
		weight = 500,
		stack = true,
		close = false,
		description = "Ufak tefek İşlerde Kullanılır...",
		client = {
			image = "drill.png",
		}
	},

	["weed_purple-haze"] = {
		label = "Mor Pus 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Purple Haze",
		client = {
			image = "weed_baggy.png",
		}
	},

	["painkillers"] = {
		label = "Ağrı Kesici",
		weight = 0,
		stack = true,
		close = true,
		description = "For pain you can't stand anymore, take this pill that'd make you feel great again",
		client = {
			image = "painkillers.png",
		}
	},

	["security_card_01"] = {
		label = "Güvenlik Kartı A",
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_01.png",
		}
	},

	["handcuffs"] = {
		label = "Kelepçe",
		weight = 100,
		stack = true,
		close = true,
		description = "Comes in handy when people misbehave. Maybe it can be used for something else?",
		client = {
			image = "handcuffs.png",
		}
	},

	["copper"] = {
		label = "Bakır",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "copper.png",
		}
	},

	["diamond_ring"] = {
		label = "Elmas Yüzük",
		weight = 500,
		stack = true,
		close = true,
		description = "A diamond ring seems like the jackpot to me!",
		client = {
			image = "diamond_ring.png",
		}
	},

	["weaponlicense"] = {
		label = "Silah Ruhsatı",
		weight = 0,
		stack = false,
		close = true,
		description = "Weapon License",
		client = {
			image = "weapon_license.png",
		}
	},

	["deer_bait"] = {
		label = "Düşük Kaliteli Geyik Yemi",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "deer_bait.png",
		}
	},

	["deer_bait2"] = {
		label = "Yüksek Kaliteli Geyik Yemi",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "deer_bait2.png",
		}
	},

	["pig_bait"] = {
		label = "Düşük Kaliteli Domuz Yemi",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pig_bait.png",
		}
	},

	["pig_bait2"] = {
		label = "Yüksek Kaliteli Domuz Yemi",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pig_bait2.png",
		}
	},

	["deer_meat"] = {
		label = "Kalitesiz Geyik Eti",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "deer_meat.png",
		}
	},

	["deer_meat2"] = {
		label = "Yüksek Kaliteli Geyik Eti",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "deer_meat2.png",
		}
	},

	["meatpig"] = {
		label = "Kalitesiz Domuz Eti",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pig_meat.png",
		}
	},

	["pig_meat2"] = {
		label = "Yüksek Kaliteli Domuz Eti",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pig_meat2.png",
		}
	},

	["chicken_meat"] = {
		label = "Kalitesiz Tavuk Eti",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chicken_meat.png",
		}
	},

	["chicken_meat2"] = {
		label = "Yüksek Kaliteli Tavuk Eti",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chicken_meat2.png",
		}
	},

	["heavyarmor"] = {
		label = 'Çelik Yelek',
		weight = 50,
		stack = true,
		close = true,
		description = "",
		allowArmed = true

	},

	["heavyarmor2"] = {
		label = "Polis Zırhı",
		weight = 50,
		stack = true,
		close = true,
		description = "",
		allowArmed = true

	},
	["binoculars"] = {
		label = "Binoculars",
		weight = 600,
		stack = true,
		close = true,
		description = "Sneaky Breaky...",
		client = {
			image = "binoculars.png",
		}
	},

	["aluminumoxide"] = {
		label = "Alüminyum Tozu",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with",
		client = {
			image = "aluminumoxide.png",
		}
	},

	["gps"] = {
		label = "GPS",
		weight = 100,
		stack = true,
		close = true,
		description = "GPS",
		client = {
			image = "gps.png",
		}
	},

	["firework3"] = {
		label = "WipeOut",
		weight = 100,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework3.png",
		}
	},

	["tablet"] = {
		label = "Tablet",
		weight = 300,
		stack = true,
		close = true,
		description = "Expensive tablet",
		client = {
			image = "tablet.png",
		}
	},

	["armor"] = {
		label = "Çelik Yelek",
		weight = 2500,
		stack = true,
		close = true,
		description = "?",
		client = {
			image = "armor.png",
		}
	},

	["coke_brick"] = {
		label = "Kola Tuğlası",
		weight = 100,
		stack = false,
		close = true,
		description = "Heavy package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_brick.png",
		}
	},

	["weed_ak47_seed"] = {
		label = "AK47 Tohum",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of AK47",
		client = {
			image = "weed_seed.png",
		}
	},

	["cryptostick"] = {
		label = "Kripto Çubuğu",
		weight = 200,
		stack = false,
		close = true,
		description = "Why would someone ever buy money that doesn't exist.. How many would it contain..?",
		client = {
			image = "cryptostick.png",
		}
	},

	["stickynote"] = {
		label = "Yapışkan Not",
		weight = 0,
		stack = false,
		close = false,
		description = "Sometimes handy to remember something :)",
		client = {
			image = "stickynote.png",
		}
	},

	["jerry_can"] = {
		label = "Yakıt bidonu 20L",
		weight = 20000,
		stack = true,
		close = true,
		description = "A can full of Fuel",
		client = {
			image = "jerry_can.png",
		}
	},

	["kurkakola"] = {
		label = "Cola",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["tosti"] = {
		label = "Kızarmış Peynirli Sandviç",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice to eat",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["beer"] = {
		label = "Bira",
		weight = 500,
		stack = true,
		close = true,
		description = "Nothing like a good cold beer!",
		client = {
			image = "beer.png",
		}
	},

	["pkelepce"] = {
		label = "Kelepçe",
		weight = 200,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "pkelepce.png",
		}
	},

	["pkelepceanahtar"] = {
		label = "Kelepçe Anahtarı",
		weight = 200,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "pkelepceanahtar.png",
		}
	},

	["kelepce"] = {
		label = "Kelepçe",
		weight = 200,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "pkelepce.png",
		}
	},

	["kelepceanahtar"] = {
		label = "Kelepçe Anahtarı",
		weight = 200,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "pkelepceanahtar.png",
		}
	},

	["kelepceanahtari"] = {
		label = "Sivil Kelepçe Anahtarı",
		weight = 200,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "kelepceanahtari.png",
		}
	},

	["filled_evidence_bag"] = {
		label = "Kanıt Torbası",
		weight = 200,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "evidence.png",
		}
	},

	["visa"] = {
		label = "Visa Card",
		weight = 0,
		stack = false,
		close = false,
		description = "Visa can be used via ATM",
		client = {
			image = "visacard.png",
		}
	},

	["trojan_usb"] = {
		label = "Trojan USB",
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to shut down some systems",
		client = {
			image = "usb_device.png",
		}
	},

	["empty_weed_bag"] = {
		label = "Boş Ot Torbası",
		weight = 0,
		stack = true,
		close = true,
		description = "A small empty bag",
		client = {
			image = "weed_baggy_empty.png",
		}
	},

	["rolex"] = {
		label = "Altın Saat",
		weight = 500,
		stack = true,
		close = true,
		description = "A golden watch seems like the jackpot to me!",
		client = {
			image = "rolex.png",
		}
	},

	["goldchain"] = {
		label = "Altın Zincir",
		weight = 500,
		stack = true,
		close = true,
		description = "A golden chain seems like the jackpot to me!",
		client = {
			image = "goldchain.png",
		}
	},

	["nitrous"] = {
		label = "Nitro",
		weight = 10000,
		stack = true,
		close = true,
		description = "Speed up, gas pedal! :D",
		client = {
			image = "nitrous.png",
		}
	},

	["10kgoldchain"] = {
		label = "10 Ayar Altın Zincir",
		weight = 1000,
		stack = true,
		close = true,
		description = "10 carat golden chain",
		client = {
			image = "10kgoldchain.png",
		}
	},

	["lighter"] = {
		label = "Fener",
		weight = 0,
		stack = true,
		close = true,
		description = "On new years eve a nice fire to stand next to",
		client = {
			image = "lighter.png",
		}
	},

	["diving_gear"] = {
		label = "Dalgıç Kıyafeti",
		weight = 30000,
		stack = false,
		close = true,
		description = "Bir oksijen tankı ve bir solunum cihazı",
		client = {
			image = "diving_gear.png",
		}
	},

	["rolling_paper"] = {
		label = "Rulo Kağıt",
		weight = 0,
		stack = true,
		close = true,
		description = "Paper made specifically for encasing and smoking tobacco or cannabis.",
		client = {
			image = "rolling_paper.png",
		}
	},

	["markedbills"] = {
		label = "İşaretli Para",
		weight = 100,
		stack = false,
		close = true,
		description = "Money?",
		client = {
			image = "markedbills.png",
		}
	},

	["wine"] = {
		label = "Şarap",
		weight = 300,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "wine.png",
		}
	},

	["weed_brick"] = {
		label = "Ot Tuğlası",
		weight = 100,
		stack = true,
		close = true,
		description = "1KG Weed Brick to sell to large customers.",
		client = {
			image = "weed_brick.png",
		}
	},

	["diving_fill"] = {
		label = "Dalış Tüpü",
		weight = 3000,
		stack = false,
		close = true,
		client = {
			image = "diving_tube.png",
		}
	},

	["xtcbaggy"] = {
		label = "XTC Torbası",
		weight = 0,
		stack = true,
		close = true,
		description = "Pop those pills baby",
		client = {
			image = "xtc_baggy.png",
		}
	},

	["weed_amnesia_seed"] = {
		label = "Amnezi Tohumu",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Amnesia",
		client = {
			image = "weed_seed.png",
		}
	},

	["lawyerpass"] = {
		label = "Avukat Kartı",
		weight = 0,
		stack = false,
		close = false,
		description = "Pass exclusive to lawyers to show they can represent a suspect",
		client = {
			image = "lawyerpass.png",
		}
	},

	["microwave"] = {
		label = "Mikrodalga",
		weight = 46000,
		stack = false,
		close = true,
		description = "Microwave",
		client = {
			image = "placeholder.png",
		}
	},

	["joint"] = {
		label = "Joint",
		weight = 0,
		stack = true,
		close = true,
		description = "Sidney would be very proud at you",
		client = {
			image = "joint.png",
		}
	},

	["ironoxide"] = {
		label = "Demir Tozu",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with.",
		client = {
			image = "ironoxide.png",
		}
	},

	["harness"] = {
		label = "Yarış Koşum Takımı",
		weight = 100,
		stack = false,
		close = true,
		description = "Racing Harness so no matter what you stay in the car",
		client = {
			image = "harness.png",
		}
	},

	["printerdocument"] = {
		label = "Belge",
		weight = 500,
		stack = false,
		close = true,
		description = "A nice document",
		client = {
			image = "printerdocument.png",
		}
	},

	["police_stormram"] = {
		label = "Fırtına koçu",
		weight = 18000,
		stack = true,
		close = true,
		description = "A nice tool to break into doors",
		client = {
			image = "police_stormram.png",
		}
	},

	["snikkel_candy"] = {
		label = "Snickers",
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O",
		client = {
			image = "snikkel_candy.png",
		}
	},

	["driver_license"] = {
		label = "Ehliyet",
		weight = 0,
		stack = false,
		close = false,
		description = "Permit to show you can drive a vehicle",
		client = {
			image = "driver_license.png",
		}
	},

	["iron"] = {
		label = "Demir",
		weight = 100,
		stack = true,
		close = false,
		description = "Handy piece of metal that you can probably use for something",
		client = {
			image = "iron.png",
		}
	},

	["oxy"] = {
		label = "Reçeteli Oxy",
		weight = 0,
		stack = true,
		close = true,
		description = "The Label Has Been Ripped Off",
		client = {
			image = "oxy.png",
		}
	},

	["metalscrap"] = {
		label = "Metal Hurda",
		weight = 100,
		stack = true,
		close = false,
		description = "You can probably make something nice out of this",
		client = {
			image = "metalscrap.png",
		}
	},

	["weed_og-kush"] = {
		label = "OGKush 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g OG Kush",
		client = {
			image = "weed_baggy.png",
		}
	},

	["screwdriverset"] = {
		label = "Araç Kiti",
		weight = 100,
		stack = true,
		close = false,
		description = "Very useful to screw... screws...",
		client = {
			image = "screwdriverset.png",
		}
	},

	["firework4"] = {
		label = "Ağlayan Söğüt",
		weight = 100,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework4.png",
		}
	},

	["casinochips"] = {
		label = "Casino Çipi",
		weight = 0,
		stack = true,
		close = false,
		description = "Chips For Casino Gambling",
		client = {
			image = "casinochips.png",
		}
	},

	["empty_evidence_bag"] = {
		label = "Boş Kanıt Torbası",
		weight = 0,
		stack = true,
		close = false,
		description = "DNA'yı kandan, mermi kovanlarından ve daha fazlasından korumak için çok kullanıldı",
		client = {
			image = "evidence.png",
		}
	},

	["firstaid"] = {
		label = "İlk Yardım Kiti",
		weight = 2500,
		stack = true,
		close = true,
		description = "İnsanları yeniden ayağa kaldırmak için bu İlk Yardım çantasını kullanabilirsiniz",
		client = {
			image = "firstaid.png",
		}
	},

	["security_card_02"] = {
		label = "Güvenlik Kartı B",
		weight = 0,
		stack = true,
		close = true,
		description = "Bir güvenlik kartı... Acaba neye gidiyor?",
		client = {
			image = "security_card_02.png",
		}
	},

	["toaster"] = {
		label = "Tost Makinesi",
		weight = 18000,
		stack = false,
		close = true,
		description = "Toast",
		client = {
			image = "placeholder.png",
		}
	},

	["laptop"] = {
		label = "Laptop",
		weight = 4000,
		stack = true,
		close = true,
		description = "Pahalı dizüstü bilgisayar",
		client = {
			image = "laptop.png",
		}
	},

	["crack_baggy"] = {
		label = "Kokain Torbası",
		weight = 0,
		stack = true,
		close = true,
		description = "Daha hızlı mutlu olmak için",
		client = {
			image = "crack_baggy.png",
		}
	},

	["walkstick"] = {
		label = "Baston",
		weight = 100,
		stack = true,
		close = true,
		description = "Siz büyükanneler için baston orada.. HAHA",
		client = {
			image = "walkstick.png",
		}
	},

	["fitbit"] = {
		label = "Fitbit",
		weight = 500,
		stack = false,
		close = true,
		description = "fitbit'i severim",
		client = {
			image = "fitbit.png",
		}
	},

	["weed_purple-haze_seed"] = {
		label = "Mor Pus Tohumu",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Purple Haze",
		client = {
			image = "weed_seed.png",
		}
	},

	["coke_small_brick"] = {
		label = "Kola Paketi",
		weight = 350,
		stack = false,
		close = true,
		description = "Small package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_small_brick.png",
		}
	},

	["dendrogyra_coral"] = {
		label = "Dendrogyra",
		weight = 100,
		stack = true,
		close = true,
		description = "Its also known as pillar coral",
		client = {
			image = "dendrogyra_coral.png",
		}
	},

	["id_card"] = {
		label = "Kimlik Kartı",
		weight = 0,
		stack = false,
		close = false,
		description = "A card containing all your information to identify yourself",
		client = {
			image = "id_card.png",
		}
	},

	["weed"] = {
		label = "Esrar",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "weed_baggy.png",
		}
	},

	["goldbar"] = {
		label = "Altın Bar",
		weight = 7000,
		stack = true,
		close = true,
		description = "Looks pretty expensive to me",
		client = {
			image = "goldbar.png",
		}
	},
	["gold"] = {
		label = "Altın Bar",
		weight = 7000,
		stack = true,
		close = true,
		description = "Looks pretty expensive to me",
		client = {
			image = "goldbar.png",
		}
	},


	["pinger"] = {
		label = "Pinger",
		weight = 100,
		stack = true,
		close = true,
		description = "With a pinger and your phone you can send out your location",
		client = {
			image = "pinger.png",
		}
	},

	["acetone"] = {
		label = "Aseton",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "acetone.png",
		}
	},

	["lithium"] = {
		label = "Lityum",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "lithium.png",
		}
	},

	["methlab"] = {
		label = "Lab",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "methlab.png",
		}
	},
	["weed_skunk_seed"] = {
		label = "Kokarca Tohumu",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Skunk",
		client = {
			image = "weed_seed.png",
		}
	},

	["weed_nutrition"] = {
		label = "Bitki Gübresi",
		weight = 2000,
		stack = true,
		close = true,
		description = "Plant nutrition",
		client = {
			image = "weed_nutrition.png",
		}
	},

	["meth"] = {
		label = "Meth",
		weight = 100,
		stack = true,
		close = true,
		description = "A baggie of Meth",
		client = {
			image = "meth_baggy.png",
		}
	},

	["small_tv"] = {
		label = "Küçük TV",
		weight = 30000,
		stack = false,
		close = true,
		description = "TV",
		client = {
			image = "placeholder.png",
		}
	},

	["grape"] = {
		label = "Üzüm",
		weight = 100,
		stack = true,
		close = false,
		description = "Mmmmh yummie, üzüm",
		client = {
			image = "grape.png",
		}
	},

	["repairkit"] = {
		label = "Tamir Kiti",
		weight = 2500,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "repairkit.png",
		}
	},

	["certificate"] = {
		label = "Sertifika",
		weight = 0,
		stack = true,
		close = true,
		description = "Certificate that proves you own certain stuff",
		client = {
			image = "certificate.png",
		}
	},

	["glass"] = {
		label = "Cam",
		weight = 100,
		stack = true,
		close = false,
		description = "It is very fragile, watch out",
		client = {
			image = "glass.png",
		}
	},

	["firework2"] = {
		label = "Poppelers",
		weight = 100,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework2.png",
		}
	},

	["moneybag"] = {
		label = "Para Çantası",
		weight = 0,
		stack = false,
		close = true,
		description = "A bag with cash",
		client = {
			image = "moneybag.png",
		}
	},

	["iphone"] = {
		label = "iPhone",
		weight = 100,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "iphone.png",
		}
	},

	["steel"] = {
		label = "Çelik",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "steel.png",
		}
	},

	["twerks_candy"] = {
		label = "Twerks",
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O",
		client = {
			image = "twerks_candy.png",
		}
	},

	["antipatharia_coral"] = {
		label = "Anti patarya",
		weight = 100,
		stack = true,
		close = true,
		description = "Its also known as black corals or thorn corals",
		client = {
			image = "antipatharia_coral.png",
		}
	},

	["cleaningkit"] = {
		label = "Temizlik Kiti",
		weight = 250,
		stack = true,
		close = true,
		description = "A microfiber cloth with some soap will let your car sparkle again!",
		client = {
			image = "cleaningkit.png",
		}
	},

	["ifaks"] = {
		label = "faks",
		weight = 200,
		stack = true,
		close = true,
		description = "Seni güçlendirir fişek gibi olursun.",
		client = {
			image = "ifaks.png",
		}
	},

	["adrenalin"] = {
		label = "adrenalin",
		weight = 200,
		stack = true,
		close = true,
		description = "Seni güçlendirir fişek gibi olursun.",
		client = {
			image = "adrenalin.png",
		}
	},

	["azdiran"] = {
		label = "Mario",
		weight = 200,
		stack = true,
		close = true,
		description = "Seni güçlendirir fişek gibi olursun.",
		client = {
			image = "azdiran.png",
		}
	},

	["weed_amnesia"] = {
		label = "Amnezi 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Amnesia",
		client = {
			image = "weed_baggy.png",
		}
	},

	["thermite"] = {
		label = "Termit",
		weight = 100,
		stack = true,
		close = true,
		description = "Sometimes you'd wish for everything to burn",
		client = {
			image = "thermite.png",
		}
	},

	["labkey"] = {
		label = "Anahtar",
		weight = 500,
		stack = false,
		close = true,
		description = "Key for a lock...?",
		client = {
			image = "labkey.png",
		}
	},

	["advancedlockpick"] = {
		label = "Gelişmiş Maymuncuk",
		weight = 500,
		stack = true,
		close = true,
		description = "If you lose your keys a lot this is very useful... Also useful to open your beers",
		client = {
			image = "advancedlockpick.png",
		}
	},

	["advancedlockpick2"] = {
		label = "Ultra Maymuncuk",
		weight = 500,
		stack = true,
		close = true,
		description = "Kititli kapıları açar",
		client = {
			image = "advancedlockpick.png",
		}
	},

	['meatdeer'] = {
		label = 'Geyik Boynuzu',
		weight = 100,
		stack = true,
		close = false,
		description = "Deer Horns"
	},
				['meatrabbit'] = {
		label = 'Tavşan Kürkü',
		weight = 100,
		stack = true,
		close = false,
		description = "Rabbit Fur"
	},
				['meatcoyote'] = {
		label = 'Çakal Postu',
		weight = 100,
		stack = true,
		close = false,
		description = "Coyote Pelt"
	},
				['meatpig'] = {
		label = 'Domuz Eti',
		weight = 100,
		stack = true,
		close = false,
		description = "Pig Meat"
	},
				['meatbird'] = {
		label = 'Kuş Tüyü',
		weight = 100,
		stack = true,
		close = false,
		description = "Bird Feather"
	},
				['meatcow'] = {
		label = 'İnek Postu',
		weight = 100,
		stack = true,
		close = false,
		description = "Cow Pelt"
	},
				['meatlion'] = {
		label = 'Puma Pençesi',
		weight = 100,
		stack = true,
		close = false,
		description = "Cougar Claw"
	},
				['huntingbait'] = {
		label = 'Hayvan Yemi',
		weight = 150,
		stack = true,
		close = true,
		description = "Lezzetli bir havyan yemi"
	},
				['meatboar'] = {
		label = 'Yaban Domuzu Tuskları',
		weight = 100,
		stack = true,
		close = false,
		description = "Boar Tusks"
	},

	["grapejuice"] = {
		label = "Üzüm Suyu",
		weight = 200,
		stack = true,
		close = false,
		description = "Grape juice is said to be healthy",
		client = {
			image = "grapejuice.png",
		}
	},

	["tunerlaptop"] = {
		label = "Tuner çipi",
		weight = 2000,
		stack = false,
		close = true,
		description = "With this tunerchip you can get your car on steroids... If you know what you're doing",
		client = {
			image = "tunerchip.png",
		}
	},

	["badge"] = {
		label = "Rozet",
		weight = 2000,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "badge.png",
		}
	},

	["bodycam"] = {
		label = "Bodycam",
		weight = 2000,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "bodycam.png",
		}
	},

	["cokebaggy"] = {
		label = "Bir paket kola",
		weight = 0,
		stack = true,
		close = true,
		description = "To get happy real quick",
		client = {
			image = "cocaine_baggy.png",
		}
	},

	["sandwich"] = {
		label = "Sandviç",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["ecola"] = {
		label = "Kola",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cola.png",
		}
	},

	["sprunk"] = {
		label = "Sprunk",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "sprunk.png",
		}
	},

	["coffe"] = {
		label = "Kahve",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coffe.png",
		}
	},

	["tea"] = {
		label = "Çay",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tea.png",
		}
	},

	["dirtywater"] = {
		label = "Özel Su",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "dirtywater.png",
		}
	},

	["egochaser"] = {
		label = "Çikolata",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "egochaser.png",
		}
	},

	["uwububbleteablueberry"] = {
		label = "Dut Mavisi B-T",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["uwububbletearose"] = {
		label = "Gül B-T",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},
	["uwubentobox"] = {
		label = "Bento Kutu",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "uwubentobox.png",
		}
	},
	["manti"] = {
		label = "Mantı",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},	
	["pondburrito"] = {
		label = "Dürüm",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},	
	["pondcileklidondurma"] = {
		label = "Çilekli Dondurma",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},
		
	["pondhavuclukek"] = {
		label = "Havuçlu Kek",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},
	
	["pondlimonlutart"] = {
		label = "Limonlu Tart",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},
	
	["pondmidye"] = {
		label = "Midye",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["pondnugget"] = {
		label = "Nugget",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["pondpamuksefer"] = {
		label = "Pamuk Şeker",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["pondsandvic"] = {
		label = "Sandviç",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["pondtavuklusebzelimakarna"] = {
		label = "Tavuklu Sebzeli Makarna",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["pondtonbaliklisalata"] = {
		label = "Tonbalıklı Salata",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["ponndmakaron"] = {
		label = "Makarna",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["pondcileklilimonata"] = {
		label = "Çilekli Limonata",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	["pondhibiskuscayi"] = {
		label = "Hibisku Çayı",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["pondsogukcay"] = {
		label = "Soğuk Çay",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["pondturkkahvesi"] = {
		label = "Türk Kahvesi",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pondturkkahvesi.png",
		}
	},

	["pondyabanmersinisuyu"] = {
		label = "Yabanmersinni Suyu",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["cay"] = {
		label = "Türk Çayı",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["papatya_cay"] = {
		label = "Papatya Çayı",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["americano"] = {
		label = "Americano",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["bitki_cay"] = {
		label = "Bitki Çayı",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["psnqs"] = {
		label = "Jelibon",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["psnqs"] = {
		label = "Jelibon",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "psnqs.png",
		}
	},

	["orangotang"] = {
		label = "Portakallı Gazoz",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["tunasandwich"] = {
		label = "Etli Sandviç",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["hamsandwich"] = {
		label = "Ton Balıklı Sandviç",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["meteorite"] = {
		label = "Çikolata",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["bmochi"] = {
		label = "Mavi Mochi",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bmochi.png",
		}
	},

	["pmochi"] = {
		label = "Pembe Mochi",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pmochi.png",
		}
	},

	["gmochi"] = {
		label = "Yeşil Mochi",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "gmochi.png",
		}
	},

	["omochi"] = {
		label = "Turuncu Mochi",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "omochi.png",
		}
	},

	["bobatea"] = {
		label = "Boba Tea",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["bbobatea"] = {
		label = "Mavi Boba Tea",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["gbobatea"] = {
		label = "Yeşil Boba Tea",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["pbobatea"] = {
		label = "Pembe Boba Tea",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["obobatea"] = {
		label = "Turuncu Boba Tea",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["nekolatte"] = {
		label = "Neko Latte",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["catcoffee"] = {
		label = "Kedi Kahve",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "catcoffee.png",
		}
	},

	["sake"] = {
		label = "Sake",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "sake.png",
		}
	},

	["miso"] = {
		label = "Miso Çorbası",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "miso.png",
		}
	},

	["cake"] = {
		label = "Çilekli Kek",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cake.png",
		}
	},

	["bento"] = {
		label = "Bento Kutusu",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bento.png",
		}
	},

	["flour"] = {
		label = "Un",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "flour.png",
		}
	},

	["rice"] = {
		label = "Pirinç Kasesi",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "rice.png",
		}
	},

	
	["riceball"] = {
		label = "Onigiri",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "riceball.png",
		}
	},

	["nekocookie"] = {
		label = "Neko Kurabiye",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["nekodonut"] = {
		label = "Neko Donut",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["boba"] = {
		label = "Boba",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "boba.png",
		}
	},

	["onion"] = {
		label = "Soğan",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "onion.png",
		}
	},

	["milk"] = {
		label = "Süt",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "milk.png",
		}
	},

	["ramen"] = {
		label = "Ramen",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ramen.png",
		}
	},


	["noodles"] = {
		label = "Donmuş Erişte",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "noodles.png",
		}
	},

	["noodlebowl"] = {
		label = "Erişte",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "noodlebowl.png",
		}
	},

	["pancake"] = {
		label = "Pankek",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pancake.png",
		}
	},

	["tofu"] = {
		label = "Soya Peyniri",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tofu.png",
		}
	},

	["orange"] = {
		label = "Portakal",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "orange.png",
		}
	},

	["orangejustice"] = {
		label = "Portakal Suyu",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["strawberry"] = {
		label = "Çilek",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["nori"] = {
		label = "Nori",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "nori.png",
		}
	},

	["sugar"] = {
		label = "Şeker",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "sugar.png",
		}
	},

	["belinikokteyl"] = {
		label = "Belini Kokteyl",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["cintonik"] = {
		label = "Cin Tonik",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["cereztabagi"] = {
		label = "Çerez Tabağı",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cereztabagi.png",
		}
	},

	["citirtavuk"] = {
		label = "Çıtır Tavuk",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["dondurma"] = {
		label = "Dondurma",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["kahve"] = {
		label = "Brown Kapiçino",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["kebap"] = {
		label = "Kebap",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["lahmacun"] = {
		label = "Lahmacun",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["Meyvelikokteyl"] = {
		label = "Meyveli Kokteyl",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["margaritakokteyl"] = {
		label = "Margarita Kokteyl",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["martinikokteyl"] = {
		label = "Martini Kokteyl",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["muffin"] = {
		label = "Muffin",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "muffin.png",
		}
	},

	["salata"] = {
		label = "Salata",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["soda"] = {
		label = "Soda",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["sogukkahve"] = {
		label = "Soğuk Kahve",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["tiramisu"] = {
		label = "Tiramisu",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["loriturkkahve"] = {
		label = "Türk Kahvesi",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["yesilperi"] = {
		label = "Yeşil peri",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["mint"] = {
		label = "Matcha",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["mocha"] = {
		label = "Mocha",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["cakepop"] = {
		label = "Cat Kek-Pop",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cakepop.png",
		}
	},


	["pizza"] = {
		label = "Pizza",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},

	["purrito"] = {
		label = "Purrito",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { hunger = 350000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = ''
		},
	},


	["beer_am"] = {
		label = "Bira",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "beer_am.png",
		}
	},

	["weed_skunk"] = {
		label = "Skunk 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Skunk",
		client = {
			image = "weed_baggy.png",
		}
	},

	["coffee"] = {
		label = "Kahve",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = ''
		}
	},

	["wateringcan"] = {
		label = "Sulama Bidonu",
		weight = 100,
		stack = true,
		close = true,
		description = "",
	},
	["raker"] = {
		label = "Raker",
		weight = 100,
		stack = true,
		close = true,
		description = "",
	},
	["shovel"] = {
		label = "Kürek",
		weight = 100,
		stack = true,
		close = true,
		description = "",
	},
	["melonseed"] = {
		label = "Kavun Tohumu",
		weight = 100,
		stack = true,
		close = true,
		description = "",
	},
	["pumpkinseed"] = {
		label = "Balkabağı Çekirdeği",
		weight = 100,
		stack = true,
		close = true,
		description = "",
	},
	["wheatseed"] = {
		label = "Buğday Tohumu",
		weight = 100,
		stack = true,
		close = true,
		description = "",
	},
	["churn"] = {
		label = "Çalkalama",
		weight = 100,
		stack = true,
		close = true,
		description = "",
	},
	["milkbottle"] = {
		label = "Süt Şişesi",
		weight = 100,
		stack = true,
		close = true,
		description = "",
	},
	["melon"] = {
		label = "Kesilmiş Kavun",
		weight = 100,
		stack = true,
		close = true,
		description = "",
	},
	["pumpkin"] = {
		label = "Kesilmiş Balkabağı",
		weight = 100,
		stack = true,
		close = true,
		description = "",
	},
	["wheat"] = {
		label = "Buğday",
		weight = 100,
		stack = true,
		close = true,
		description = "",
	},

	["blueberry"] = {
		label = "Yaban Mersini",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 44,
			},
			image = "blueberry.png",
		}
	},
	['trowel'] = {
		label = 'Mala',
		description = "Perfect for your garden or for Coca plant",
		weight = 250,
		stack = true
	},

	['coke_leaf'] = {
		label = 'Kök Yaprak',
		description = "Leaf from amazing plant",
		weight = 15,
		stack = true
	},

	['coke_access'] = {
		label = 'Giriş kartı',
		description = "Access Card for Coke Lab",
		weight = 50,
		stack = true
	},

	['coke_box'] = {
		label = 'Kök Kutusu',
		description = "Be careful not to spill it on the ground",
		weight = 2000,
		stack = true
	},

	['coke_raw'] = {
		label = 'Ham Kok',
		description = "Coke with some dirty particles",
		weight = 50,
		stack = true
	},

	['coke_pure'] = {
		label = 'Saf Kok',
		description = "Coke without any dirty particles",
		weight = 70,
		stack = true,
		close = true
	},

	['coke_figure'] = {
		label = 'Aksiyon Figür',
		description = "Action Figure of the cartoon superhero Impotent Rage",
		weight = 150,
		stack = true
	},

	['coke_figureempty'] = {
		label = 'Aksiyon Figürü',
		description = "Action Figure of the cartoon superhero Impotent Rage",
		weight = 150,
		stack = true
	},

	['coke_figurebroken'] = {
		label = 'Aksiyon Figürü Parçaları',
		description = "You can throw this away or try to repair with glue",
		weight = 100,
		stack = true
	},


	['coke_figurebroken'] = {
		label = 'Aksiyon Figürü Parçaları',
		description = "You can throw this away or try to repair with glue",
		weight = 100,
		stack = true
	},
	

	['meth_amoniak'] = {
		label = 'Amonyak',
		description = "Warning! Dangerous Chemicals!",
		weight = 100,
		stack = true
	},

	['meth_pipe'] = {
		label = 'Meth Borusu',
		description = "Enjoy your new crystal clear stuff!",
		weight = 880,
		stack = true
	},

	['crack_pipe'] = {
		label = 'Çatlak Borusu',
		description = "Enjoy your Crack!",
		weight = 550,
		stack = true
	},

	['meth_syringe'] = {
		label = 'Meth Şırıngası',
		description = "Enjoy your new crystal clear stuff!",
		weight = 300,
		stack = true
	},

	['heroin_syringe'] = {
		label = 'Eroin Şırıngası',
		description = "Enjoy your new crystal clear stuff!",
		weight = 300,
		stack = true
	},

	['syringe'] = {
		label = 'Şırınga',
		description = "Enjoy your new crystal clear stuff!",
		weight = 300,
		stack = true
	},

	['meth_sacid'] = {
		label = 'Sodyum Benzoat Bidonu',
		description = "Warning! Dangerous Chemicals!",
		weight = 5000,
		stack = true
	},

	['meth_emptysacid'] = {
		label = 'Boş Kutu',
		description = "Material: Plastic, Good for Sodium Benzoate",
		weight = 2000,
		stack = true
	},

	['meth_access'] = {
		label = 'Giriş kartı',
		description = "Access Card for Meth Lab",
		weight = 100,
		stack = true,
		close = true
	},

	['meth_glass'] = {
		label = 'Meth içeren tepsi',
		description = "Needs to be smashed with hammer",
		weight = 100,
		stack = true
	},

	['meth_sharp'] = {
		label = 'Parçalanmış meth tepsisi',
		description = "Can be packed",
		weight = 100,
		stack = true
	},

	['meth_bag'] = {
		label = 'Meth torbası',
		description = "Plastic bag with magic stuff!",
		weight = 100,
		stack = true
	},

	['weed_package'] = {
		label = 'Ot Torbası',
		description = "Plastic bag with magic stuff!",
		weight = 500,
		stack = true
	},

	['weed_access'] = {
		label = 'Giriş kartı',
		description = "Access Card for Weed Lab",
		weight = 100,
		stack = true
	},

	['weed_bud'] = {
		label = 'Ot Tomurcuğu',
		description = "Needs to be clean at the table",
		weight = 40,
		stack = true
	},

	['weed_blunt'] = {
		label = 'Künt',
		description = "Enjoy your weed!",
		weight = 90,
		stack = true,
		close = true
	},

	['weed_wrap'] = {
		label = 'Künt sargısı',
		description = "Get Weed Bag and roll blunt!",
		weight = 75,
		stack = true,
		close = true
	},

	['weed_papers'] = {
		label = 'Ot kağıtları',
		description = "Get Weed Bag and roll joint!",
		weight = 15,
		stack = true,
		close = true
	},

	['weed_joint'] = {
		label = 'Joint',
		description = "Enjoy your weed!",
		weight = 50,
		stack = true,
		close = true
	},

	['weed_budclean'] = {
		label = 'Ot Tomurcuğu',
		description = "You can pack this at the table",
		weight = 35,
		stack = true
	},

	['plastic_bag'] = {
		label = 'Plastik poşet',
		description = "You can pack a lot of stuff here!",
		weight = 8,
		stack = true
	},

	['scissors'] = {
		label = 'Makas',
		description = "To help you with collecting",
		weight = 40,
		stack = true
	},

	['ecstasy1'] = {
		label = 'Ekstazi',
		description = "Explore a new universe!",
		weight = 10,
		stack = true,
		close = true
	},

	['ecstasy2'] = {
		label = 'Ekstazi',
		description = "Explore a new universe!",
		weight = 10,
		stack = true,
		close = true
	},

	['ecstasy3'] = {
		label = 'Ekstazi',
		description = "Explore a new universe!",
		weight = 10,
		stack = true,
		close = true
	},

	['ecstasy4'] = {
		label = 'Ekstaziy',
		description = "Explore a new universe!",
		weight = 10,
		stack = true,
		close = true
	},

	['ecstasy5'] = {
		label = 'Ekstazi',
		description = "Explore a new universe!",
		weight = 10,
		stack = true,
		close = true
	},

	['lsd1'] = {
		label = 'LSD',
		description = "Explore a new universe!",
		weight = 10,
		stack = true,
		close = true
	},

	['lsd2'] = {
		label = 'LSD',
		description = "Explore a new universe!",
		weight = 10,
		stack = true,
		close = true
	},

	['lsd3'] = {
		label = 'LSD',
		description = "Explore a new universe!",
		weight = 10,
		stack = true,
		close = true
	},

	['lsd4'] = {
		label = 'LSD',
		description = "Explore a new universe!",
		weight = 10,
		stack = true,
		close = true
	},

	['lsd5'] = {
		label = 'LSD',
		description = "Explore a new universe!",
		weight = 10,
		stack = true,
		close = true
	},

	['magicmushroom'] = {
		label = 'Mantar',
		description = "Explore a new universe!",
		weight = 30,
		stack = true,
		close = true
	},

	['peyote'] = {
		label = 'Peyote',
		description = "Explore a new universe!",
		weight = 30,
		stack = true,
		close = true
	},

	['xanaxpack'] = {
		label = 'Xanax Paketi',
		description = "Needs to be open",
		weight = 130,
		stack = true,
		close = true
	},

	['xanaxplate'] = {
		label = 'Xanax tabağı',
		description = "Needs to be open",
		weight = 30,
		stack = true,
		close = true
	},

	['xanaxpill'] = {
		label = 'Xanax hapı',
		description = "Explore a new universe!",
		weight = 2,
		stack = true,
		close = true
	},

    ['glue'] = {
		label = 'Yapıştırıcı',
		description = "Good for repairing things!",
		weight = 30,
		stack = true
	},

    ['hammer'] = {
		label = 'Çekiç',
		description = "Good for smashing things!",
		weight = 500,
		stack = true
	},

	['poppyplant'] = {
		label = 'Haşhaş Bitkisi',
		description = "Very nice plant!",
		weight = 30,
		stack = true
	},
	
	['heroin'] = {
		label = 'Eroin',
		description = "Explore a new universe!",
		weight = 30,
		stack = true
	},
	['crack'] = {
		label = 'Çatlak',
		description = "Explore a new universe!",
		weight = 30,
		stack = true
	},
	['baking_soda'] = {
		label = 'Karbonat',
		description = "Baking Bad!",
		weight = 30,
		stack = true
	},
	-- ak47 druglabs ################################
	['weed_pooch'] = {
		label = 'Ot Pooch',
		description = "",
		weight = 30,
		stack = true
	},
	['coke_pooch'] = {
		label = 'Kök Pooch',
		description = "",
		weight = 30,
		stack = true
	},
	['spice_pooch'] = {
		label = 'Baharat Pooch',
		description = "",
		weight = 30,
		stack = true
	},
	['empty_cup'] = {
		label = 'Yağsız Kupa',
		description = "",
		weight = 30,
		stack = true
	},
	['lean_bottle'] = {
		label = 'Yağsız Şişe',
		description = "",
		weight = 30,
		stack = true
	},
	['double_cup'] = {
		label = 'Çift kupa',
		description = "",
		weight = 30,
		stack = true
	},
	['xpills'] = {
		label = 'X Hapları',
		description = "",
		weight = 30,
		stack = true
	},
	['heroin_shot'] = {
		label = 'Eroin Atış',
		description = "",
		weight = 30,
		stack = true
	},
	['meth_pooch'] = {
		label = 'Meth Pooch',
		description = "",
		weight = 30,
		stack = true
	},
	['weed_leaf'] = {
		label = 'Ot Yaprağı',
		description = "",
		weight = 30,
		stack = true
	},
	['pooch_bag'] = {
		label = 'Pooch Çanta',
		description = "",
		weight = 30,
		stack = true
	},
	['cokebrick'] = {
		label = 'Kök Tuğlası',
		description = "",
		weight = 30,
		stack = true
	},
	['spice_leaf'] = {
		label = 'Baharat Yaprağı',
		description = "",
		weight = 30,
		stack = true
	},
	['empty_lean_bottle'] = {
		label = 'Boş Yağsız Şişe',
		description = "",
		weight = 30,
		stack = true
	},
	['raw_lean'] = {
		label = 'Yağsız malzeme',
		description = "",
		weight = 30,
		stack = true
	},
	['chemicals'] = {
		label = 'Kimyasallar',
		description = "",
		weight = 30,
		stack = true
	},
	['meth_raw'] = {
		label = 'Çiğ Meth',
		description = "",
		weight = 30,
		stack = true
	},


	---- mWeed ----

	["indica_seed"] = {
		label = "Indica Tohumu",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "indica_seed.png",
		}
	},
	
		["sativa_seed"] = {
		label = "Sativa Tohumu",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sativa_seed.png",
		}
	},
	
	["indica_weed"] = {
		label = "Indica Otu",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "indica_weed.png",
		}
	},
	
	["fertilizer"] = {
		label = "Gübre",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "fertilizer.png",
		}
	},
	
	["quality_fertilizer"] = {
		label = "Kaliteli Gübre",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "quality_fertilizer",
		}
	},
	
	["grubber"] = {
		label = "Çapa",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "grubber.png",
		}
	},
	
	["raw_paper"] = {
		label = "Ham Kağıt",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "raw_paper.png",
		}
	},
	
	["spray"] = {
		label = "Sprey",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "spray.png",
		}
	},
	
	["grinder"] = {
		label = "Öğütücü",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "Grinder.png",
		}
	},
	
	
	["indica_joint"] = {
		label = "Indica Sigara",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "indica_joint.png",
		}
	},
	
	["sativa_joint"] = {
		label = "Sativa Sigara",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sativa_joint.png",
		}
	},
	
	["lemon_haze_joint"] = {
		label = "Limon Haze Sigara",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "lemon_haze_joint.png",
		}
	},
	
	["purple_haze_joint"] = {
		label = "Mor Haze Sigara",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "purple_haze_joint.png",
		}
	},
	
	["grinded_indica"] = {
		label = "Öğütülmüş Indica",  
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "grinded_indica.png",
		}
	},
	
	["grinded_sativa"] = {
		label = "Öğütülmüş Sativa",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "grinded_sativa.png",
		}
	},
	


	--- HUNTİNG ---
	["pigeonmeat"] = {
        label = "Güvercin Eti",
        weight = 100,
        stack = true,
        close = true,
        description = "Delicious pigeon meat for your culinary adventures.",
    },
    ["pigeonfeather"] = {
        label = "Güvercin Tüyü",
        weight = 100,
        stack = true,
        close = true,
        description = "A soft and lightweight feather from a pigeon.",
    },
    ["crowmeat"] = {
        label = "Karga Eti",
        weight = 100,
        stack = true,
        close = true,
        description = "Tasty crow meat, perfect for daring gourmets.",
    },
    ["crowfeather"] = {
        label = "Karga Tüyü",
        weight = 100,
        stack = true,
        close = true,
        description = "A sleek and dark feather from a crow.",
    },
    ["seagullmeat"] = {
        label = "Martı Eti",
        weight = 100,
        stack = true,
        close = true,
        description = "Savory seagull meat, a delicacy among fishermen.",
    },
    ["seagullfeather"] = {
        label = "Martı Tüyü",
        weight = 100,
        stack = true,
        close = true,
        description = "A graceful and light feather from a seagull.",
    },
    ["cormorantmeat"] = {
        label = "Karabatak Eti",
        weight = 100,
        stack = true,
        close = true,
        description = "Meaty cormorant meat, a rare find for adventurous eaters.",
    },
    ["cormorantbeak"] = {
        label = "Karabatak Gagası",
        weight = 100,
        stack = true,
        close = true,
        description = "A sturdy and pointed beak from a cormorant.",
    },
    ["deermeat"] = {
        label = "Geyik Eti",
        weight = 100,
        stack = true,
        close = true,
        description = "Succulent deer meat, a favorite among hunters.",
    },
    ["deerhorn"] = {
        label = "Geyik Boynuzu",
        weight = 100,
        stack = true,
        close = true,
        description = "A majestic horn from a deer, prized for its beauty.",
    },
    ["rabbitmeat"] = {
        label = "Tavşan Eti",
        weight = 100,
        stack = true,
        close = true,
        description = "Tender rabbit meat, perfect for stews and roasts.",
    },
    ["rabbitskin"] = {
        label = "Tavşan Derisi",
        weight = 100,
        stack = true,
        close = true,
        description = "A soft and supple skin from a rabbit, ideal for crafting.",
    },
    ["ratmeat"] = {
        label = "Fare Eti",
        weight = 100,
        stack = true,
        close = true,
        description = "Edible rat meat, a survivalist's choice in desperate times.",
    },
    ["pigmeat"] = {
        label = "Domuz Eti",
        weight = 100,
        stack = true,
        close = true,
        description = "Juicy pig meat, a staple in many hearty meals.",
    },
    ["pigskin"] = {
        label = "Domuz Derisi",
        weight = 100,
        stack = true,
        close = true,
        description = "Thick and durable pig skin, useful for crafting leather goods.",
    },
    ["coyotemeat"] = {
        label = "Çakal Eti",
        weight = 100,
        stack = true,
        close = true,
        description = "Lean and gamey coyote meat, favored by wilderness enthusiasts.",
    },
    ["coyoteskin"] = {
        label = "Çakal Derisi",
        weight = 100,
        stack = true,
        close = true,
        description = "Tough and weather-resistant coyote skin, perfect for outdoor gear.",
    },
    ["coguarmeat"] = {
        label = "Puma eti",
        weight = 100,
        stack = true,
        close = true,
        description = "Exotic cougarmeat, a delicacy for adventurous palates.",
    },
    ["coguarskin"] = {
        label = "Puma Derisi",
        weight = 100,
        stack = true,
        close = true,
        description = "Supple cougar skin, highly valued in the fashion industry.",
    },
    ["boarmeat"] = {
        label = "Yaban Domuzu Eti",
        weight = 100,
        stack = true,
        close = true,
        description = "Hearty boar meat, a popular choice among hunters and chefs.",
    },
    ["boarskin"] = {
        label = "Yaban Domuzu Derisi",
        weight = 100,
        stack = true,
        close = true,
        description = "Tough boar skin, excellent for crafting rugged goods.",
    },
    ["snakemeat"] = {
        label = "Yılan Eti",
        weight = 100,
        stack = true,
        close = true,
        description = "Savory snake meat, a delicacy in some cultures.",
    },
    ["boarhorn"] = {
        label = "Yaban Domuzu Boynuzu",
        weight = 100,
        stack = true,
        close = true,
        description = "A large and impressive horn from a boar.",
    },
    ["snakeskin"] = {
        label = "Yılan Derisi",
        weight = 100,
        stack = true,
        close = true,
        description = "Smooth and patterned snake skin, used for various crafts.",
    },
    ["hawkmeat"] = {
        label = "Şahin Eti",
        weight = 100,
        stack = true,
        close = true,
        description = "Lean and gamey hawk meat, a rare delicacy among hunters.",
    },
    ["hawkskin"] = {
        label = "Şahin Derisi",
        weight = 100,
        stack = true,
        close = true,
        description = "Beautiful hawk skin, prized for its unique markings.",
    },
    ["hawkpeak"] = {
        label = "Şahin Tepesi",
        weight = 100,
        stack = true,
        close = true,
        description = "A majestic feather from a hawk's peak, a symbol of freedom.",
    },

	["trokanya"] = {
		label = "Trokanya",
		weight = 50,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "trokanya.png",
		}
	},

	["fishingrod"] = {
		label = "Olta",
		weight = 50,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "fishingrod1.png",
		}
	},

--- İLLEGAL
	["weed-bad-ql"] = {
		label = "Ot Yaprağı",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "weed-bad-ql.png",
		}
	},
	["weed-med-ql"] = {
		label = "Ot Yaprağı",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "weed-med-ql.png",
		}
	},
	["weed-max-ql"] = {
		label = "Ot Yaprağı",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "weed-max-ql.png",
		}
	},
    ["leaves-weed-bad-ql"] = {
        label = "İşlenmiş Ot",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "leaves-weed-bad-ql.png",
        }
    },

    
    ["leaves-weed-med-ql"] = {
        label = "İşlenmiş Ot",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "leaves-weed-med-ql.png",
        }
    },

    ["leaves-weed-max-ql"] = {
        label = "İşlenmiş Ot",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "leaves-weed-max-ql.png",
        }
    },

    ["package-weed-bad-ql"] = {
        label = "Paketlenmiş Ot",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "package-weed-bad-ql.png",
        }
    },

    ["package-weed-med-ql"] = {
        label = "Paketlenmiş Ot",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "package-weed-med-ql.png",
        }
    },

    
    ["package-weed-max-ql"] = {
        label = "Paketlenmiş Ot",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "package-weed-max-ql.png",
        }
    },

    ["coke-bad-ql"] = {
        label = "Kokain Tozu",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "coke-bad-ql.png",
        }
    },

    ["coke-med-ql"] = {
        label = "Kokain Tozu",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "coke-med-ql.png",
        }
    },  

    ["coke-max-ql"] = {
        label = "Kokain Tozu",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "coke-max-ql.png",
        }
    },  

    ["leaves-coke-bad-ql"] = {
        label = "Şeker Tozu",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "leaves-coke-bad-ql.png",
        }
    },  

    ["leaves-coke-med-ql"] = {
        label = "Şeker Tozu",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "leaves-coke-med-ql.png",
        }
    },  

    ["leaves-coke-max-ql"] = {
        label = "Şeker Tozu",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "leaves-coke-max-ql.png",
        }
    }, 

    ["package-coke-bad-ql"] = {
        label = "Şeker",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "package-coke-bad-ql.png",
        }
    }, 

    ["package-coke-med-ql"] = {
        label = "Şeker",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "package-coke-med-ql.png",
        }
    }, 

    ["package-coke-max-ql"] = {
        label = "Şeker",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "package-coke-max-ql.png",
        }
    }, 

    ["meth-bad-ql"] = {
        label = "Meth Tozu",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "meth-bad-ql.png",
        }
    }, 

    ["meth-med-ql"] = {
        label = "Meth Tozu",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "meth-med-ql.png",
        }
    }, 

    ["meth-max-ql"] = {
        label = "Meth Tozu",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "meth-max-ql.png",
        }
    }, 

    ["leaves-meth-bad-ql"] = {
        label = "İşlenmiş Meth",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "leaves-meth-bad-ql.png",
        }
    }, 

    ["leaves-meth-med-ql"] = {
        label = "İşlenmiş Meth",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "leaves-meth-med-ql.png",
        }
    }, 
    ["leaves-meth-max-ql"] = {
        label = "İşlenmiş Meth",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "leaves-meth-max-ql.png",
        }
    }, 
    ["package-meth-bad-ql"] = {
        label = "Paketlenmiş Meth",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "package-meth-bad-ql.png",
        }
    }, 

    ["package-meth-med-ql"] = {
        label = "Paketlenmiş Meth",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "package-meth-med-ql.png",
        }
    }, 

    ["package-meth-max-ql"] = {
        label = "Paketlenmiş Meth",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "package-meth-max-ql.png",
        }
    }, 

    ["opium-bad-ql"] = {
        label = "Afyon Yaprağı",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "opium-bad-ql.png",
        }
    }, 
    ["opium-med-ql"] = {
        label = "Afyon Yaprağı",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "opium-med-ql.png",
        }
    }, 
    ["opium-max-ql"] = {
        label = "Afyon Yaprağı",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "opium-max-ql.png",
        }
    }, 
    ["leaves-opium-bad-ql"] = {
        label = "Kubar Tozu",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "leaves-opium-bad-ql.png",
        }
    }, 
    ["leaves-opium-med-ql"] = {
        label = "Kubar Tozu",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "leaves-opium-med-ql.png",
        }
    
    }, 
    ["leaves-opium-max-ql"] = {
        label = "Kubar Tozu",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "leaves-opium-max-ql.png",
        }
    }, 


    ["package-opium-bad-ql"] = {
        label = "Paketlenmiş Kubar",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "package-opium-bad-ql.png",
        }
    }, 

    ["package-opium-med-ql"] = {
        label = "Paketlenmiş Kubar",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "package-opium-med-ql.png",
        }
    }, 
    ["package-opium-max-ql"] = {
        label = "Paketlenmiş Kubar",
        weight = 100,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "package-opium-max-ql.png",
        }
    }, 
	

	["sativa_weed"] = {
		label = "Sativa Weed",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "sativa_weed.png",
		}
	},

	---- QBX SMALLRESOURCES
	["apple"] = {
		label = "Elma",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "apple.png",
		}
	},	
	["apple_juice"] = {
		label = "Elma Suyu",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "apple_juice.png",
		}
	},	
	["emptycowbucket"] = {
		label = "Boş Kova",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "emptycowbucket.png",
		}
	},	
	["milkbucket"] = {
		label = "Süt Kovası",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "milkbucket.png",
		}
	},	
	["raw_beef"] = {
		label = "Çiğ Biftek",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_beef.png",
		}
	},	
	["beef"] = {
		label = "Biftek",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "beef.png",
		}
	},	
	["milk"] = {
		label = "Süt",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "milk.png",
		}
	},	
	["rawpumpkin"] = {
		label = "Ham Kabak",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "rawpumpkin.png",
		}
	},	
	["pumpkinpiebox"] = {
		label = "Pasta Kutusu",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pumpkinpiebox.png",
		}
	},	
	["slicedpie"] = {
		label = "Dilim Pasta",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "slicedpie.png",
		}
	},	
	["corncob"] = {
		label = "Mısır Koçanı",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "corncob.png",
		}
	},	
	["canofcorn"] = {
		label = "Mısır Konservesi",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "canofcorn.png",
		}
	},	
	["grapes"] = {
		label = "Üzüm",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "grapes.png",
		}
	},	
	["grapejuice"] = {
		label = "Üzüm Suyu",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "grapejuice.png",
		}
	},	
	["greenpepper"] = {
		label = "Yeşil Biber",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "greenpepper.png",
		}
	},	
	["chillypepper"] = {
		label = "Acı Biber",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chillypepper.png",
		}
	},	
	["hotsauce"] = {
		label = "Acı Sos",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "hotsauce.png",
		}
	},	
	["tomato"] = {
		label = "Domates",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tomato.png",
		}
	},	
	["tomatopaste"] = {
		label = "Domates Ezmesi",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tomatopaste.png",
		}
	},	
	["soybeans"] = {
		label = "Soya Fasulyesi",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "soybeans.png",
		}
	},	
	["raw_bacon"] = {
		label = "Çiğ Pastırma",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_bacon.png",
		}
	},	
	["raw_sausage"] = {
		label = "Çiğ Sosis",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_sausage.png",
		}
	},	
	["raw_pork"] = {
		label = "Çiğ Domuz",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_pork.png",
		}
	},	
	["raw_ham"] = {
		label = "Çiğ Jambon",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_ham.png",
		}
	},	
	["cooked_bacon"] = {
		label = "Pişmiş Domuz Pastırması",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cooked_bacon.png",
		}
	},	
	["cooked_sausage"] = {
		label = "Pişmiş Sosis",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cooked_sausage.png",
		}
	},	
	["cooked_pork"] = {
		label = "Pişmiş Domuz Eti",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cooked_pork.png",
		}
	},	
	["cooked_ham"] = {
		label = "Pişmiş Jambon",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cooked_ham.png",
		}
	},	
	["pig_leather"] = {
		label = "Domuz Derisi",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pig_leather.png",
		}
	},	
	["cow_leather"] = {
		label = "İnek Derisi",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cow_leather.png",
		}
	},	

	["tracker"] = {
		label = "Tracker",
		weight = 700,
		stack = false,
		close = true,
		description = "this laptop need vpn to make it work",
		client = {
			image = "tracker.png",
		}
	},

	["white_phone"] = {
		label = "Beyaz İphone",
		weight = 700,
		stack = true,
		close = true,
		description = "Telefon",
		client = {
			image = "white_phone.png",
		}
	},

	["pink_phone"] = {
		label = "Pembe İphone",
		weight = 700,
		stack = true,
		close = true,
		description = "Telefon",
		client = {
			image = "pink_phone.png",
		}
	},

	["codfish"] = {
		label = "Morina",
		weight = 1000,
		stack = true,
		close = false,
		description = "Cod",
		client = {
			image = "codfish.png",
		}
	},

	["foil_poker"] = {
		label = "Folyo Poker",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "foil_poker.png",
		}
	},

	["marijuana_rollingpapers"] = {
		label = "Sarma Kağıtları",
		weight = 0,
		stack = true,
		close = true,
		description = "These aint Raw Rolling Papers!!?",
		client = {
			image = "marijuana_rollingpapers.png",
		}
	},

	["tesoura"] = {
		label = "Makas",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tesoura.png",
		}
	},

	["cuff"] = {
		label = "New Kelepçe",
		weight = 0,
		stack = true,
		close = true,
		description = "Su Tabancası",
		client = {
			image = "handcuffs.png",
		}
	},

	["triplehooksbait"] = {
		label = "triplehooksbait",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "triplehooksbait.png",
		}
	},

	["sharkhammer"] = {
		label = "Köpek Balığı",
		weight = 3000,
		stack = true,
		close = false,
		description = "Hammerhead Shark",
		client = {
			image = "sharkhammer.png",
		}
	},

	["strippedbass"] = {
		label = "strippedbass",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "strippedbass.png",
		}
	},

	["keepcompanionpug"] = {
		label = "Pug",
		weight = 500,
		stack = false,
		close = true,
		description = "Pug is your royal companion!",
		client = {
			image = "A_C_Pug.png",
		}
	},

	["kemertokasi"] = {
		label = "Kemer Tokası",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "kemertokasi.png",
		}
	},

	["marijuana_3.5_low"] = {
		label = "3.5gr Esrar",
		weight = 2800,
		stack = false,
		close = true,
		description = "3.5g low grade marijuana",
		client = {
			image = "marijuana_3.5_low.png",
		}
	},

	["wet_pink_phone"] = {
		label = "Wet Pink Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Telefon",
		client = {
			image = "wet_pink_phone.png",
		}
	},

	["hatchet10"] = {
		label = "Balta 10 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["pet_food"] = {
		label = "Evcil Hayvan maması",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pet_food.png",
		}
	},

	["wheeltokensadsa"] = {
		label = "Kumar Jetonu",
		weight = 0,
		stack = true,
		close = false,
		description = "Çarkı felek jetonu",
		client = {
			image = "casinochips.png",
		}
	},

	["al_fakher"] = {
		label = "Al Fakher İki Elma",
		weight = 250,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "al_fakher.png",
		}
	},

	["2005_blueberry"] = {
		label = "2005 Yabanmersinli Tanca",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "2005_blueberry.png",
		}
	},

	["finewood"] = {
		label = "finewood",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "finewood.png",
		}
	},

	["carpart_door"] = {
		label = "Araç Kapısı",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "carpart_door.png",
		}
	},

	
	["carpart_hood"] = {
		label = "Araç Kaputu",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "carpart_hood.png",
		}
	},

	["carpart_wheel"] = {
		label = "Araç Tekerleği",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "carpart_wheel.png",
		}
	},





	["hot_coals"] = {
		label = "Sıcak kömürler",
		weight = 300,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "hot_coals.png",
		}
	},

	["dagger15"] = {
		label = "Dagger 15 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["marijuana_crop_mid"] = {
		label = "Stunk",
		weight = 5500,
		stack = true,
		close = false,
		description = "mid grade harvested marijuana crop",
		client = {
			image = "marijuana_crop_mid.png",
		}
	},

	["mermi60"] = {
		label = "İllegal Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["kaydirak"] = {
		label = "Silah Sürgüsü",
		weight = 0,
		stack = true,
		close = true,
		description = "Silah üretiminde kullanılır.",
		client = {
			image = "kaydirak.png",
		}
	},

	["keepcompanionrottweiler"] = {
		label = "Rottweiler",
		weight = 500,
		stack = false,
		close = true,
		description = "Rottweiler is your royal companion!",
		client = {
			image = "A_Rottweiler.png",
		}
	},

	["killerwhale"] = {
		label = "Katil balina",
		weight = 3000,
		stack = true,
		close = false,
		description = "Killer Whale",
		client = {
			image = "killerwhale.png",
		}
	},

	["mining_pickaxe"] = {
		label = "Kazma",
		weight = 500,
		stack = false,
		close = true,
		description = "Classic's pickaxe for mining",
		client = {
			image = "mining_pickaxe.png",
		}
	},

	["mofo_fantasia"] = {
		label = "Adios Muo Fantezi",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "mofo_fantasia.png",
		}
	},

	["sarjor"] = {
		label = "Silah Şarjörü",
		weight = 0,
		stack = true,
		close = true,
		description = "Silah üretiminde kullanılır.",
		client = {
			image = "sarjor.png",
		}
	},

	["slimmaterialrod"] = {
		label = "slimmaterialrod",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "slimmaterialrod.png",
		}
	},

	["fishicebox"] = {
		label = "Balık Kutusu",
		weight = 2500,
		stack = false,
		close = true,
		description = "Ice Box to store all of your fish",
		client = {
			image = "fishicebox.png",
		}
	},

	["fishingboot"] = {
		label = "Eskimiş Bot",
		weight = 2500,
		stack = true,
		close = false,
		description = "Fishing Boot",
		client = {
			image = "fishingboot.png",
		}
	},

	["blue_mist"] = {
		label = "Starbuzz Mavi Sis",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "blue_mist.png",
		}
	},

	["sacos"] = {
		label = "Kötü Torba",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "sacos.png",
		}
	},

	["mining_stone"] = {
		label = "Maden Taşı",
		weight = 500,
		stack = true,
		close = true,
		description = "Mined Stone",
		client = {
			image = "mining_stone.png",
		}
	},

	["wrench15"] = {
		label = "İngiliz Anahtarı 15 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["red_phone"] = {
		label = "Kırmızı İphone",
		weight = 700,
		stack = true,
		close = true,
		description = "Telefon",
		client = {
			image = "red_phone.png",
		}
	},

	["sweetfish"] = {
		label = "sweetfish",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "sweetfish.png",
		}
	},

	["mining_ironfragment"] = {
		label = "Demir Parçası",
		weight = 500,
		stack = true,
		close = true,
		description = "Iron fragment from mining",
		client = {
			image = "mining_ironfragment.png",
		}
	},

	["marijuana_seeds"] = {
		label = "Tohum",
		weight = 500,
		stack = true,
		close = true,
		description = "marijuana seeds",
		client = {
			image = "marijuana_seeds.png",
		}
	},

	["wet_greenlight_phone"] = {
		label = "Wet Green Light Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Telefon",
		client = {
			image = "wet_greenlight_phone.png",
		}
	},

	["gasmask"] = {
		label = "Gaz Maskesi",
		weight = 0,
		stack = true,
		close = true,
		description = "Su Tabancası",
		client = {
			image = "gasmask.png",
		}
	},

	["snowball"] = {
		label = "Kar Topu",
		weight = 0,
		stack = true,
		close = true,
		description = "Neden isabet etmiyor :D",
		client = {
			image = "snowball.png",
		}
	},

	["marijuana_trowel"] = {
		label = "Mala",
		weight = 0,
		stack = true,
		close = true,
		description = "Small handheld garden shovel",
		client = {
			image = "marijuana_trowel.png",
		}
	},

	["etk10"] = {
		label = "Etkinlik 10 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["machete20"] = {
		label = "Machete 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["pixellaptop"] = {
		label = "Pixel Leptop",
		weight = 2000,
		stack = false,
		close = true,
		description = "Boosting Laptop",
		client = {
			image = "tunerchip.png",
		}
	},

	["tench"] = {
		label = "tench",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "tench.png",
		}
	},

	["poolcue15"] = {
		label = "Istıka Sopa 15 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["smallmouthbass"] = {
		label = "smallmouthbass",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "smallmouthbass.png",
		}
	},

	["electrocuff"] = {
		label = "Elektronik Kelepçe",
		weight = 0,
		stack = true,
		close = true,
		description = "Su Tabancası",
		client = {
			image = "handcuffs.png",
		}
	},

	["phone_hack"] = {
		label = "Phone Hack",
		weight = 300,
		stack = false,
		close = true,
		description = "With this chip, you can access hidden areas of Discord.",
		client = {
			image = "phone_hack.png",
		}
	},

	["wet_blue_phone"] = {
		label = "Wet Blue Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = {
			image = "wet_blue_phone.png",
		}
	},

	["americanshad"] = {
		label = "americanshad",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "americanshad.png",
		}
	},

	["etk20"] = {
		label = "Etkinlik 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["double_apple"] = {
		label = "Nakhla Çifte Elma",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "double_apple.png",
		}
	},

	["drone_flyer_7"] = {
		label = "Drone 6",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "drone_flyer_7.png",
		}
	},

	["dagger20"] = {
		label = "Dagger 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["whitebass"] = {
		label = "whitebass",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "whitebass.png",
		}
	},

	["blue_phone"] = {
		label = "Mavi İphone",
		weight = 700,
		stack = true,
		close = true,
		description = "Telefon",
		client = {
			image = "blue_phone.png",
		}
	},

	["stone_hatchet10"] = {
		label = "İllegal Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["blackcrappie"] = {
		label = "blackcrappie",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "blackcrappie.png",
		}
	},

	["limon"] = {
		label = "Çamurlu Limon",
		weight = 2,
		stack = true,
		close = true,
		description = "bunu yıkamam gerek....",
		client = {
			image = "limon.png",
		}
	},

	["evagold"] = {
		label = "Eva Gold Jeton",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "evagold.png",
		}
	},

	["drone_flyer_2"] = {
		label = "Drone 2",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "drone_flyer_2.png",
		}
	},

	["wet_classic_phone"] = {
		label = "Wet Classic Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = {
			image = "wet_classic_phone.png",
		}
	},

	["crowbar10"] = {
		label = "Levye 10 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["yogamat"] = {
		label = "Yoga Mat",
		weight = 500,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "yogamat.png",
		}
	},

	["wet_red_phone"] = {
		label = "Wet Red Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = {
			image = "wet_red_phone.png",
		}
	},

	["chub"] = {
		label = "chub",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "chub.png",
		}
	},

	["zomo_lemon"] = {
		label = "Orta Limon Suyu",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "zomo_lemon.png",
		}
	},

	["wrench20"] = {
		label = "İngiliz Anahtarı 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["keepcompanioncoyote"] = {
		label = "Coyote",
		weight = 500,
		stack = false,
		close = true,
		description = "Coyote is your royal companion!",
		client = {
			image = "A_C_Coyote.png",
		}
	},

	["marijuana_phone"] = {
		label = "Yazıcı Telefonu",
		weight = 0,
		stack = true,
		close = true,
		description = "Burner phone used to sell eights",
		client = {
			image = "marijuana_phone.png",
		}
	},

	["zomo_cream"] = {
		label = "Acai Kremalı Zomo",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "zomo_cream.png",
		}
	},

	["paten"] = {
		label = "Paten",
		weight = 0,
		stack = true,
		close = false,
		description = "Beton, parke veya asfalt gibi zeminlerde kaymak için kullanılan 2 tekerli gereç",
		client = {
			image = "paten.png",
		}
	},

	["spoonlurebait"] = {
		label = "spoonlurebait",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "spoonlurebait.png",
		}
	},

	["doping"] = {
		label = "Doping",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "doping.png",
		}
	},

	["keepcompanionwesty"] = {
		label = "Westy",
		weight = 500,
		stack = false,
		close = true,
		description = "Westy is your royal companion!",
		client = {
			image = "A_C_Westy.png",
		}
	},

	["mining_copperfragment"] = {
		label = "Bakır Parçası",
		weight = 500,
		stack = true,
		close = true,
		description = "Copper fragment from mining",
		client = {
			image = "mining_copperfragment.png",
		}
	},

	["stingray"] = {
		label = "Vatoz",
		weight = 1000,
		stack = true,
		close = false,
		description = "Stingray",
		client = {
			image = "stingray.png",
		}
	},

	["marijuana_3.5_mid"] = {
		label = "3.5 gr esrar",
		weight = 2800,
		stack = false,
		close = true,
		description = "3.5g mid grade marijuana",
		client = {
			image = "marijuana_3.5_mid.png",
		}
	},

	["yikanmislimon"] = {
		label = "Limon",
		weight = 1,
		stack = true,
		close = true,
		description = "bunu hazırlamam gerek....",
		client = {
			image = "yikanmislimon.png",
		}
	},

	["alabamasturgeon"] = {
		label = "alabamasturgeon",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "alabamasturgeon.png",
		}
	},

	["lakesturgeon"] = {
		label = "lakesturgeon",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "lakesturgeon.png",
		}
	},

	["rope"] = {
		label = "İp",
		weight = 0,
		stack = true,
		close = true,
		description = "Su Tabancası",
		client = {
			image = "rope.png",
		}
	},

	["knife10"] = {
		label = "Çakı Knife 10 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["firstaidforpet"] = {
		label = "First aid for pet",
		weight = 500,
		stack = true,
		close = true,
		description = "Revive your pet!",
		client = {
			image = "firstaidforpet.png",
		}
	},

	["petnametag"] = {
		label = "Name tag",
		weight = 500,
		stack = true,
		close = true,
		description = "Rename your pet",
		client = {
			image = "petnametag.png",
		}
	},

	["hackerphone"] = {
		label = "Hacker Telefonu",
		weight = 700,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "phone.png",
		}
	},

	["bass"] = {
		label = "Bass",
		weight = 1000,
		stack = true,
		close = false,
		description = "A normal fish Tatses pretty good!",
		client = {
			image = "bass.png",
		}
	},

	["taco"] = {
		label = "Taco",
		weight = 3,
		stack = true,
		close = true,
		description = "bunu yemem veya paketlemem gerek....",
		client = {
			image = "taco.png",
		}
	},

	["pistolgovde"] = {
		label = "Silah Gövdesi",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "pistolgovde.png",
		}
	},

	["baby_medikit"] = {
		label = "Bebek Sağlık Çantası",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "baby_medikit.png",
		}
	},

	["susturucu30"] = {
		label = "İllegal Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["petfood"] = {
		label = "pet food",
		weight = 500,
		stack = true,
		close = true,
		description = "food for your companion!",
		client = {
			image = "petfood.png",
		}
	},

	["sharktiger"] = {
		label = "Köpek Balığı Kaplanı",
		weight = 3000,
		stack = true,
		close = false,
		description = "Tigershark",
		client = {
			image = "sharktiger.png",
		}
	},

	["zırh60"] = {
		label = "İllegal Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["hose"] = {
		label = "Nargile Hortumu",
		weight = 250,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "hose.png",
		}
	},

	["baby_water"] = {
		label = "Su",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "baby_water.png",
		}
	},

	["keepcompanioncat"] = {
		label = "Cat",
		weight = 500,
		stack = false,
		close = true,
		description = "Cat is your royal companion!",
		client = {
			image = "A_C_Cat_01.png",
		}
	},

	["bottle20"] = {
		label = "Kırık şişe 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["flounder"] = {
		label = "Pisi balığı",
		weight = 1000,
		stack = true,
		close = false,
		description = "Flounder",
		client = {
			image = "flounder.png",
		}
	},

	["anchor"] = {
		label = "Çapa",
		weight = 2500,
		stack = true,
		close = true,
		description = "Boat Anchor",
		client = {
			image = "anchor.png",
		}
	},

	["dp920"] = {
		label = "DB9 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["pkelepceanahtari"] = {
		label = "Kelepçe Anahtarı",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pkelepceanahtari.png",
		}
	},

	["radio30"] = {
		label = "Radio 30 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["ek10"] = {
		label = "Etkinlik 10 Vintage Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["uwu_toy1"] = {
		label = "uWu Blitz",
		weight = 50,
		stack = true,
		close = false,
		description = "Blitz ",
		client = {
			image = "uwu_toy1.png",
		}
	},

	["marijuana_3.5_high"] = {
		label = "3.5g esrar",
		weight = 2800,
		stack = false,
		close = true,
		description = "3.5g high grade marijuana",
		client = {
			image = "marijuana_3.5_high.png",
		}
	},

	["50_below"] = {
		label = "50 Bilo Nirvana Dokha",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "50_below.png",
		}
	},

	["foil_poked"] = {
		label = "Folyo Poker",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "foil_poked.png",
		}
	},

	["tree_lumber"] = {
		label = "Lumber",
		weight = 50,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "lumber.png",
		}
	},

	["keepcompanionmtlion2"] = {
		label = "Panter",
		weight = 500,
		stack = false,
		close = true,
		description = "Panter is your royal companion!",
		client = {
			image = "A_C_MtLion.png",
		}
	},

	["powerbank"] = {
		label = "Telefon Powerbank",
		weight = 25,
		stack = false,
		close = false,
		description = "Telefoununuzu sarj eder.Başka birşey beklemyin",
		client = {
			image = "powerbank.png",
		}
	},

	["egzoz"] = {
		label = "Abarth Egzoz",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "nitrous.png",
		}
	},

	["machete15"] = {
		label = "Machete 15 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["hackv3"] = {
		label = "Tablet V3",
		weight = 700,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "hackv3.png",
		}
	},

	["greenlight_phone"] = {
		label = "Green Light Phone",
		weight = 700,
		stack = true,
		close = true,
		description = "Telefon",
		client = {
			image = "greenlight_phone.png",
		}
	},

	["skateboard"] = {
		label = "Kaykay",
		weight = 500,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "skateboard.png",
		}
	},

	["mackerel"] = {
		label = "Orkinos",
		weight = 1000,
		stack = true,
		close = false,
		description = "Mackerel",
		client = {
			image = "mackerel.png",
		}
	},

	["drone_flyer_5"] = {
		label = "Drone 5",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "drone_flyer_5.png",
		}
	},

	["knuckle15"] = {
		label = "Muşta 15 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["peppermint_shake"] = {
		label = "Trifecta Blonde Nane Sarsıntısı",
		weight = 10,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "peppermint_shake.png",
		}
	},

	["marijuana_joint"] = {
		label = "Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "1g joint",
		client = {
			image = "marijuana_joint.png",
		}
	},

	["crowbar15"] = {
		label = "Levye 15 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["laketrout"] = {
		label = "laketrout",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "laketrout.png",
		}
	},

	["goldentrout"] = {
		label = "goldentrout",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "goldentrout.png",
		}
	},

	["marul"] = {
		label = "Çamurlu Marul",
		weight = 2,
		stack = true,
		close = true,
		description = "bunu yıkamam gerek....",
		client = {
			image = "marul.png",
		}
	},

	["wet_green_phone"] = {
		label = "Wet Green Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Telefon",
		client = {
			image = "wet_green_phone.png",
		}
	},

	["gold_phone"] = {
		label = "Gold İphone",
		weight = 700,
		stack = true,
		close = true,
		description = "Telefon",
		client = {
			image = "gold_phone.png",
		}
	},

	["woodenrod"] = {
		label = "woodenrod",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "woodenrod.png",
		}
	},

	["fishingloot"] = {
		label = "Balık Avı",
		weight = 500,
		stack = true,
		close = true,
		description = "Seems to be a corroded from the salt water, Should be easy to open",
		client = {
			image = "fishingloot.png",
		}
	},

	["wet_gold_phone"] = {
		label = "Wet Gold Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = {
			image = "wet_gold_phone.png",
		}
	},

	["wet_white_phone"] = {
		label = "Wet White Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Telefon",
		client = {
			image = "wet_white_phone.png",
		}
	},

	["headbag"] = {
		label = "Çuval",
		weight = 0,
		stack = true,
		close = true,
		description = "Su Tabancası",
		client = {
			image = "pkelepceanahtari.png",
		}
	},

	["wet_black_phone"] = {
		label = "Wet Black Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = {
			image = "wet_black_phone.png",
		}
	},

	["marijuana_lighter"] = {
		label = "Çakmak",
		weight = 0,
		stack = true,
		close = true,
		description = "Cheap tweaker lighter, Still does the job",
		client = {
			image = "marijuana_lighter.png",
		}
	},

	["tutamac"] = {
		label = "Silah Tutamacı",
		weight = 0,
		stack = true,
		close = true,
		description = "Silah üretiminde kullanılır.",
		client = {
			image = "tutamac.png",
		}
	},

	["drone_flyer_4"] = {
		label = "Drone 4",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "drone_flyer_4.png",
		}
	},

	["tailfishbait"] = {
		label = "tailfishbait",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "tailfishbait.png",
		}
	},

	["mining_goldbar"] = {
		label = "Altın Çubuk",
		weight = 500,
		stack = true,
		close = true,
		description = "Gold Bar",
		client = {
			image = "mining_goldbar.png",
		}
	},

	["odun"] = {
		label = "Odun",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "odun.png",
		}
	},

	["marijuana_crop_high"] = {
		label = "Stunk",
		weight = 5500,
		stack = true,
		close = false,
		description = "high grade harvested marijuana crop",
		client = {
			image = "marijuana_crop_high.png",
		}
	},

	["kelepce20"] = {
		label = "20 Kelepce Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["uwu_toy3"] = {
		label = "uWu Citruz",
		weight = 50,
		stack = true,
		close = false,
		description = "Citruz ",
		client = {
			image = "uwu_toy3.png",
		}
	},

	["centralchip"] = {
		label = "Sentral Çip",
		weight = 700,
		stack = false,
		close = true,
		description = "this laptop need vpn to make it work",
		client = {
			image = "centralchip.png",
		}
	},

	["keepcompanionhusky"] = {
		label = "Husky",
		weight = 500,
		stack = false,
		close = true,
		description = "Husky is your royal companion!",
		client = {
			image = "A_C_Husky.png",
		}
	},

	["darklaptop"] = {
		label = "Hack Laptop",
		weight = 700,
		stack = false,
		close = true,
		description = "this laptop need vpn to make it work",
		client = {
			image = "laptop.png",
		}
	},

	["social_smoke"] = {
		label = "Sigara Aroması",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "social_smoke.png",
		}
	},

	["keepcompanionrabbit"] = {
		label = "Rabbit",
		weight = 500,
		stack = false,
		close = true,
		description = "Rabbit is your royal companion!",
		client = {
			image = "A_C_Rabbit_01.png",
		}
	},

	["mining_copperbar"] = {
		label = "Bakır çubuk",
		weight = 500,
		stack = true,
		close = true,
		description = "Copper Bar",
		client = {
			image = "mining_copperbar.png",
		}
	},

	["petwaterbottleportable"] = {
		label = "Portable water bottle",
		weight = 1000,
		stack = false,
		close = true,
		description = "Flask to store water for your pets",
		client = {
			image = "petwaterbottleportable.png",
		}
	},

	["drumfish"] = {
		label = "drumfish",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "drumfish.png",
		}
	},

	["crappie"] = {
		label = "crappie",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "crappie.png",
		}
	},


	["ammonia"] = {
		label = "Amonyak",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "ammonia.png",
		}
	},

	["sacid"] = {
		label = "Sacid",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "sacid.png",
		}
	},

	["breaked_meth"] = {
		label = "Kırılmış Meth",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "breaked_meth.png",
		}
	},

	["cooked_meth"] = {
		label = "Pişirilmiş Meth",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "cooked_meth.png",
		}
	},

	["packed_meth"] = {
		label = "Paketlenmiş Meth",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "packed_meth.png",
		}
	},

	["powdered_milk"] = {
		label = "Süt Tozu",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "powdered_milk.png",
		}
	},

	["unpacked_coke"] = {
		label = "Paketlenmemiş Kokain",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "unpacked_coke.png",
		}
	},

	["cutted_coke"] = {
		label = "Kesilmiş Kokain",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "cutted_coke.png",
		}
	},
	
	["packed_coke"] = {
		label = "Paketlenmiş Kokain",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "packed_coke.png",
		}
	},

	["plant_spray"] = {
		label = "Bitki Spreyi",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "plant_spray.png",
		}
	},
	

	["packed_weed"] = {
		label = "Paketlenmiş Ot",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "packed_weed.png",
		}
	},


	["unpacking_weed"] = {
		label = "Paketlenmemiş Ot",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "unpacking_weed.png",
		}
	},

	["packed_weed"] = {
		label = "Paketlenmiş Ot",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "packed_weed.png",
		}
	},

	["money_sheet"] = {
		label = "Para Kağıdı",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "money_sheet.png",
		}
	},

	["uncutted_money"] = {
		label = "Kesilmemiş Para",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "uncutted_money.png",
		}
	},

	["cutted_money"] = {
		label = "Kesilmiş Para",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "cutted_money.png",
		}
	},

	["washed_money"] = {
		label = "Yıkanmış Para",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "washed_money.png",
		}
	},





	["bottle15"] = {
		label = "Kırık şişe 15 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["vpn"] = {
		label = "VPN",
		weight = 700,
		stack = false,
		close = false,
		description = "vpn for good use",
		client = {
			image = "vpn.png",
		}
	},

	["marijuana_nutrition"] = {
		label = "Bitki Gübresi",
		weight = 0,
		stack = true,
		close = true,
		description = "Plant nutrition",
		client = {
			image = "marijuana_nutrition.png",
		}
	},

	["baby_food"] = {
		label = "Bebek maması",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "baby_food.png",
		}
	},

	["bream"] = {
		label = "bream",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "bream.png",
		}
	},

	["koicarpblack"] = {
		label = "koicarpblack",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "koicarpblack.png",
		}
	},

	["mdt"] = {
		label = "MDT",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "black_money.png",
		}
	},

	["pearlscard"] = {
		label = "İnci Kartı",
		weight = 100,
		stack = true,
		close = true,
		description = "A special member of Pearl's Seafood Restaurant",
		client = {
			image = "pearlscard.png",
		}
	},

	["marijuana_1oz_mid"] = {
		label = "1 ons esrar",
		weight = 2800,
		stack = false,
		close = false,
		description = "1oz mid grade marijuana",
		client = {
			image = "marijuana_1oz_mid.png",
		}
	},

	["4play"] = {
		label = "4Play Fantasia",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "4play.png",
		}
	},

	["machete10"] = {
		label = "Machete 10 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["shortnosesucker"] = {
		label = "shortnosesucker",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "shortnosesucker.png",
		}
	},

	["dolphin"] = {
		label = "Yunus Balığı",
		weight = 3000,
		stack = true,
		close = false,
		description = "Dolphin",
		client = {
			image = "dolphin.png",
		}
	},

	["cruciancarp"] = {
		label = "cruciancarp",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "cruciancarp.png",
		}
	},

	["marijuana_1oz_low"] = {
		label = "1 ons esrar",
		weight = 2800,
		stack = false,
		close = false,
		description = "1oz low grade marijuana",
		client = {
			image = "marijuana_1oz_low.png",
		}
	},

	["bluebackherring"] = {
		label = "bluebackherring",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "bluebackherring.png",
		}
	},

	["black_phone"] = {
		label = "Siyah İphone",
		weight = 700,
		stack = true,
		close = true,
		description = "Telefon",
		client = {
			image = "black_phone.png",
		}
	},

	["golfclub15"] = {
		label = "Golclub 15 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["adalya_love"] = {
		label = "Adalya Love 66",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "adalya_love.png",
		}
	},

	["poolcue10"] = {
		label = "Istıka Sopa 10 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["mermi100"] = {
		label = "İllegal Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["keepcompanionhen"] = {
		label = "Hen",
		weight = 500,
		stack = false,
		close = true,
		description = "Hen is your royal companion!",
		client = {
			image = "A_C_Hen.png",
		}
	},

	["susturucu20"] = {
		label = "İllegal Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["poolcue20"] = {
		label = "Istıka Sopa 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["knuckle10"] = {
		label = "Muşta 10 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["golfclub20"] = {
		label = "Golclub 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["marijuana_scale"] = {
		label = "Ölçek",
		weight = 0,
		stack = true,
		close = false,
		description = "This is not what it looks like",
		client = {
			image = "marijuana_scale.png",
		}
	},

	["palidsturgeon"] = {
		label = "palidsturgeon",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "palidsturgeon.png",
		}
	},

	["p22615"] = {
		label = "P226 15 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["uzi10"] = {
		label = "İllegal Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["koidrod"] = {
		label = "koidrod",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "koidrod.png",
		}
	},

	["el_patron"] = {
		label = "Kaos Patron",
		weight = 10,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "el_patron.png",
		}
	},

	["danishrod"] = {
		label = "danishrod",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "danishrod.png",
		}
	},

	["doublehookbait"] = {
		label = "doublehookbait",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "doublehookbait.png",
		}
	},

	["threesidedbait"] = {
		label = "threesidedbait",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "threesidedbait.png",
		}
	},

	["tacoeti"] = {
		label = "Taco Eti",
		weight = 2,
		stack = true,
		close = true,
		description = "bunu yıkamam gerek....",
		client = {
			image = "tacoeti.png",
		}
	},

	["bottle10"] = {
		label = "Kırık şişe 10 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["yikanmismarul"] = {
		label = "Marul",
		weight = 1,
		stack = true,
		close = true,
		description = "bunu hazırlamam gerek....",
		client = {
			image = "yikanmismarul.png",
		}
	},

	["fishingkey"] = {
		label = "Balık Tutma Anahtarı",
		weight = 100,
		stack = true,
		close = true,
		description = "A weathered key that looks usefull",
		client = {
			image = "fishingkey.png",
		}
	},

	["et"] = {
		label = "Kıyma",
		weight = 2,
		stack = true,
		close = true,
		description = "bunu pişirmem gerek....",
		client = {
			image = "et.png",
		}
	},

	["hatchet20"] = {
		label = "Balta 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["p22610"] = {
		label = "P226 10 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["uwu_toy2"] = {
		label = "uWu Scratzes",
		weight = 50,
		stack = true,
		close = false,
		description = "Scratzes ",
		client = {
			image = "uwu_toy2.png",
		}
	},

	["mining_goldnugget"] = {
		label = "Altın Külçe",
		weight = 500,
		stack = true,
		close = true,
		description = "Golden nugget from mining",
		client = {
			image = "mining_goldnugget.png",
		}
	},

	["stone_hatchet20"] = {
		label = "İllegal Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["machinepistol10"] = {
		label = "İllegal Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["hammer10"] = {
		label = "Çekic 10 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["lahontancutthroattrout"] = {
		label = "lahontancutthroattrout",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "lahontancutthroattrout.png",
		}
	},

	["hackv2"] = {
		label = "Tablet V2",
		weight = 700,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "hackv2.png",
		}
	},

	["lift_rail"] = {
		label = "Kaldırma Rayı",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "lift_rail.png",
		}
	},

	["tacoekmegi"] = {
		label = "Taco Ekmegi",
		weight = 2,
		stack = true,
		close = true,
		description = "bunu yıkamam gerek....",
		client = {
			image = "tacoekmegi.png",
		}
	},

	["disabler"] = {
		label = "Disabler",
		weight = 500,
		stack = true,
		close = true,
		description = "for the boosting contracts",
		client = {
			image = "tablet.png",
		}
	},

	["arowana"] = {
		label = "arowana",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "arowana.png",
		}
	},

	["tacomalzemesi"] = {
		label = "Taco Malzemesi",
		weight = 1,
		stack = true,
		close = true,
		description = "bunu hazırlamam gerek....",
		client = {
			image = "tacomalzemesi.png",
		}
	},

	["fishingtin"] = {
		label = "Boş Kavanoz",
		weight = 2500,
		stack = true,
		close = false,
		description = "Fishing Tin",
		client = {
			image = "fishingtin.png",
		}
	},

	["coals"] = {
		label = "Nargile Kömürleri",
		weight = 300,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "coals.png",
		}
	},

	["keepcompanionpoodle"] = {
		label = "Poodle",
		weight = 500,
		stack = false,
		close = true,
		description = "Poodle is your royal companion!",
		client = {
			image = "A_C_Poodle.png",
		}
	},

	["g17a15"] = {
		label = "Glock17 15 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["whitefish"] = {
		label = "whitefish",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "whitefish.png",
		}
	},

	["hammer15"] = {
		label = "Çekic 15 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["hurda_altin"] = {
		label = "Altın Parçası",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "hurda_altin.png",
		}
	},

	["planks"] = {
		label = "Odun plakalar",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "planks.png",
		}
	},

	["knife15"] = {
		label = "Çakı Knife 15 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["bat15"] = {
		label = "Sopa 15 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["wood_plank"] = {
		label = "Wood Plank",
		weight = 50,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "woodplank.png",
		}
	},

	["watergun"] = {
		label = "Su Tabancası",
		weight = 0,
		stack = true,
		close = true,
		description = "Su Tabancası",
		client = {
			image = "watergun.png",
		}
	},

	["phone_module"] = {
		label = "Phone Module",
		weight = 300,
		stack = false,
		close = true,
		description = "It seems that we can fix a wet phone with this module, interesting.",
		client = {
			image = "phone_module.png",
		}
	},

	["hackv1"] = {
		label = "Tablet",
		weight = 700,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "hackv1.png",
		}
	},

	["baby_water2"] = {
		label = "Süt",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "baby_water2.png",
		}
	},

	["tetik"] = {
		label = "Silah Tetiği",
		weight = 0,
		stack = true,
		close = true,
		description = "Silah üretiminde kullanılır.",
		client = {
			image = "tetik.png",
		}
	},

	["marijuana_baggies"] = {
		label = "Çantalar",
		weight = 0,
		stack = true,
		close = true,
		description = "Need some baggies? i got some baggies",
		client = {
			image = "marijuana_baggies.png",
		}
	},

	["baby_medikit2"] = {
		label = "Bebek Sağlık Çantası",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "baby_medikit2.png",
		}
	},

	["petgroomingkit"] = {
		label = "Pet Grooming Kit",
		weight = 1000,
		stack = false,
		close = true,
		description = "Pet Grooming Kit",
		client = {
			image = "petgroomingkit.png",
		}
	},

	["spades_fantasia"] = {
		label = "Maça Ası Fantasia",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "spades_fantasia.png",
		}
	},

	["pet_water"] = {
		label = "Evcil hayvan suyu",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pet_water.png",
		}
	},

	["paketlenmistaco"] = {
		label = "Kutulanmış Taco",
		weight = 24,
		stack = true,
		close = true,
		description = "bunu satmam gerek....",
		client = {
			image = "paketlenmistaco.png",
		}
	},

	["marijuana_crop_low"] = {
		label = "Stunk",
		weight = 5500,
		stack = true,
		close = false,
		description = "low grade harvested marijuana crop",
		client = {
			image = "marijuana_crop_low.png",
		}
	},

	["keepcompanionretriever"] = {
		label = "Retriever",
		weight = 500,
		stack = false,
		close = true,
		description = "Retriever is your royal companion!",
		client = {
			image = "A_C_Retriever.png",
		}
	},

	["cuff_keys"] = {
		label = "New Kelepçe Anahtar",
		weight = 0,
		stack = true,
		close = true,
		description = "Su Tabancası",
		client = {
			image = "pkelepceanahtari.png",
		}
	},

	["bluegill"] = {
		label = "bluegill",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "bluegill.png",
		}
	},

	["fishinglootbig"] = {
		label = "Büyük Balık Kutusu",
		weight = 2500,
		stack = true,
		close = true,
		description = "The lock seems to be intact, Might need a key",
		client = {
			image = "fishinglootbig.png",
		}
	},

	["bulltrout"] = {
		label = "bulltrout",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "bulltrout.png",
		}
	},

	["yay"] = {
		label = "Silah Yayı",
		weight = 0,
		stack = true,
		close = true,
		description = "Silah üretiminde kullanılır.",
		client = {
			image = "yay.png",
		}
	},

	["nail"] = {
		label = "Çivi",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "nail.png",
		}
	},

	["stone_hatchet15"] = {
		label = "İllegal Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["lift"] = {
		label = "Lift",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "lift.png",
		}
	},

	["pike"] = {
		label = "pike",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "pike.png",
		}
	},

	["green_phone"] = {
		label = "Yeşil İphone",
		weight = 700,
		stack = true,
		close = true,
		description = "Telefon",
		client = {
			image = "green_phone.png",
		}
	},

	["mining_washedstone"] = {
		label = "Yıkanmış Taş",
		weight = 500,
		stack = true,
		close = true,
		description = "Wasted Stone",
		client = {
			image = "mining_washedstone.png",
		}
	},

	["teltoka"] = {
		label = "Tel Toka",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "teltoka.png",
		}
	},

	["drone_flyer_1"] = {
		label = "Drone 1",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "drone_flyer_1.png",
		}
	},

	["cane_mint"] = {
		label = "Tanca Kamışı Nane",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "cane_mint.png",
		}
	},

	["marijuana_1oz_high"] = {
		label = "1ons esrar",
		weight = 2800,
		stack = false,
		close = false,
		description = "1oz high grade marijuana",
		client = {
			image = "marijuana_1oz_high.png",
		}
	},

	["drone_flyer_3"] = {
		label = "Drone 3",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "drone_flyer_3.png",
		}
	},

	["zırh30"] = {
		label = "30 Zırh Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["collarpet"] = {
		label = "Pet collar",
		weight = 500,
		stack = true,
		close = true,
		description = "Rename your pets!",
		client = {
			image = "collarpet.png",
		}
	},

	["knife20"] = {
		label = "Çakı Knife 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["bag"] = {
		label = "Soygun Çantası",
		weight = 0,
		stack = true,
		close = true,
		description = "Su Tabancası",
		client = {
			image = "bag.png",
		}
	},

	["evadiamond"] = {
		label = "Eva Diamond Jeton",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "evadiamond.png",
		}
	},

	["mining_pan"] = {
		label = "Yıkama Tavası",
		weight = 500,
		stack = false,
		close = true,
		description = "Classic's washing pan",
		client = {
			image = "mining_pan.png",
		}
	},

	["bat20"] = {
		label = "Sopa 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["hurda_bakir"] = {
		label = "Hurda Bakır",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "hurda_bakir.png",
		}
	},

	["switchblade20"] = {
		label = "Sustalı 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["tacopaketi"] = {
		label = "Paketlenmiş Taco",
		weight = 24,
		stack = true,
		close = true,
		description = "bunu satmam gerek....",
		client = {
			image = "tacopaketi.png",
		}
	},

	["crowbar20"] = {
		label = "Levye 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["hurda_tech"] = {
		label = "Teknolojik Hurda Parçası",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "hurda_tech.png",
		}
	},

	["brooktrout"] = {
		label = "brooktrout",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "brooktrout.png",
		}
	},

	["hammer20"] = {
		label = "Çekic 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["marijuana_joint3g"] = {
		label = "Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "3g joint",
		client = {
			image = "marijuana_joint3g.png",
		}
	},

	["namlu"] = {
		label = "Silah Namlusu",
		weight = 0,
		stack = true,
		close = true,
		description = "Silah üretiminde kullanılır.",
		client = {
			image = "namlu.png",
		}
	},

	["wallaye"] = {
		label = "wallaye",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "wallaye.png",
		}
	},

	["foil"] = {
		label = "Folyo kağıdı",
		weight = 150,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "foil.png",
		}
	},

	["pet_medikit"] = {
		label = "Hayvan Medikit",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pet_medikit.png",
		}
	},

	["susturucu40"] = {
		label = "İllegal Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["fishtacklebox"] = {
		label = "Olta Kutusu",
		weight = 1000,
		stack = true,
		close = true,
		description = "Seems to be left over tackle box from another fisherman",
		client = {
			image = "fishtacklebox.png",
		}
	},

	["dp915"] = {
		label = "DB9 15 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["hatchet15"] = {
		label = "Balta 15 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["mining_ironbar"] = {
		label = "Demir Çubuk",
		weight = 500,
		stack = true,
		close = true,
		description = "Iron Bar",
		client = {
			image = "mining_ironbar.png",
		}
	},

	["cutter"] = {
		label = "Kesici alet",
		weight = 0,
		stack = true,
		close = true,
		description = "Su Tabancası",
		client = {
			image = "cutter.png",
		}
	},

	["keepcompanionmtlion"] = {
		label = "MtLion",
		weight = 500,
		stack = false,
		close = true,
		description = "MtLion is your royal companion!",
		client = {
			image = "A_C_MtLion.png",
		}
	},

	["keepcompanionshepherd"] = {
		label = "Shepherd",
		weight = 500,
		stack = false,
		close = true,
		description = "Shepherd is your royal companion!",
		client = {
			image = "A_C_shepherd.png",
		}
	},

	["hurda_demir"] = {
		label = "Hurda Demir",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "hurda_demir.png",
		}
	},

	["colorodopikeminnow"] = {
		label = "colorodopikeminnow",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "colorodopikeminnow.png",
		}
	},

	["g17a20"] = {
		label = "Glock17 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["knuckle20"] = {
		label = "Muşta 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["p22620"] = {
		label = "P226 20 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["wrench10"] = {
		label = "İngiliz Anahtarı 10 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["switchblade15"] = {
		label = "Sustalı 15 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["gummi_bear"] = {
		label = "Fumari Beyaz Sakızlı Ayı",
		weight = 10,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "gummi_bear.png",
		}
	},

	["silverymonnow"] = {
		label = "silverymonnow",
		weight = 0,
		stack = true,
		close = false,
		description = "Description",
		client = {
			image = "silverymonnow.png",
		}
	},

	["bmbilet"] = {
		label = "Bm Bilet",
		weight = 700,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "bmbilet.png",
		}
	},

	["uwu_toy4"] = {
		label = "uWu Zoxy",
		weight = 50,
		stack = true,
		close = false,
		description = "Zoxy ",
		client = {
			image = "uwu_toy4.png",
		}
	},

	["tree_bark"] = {
		label = "Tree Bark",
		weight = 50,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "treebark.png",
		}
	},

	["classic_phone"] = {
		label = "Classic Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Telefon",
		client = {
			image = "classic_phone.png",
		}
	},

	["marijuana_water"] = {
		label = "Bitki Suyu",
		weight = 0,
		stack = true,
		close = true,
		description = "Plant water",
		client = {
			image = "marijuana_water.png",
		}
	},

	["golfclub10"] = {
		label = "Golclub 10 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["mermi80"] = {
		label = "İllegal Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["weaponframekit"] = {
		label = "Silah Frame Kit",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "weaponframekit.png",
		}
	},

	["switchblade10"] = {
		label = "Sustalı 10 Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["zırh100"] = {
		label = "İllegal Sandık",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "np_box.png",
		}
	},

	["silahparca1"] = {
		label = "Silah Manivelası",
		weight = 0,
		stack = true,
		close = true,
		description = "Silah üretiminde kullanılır.",
		client = {
			image = "silahparca1.png",
		}
	},

	["silahparca3"] = {
		label = "Silah Tetiği",
		weight = 0,
		stack = true,
		close = true,
		description = "Silah üretiminde kullanılır.",
		client = {
			image = "silahparca3.png",
		}
	},

	["silahparca2"] = {
		label = "Silah Sürügüsü",
		weight = 0,
		stack = true,
		close = true,
		description = "Silah üretiminde kullanılır.",
		client = {
			image = "silahparca2.png",
		}
	},

	["bandage2"] = {
		label = "Bandaj",
		weight = 0,
		stack = true,
		close = true,
		description = "Hafif yaralar ve kanamalar için kullanılan bez parçası",
		client = {
			image = "bandage.png",
		}
	},

	["silahparca4"] = {
		label = "Silah Şarjörü",
		weight = 0,
		stack = true,
		close = true,
		description = "Silah üretiminde kullanılır.",
		client = {
			image = "silahparca4.png",
		}
	},

	["meyvekokteyl"] = {
		label = "Meyve Kokteyl",
		weight = 200,
		stack = true,
		close = true,
		description = "Yabanmersinli Lavanta Çayı.",
		client = {
			image = "loreccakokteyl.png",
		}
	},

	["veh_engine"] = {
		label = "Engine",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle engine",
		client = {
			image = "veh_engine.png",
		}
	},

	["fat_end_muzzle_brake"] = {
		label = "Fat End Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "fat_end_muzzle_brake.png",
		}
	},

	["bellend_muzzle_brake"] = {
		label = "Bellend Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "bellend_muzzle_brake.png",
		}
	},

	["flashlight_attachment"] = {
		label = "Flashlight",
		weight = 1000,
		stack = true,
		close = true,
		description = "A flashlight for a weapon",
		client = {
			image = "flashlight_attachment.png",
		}
	},

	["perseuscamo_attachment"] = {
		label = "Perseus Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A perseus camo for a weapon",
		client = {
			image = "perseuscamo_attachment.png",
		}
	},

	["drum_attachment"] = {
		label = "Drum",
		weight = 1000,
		stack = true,
		close = true,
		description = "A drum for a weapon",
		client = {
			image = "drum_attachment.png",
		}
	},

	["tenkgoldchain"] = {
		label = "10k Gold Chain",
		weight = 2000,
		stack = true,
		close = true,
		description = "10 carat golden chain",
		client = {
			image = "10kgoldchain.png",
		}
	},

	["tactical_muzzle_brake"] = {
		label = "Tactical Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brakee for a weapon",
		client = {
			image = "tactical_muzzle_brake.png",
		}
	},

	["newsbmic"] = {
		label = "Boom Microphone",
		weight = 100,
		stack = false,
		close = true,
		description = "A Useable BoomMic",
		client = {
			image = "newsbmic.png",
		}
	},

	["newscam"] = {
		label = "News Camera",
		weight = 100,
		stack = false,
		close = true,
		description = "A camera for the news",
		client = {
			image = "newscam.png",
		}
	},

	["weed_whitewidow"] = {
		label = "White Widow 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g White Widow",
		client = {
			image = "weed_baggy.png",
		}
	},

	["tirerepairkit"] = {
		label = "Tire Repair Kit",
		weight = 1000,
		stack = true,
		close = true,
		description = "A kit to repair your tires",
		client = {
			image = "tirerepairkit.png",
		}
	},

	["veh_transmission"] = {
		label = "Transmission",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle transmission",
		client = {
			image = "veh_transmission.png",
		}
	},

	["veh_suspension"] = {
		label = "Suspension",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle suspension",
		client = {
			image = "veh_suspension.png",
		}
	},

	["veh_armor"] = {
		label = "Armor",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle armor",
		client = {
			image = "veh_armor.png",
		}
	},

	["smallscope_attachment"] = {
		label = "Small Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A small scope for a weapon",
		client = {
			image = "smallscope_attachment.png",
		}
	},

	["barrel_attachment"] = {
		label = "Barrel",
		weight = 1000,
		stack = true,
		close = true,
		description = "A barrel for a weapon",
		client = {
			image = "barrel_attachment.png",
		}
	},

	["boomcamo_attachment"] = {
		label = "Boom Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A boom camo for a weapon",
		client = {
			image = "boomcamo_attachment.png",
		}
	},

	["veh_xenons"] = {
		label = "Xenons",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle xenons",
		client = {
			image = "veh_xenons.png",
		}
	},

	["weed_purplehaze"] = {
		label = "Purple Haze 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Purple Haze",
		client = {
			image = "weed_baggy.png",
		}
	},

	["luxuryfinish_attachment"] = {
		label = "Luxury Finish",
		weight = 1000,
		stack = true,
		close = true,
		description = "A luxury finish for a weapon",
		client = {
			image = "luxuryfinish_attachment.png",
		}
	},

	["heavy_duty_muzzle_brake"] = {
		label = "HD Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "heavy_duty_muzzle_brake.png",
		}
	},

	["nvscope_attachment"] = {
		label = "Night Vision Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A night vision scope for a weapon",
		client = {
			image = "nvscope_attachment.png",
		}
	},

	["skullcamo_attachment"] = {
		label = "Skull Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A skull camo for a weapon",
		client = {
			image = "skullcamo_attachment.png",
		}
	},

	["weed_ogkush"] = {
		label = "OGKush 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g OG Kush",
		client = {
			image = "weed_baggy.png",
		}
	},

	["digicamo_attachment"] = {
		label = "Digital Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A digital camo for a weapon",
		client = {
			image = "digicamo_attachment.png",
		}
	},

	["patriotcamo_attachment"] = {
		label = "Patriot Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A patriot camo for a weapon",
		client = {
			image = "patriotcamo_attachment.png",
		}
	},

	["weed_whitewidow_seed"] = {
		label = "White Widow Seed",
		weight = 0,
		stack = true,
		close = false,
		description = "A weed seed of White Widow",
		client = {
			image = "weed_seed.png",
		}
	},

	["bankcard"] = {
		label = "Bank Card",
		weight = 0,
		stack = false,
		close = true,
		description = "Used to access ATM",
		client = {
			image = "hotel_card.png",
		}
	},

	["blackcard"] = {
		label = "BlackMarket Kart",
		weight = 0,
		stack = false,
		close = true,
		description = "Used to Black Market",
		client = {
			image = "blackcard.png",
		}
	},

	["zebracamo_attachment"] = {
		label = "Zebra Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A zebra camo for a weapon",
		client = {
			image = "zebracamo_attachment.png",
		}
	},

	["woodcamo_attachment"] = {
		label = "Woodland Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A woodland camo for a weapon",
		client = {
			image = "woodcamo_attachment.png",
		}
	},

	["grip_attachment"] = {
		label = "Grip",
		weight = 1000,
		stack = true,
		close = true,
		description = "A grip for a weapon",
		client = {
			image = "grip_attachment.png",
		}
	},

	["suppressor_attachment"] = {
		label = "Suppressor",
		weight = 1000,
		stack = true,
		close = true,
		description = "A suppressor for a weapon",
		client = {
			image = "suppressor_attachment.png",
		}
	},

	["largescope_attachment"] = {
		label = "Large Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A large scope for a weapon",
		client = {
			image = "largescope_attachment.png",
		}
	},

	["veh_tint"] = {
		label = "Tints",
		weight = 1000,
		stack = true,
		close = true,
		description = "Install vehicle tint",
		client = {
			image = "veh_tint.png",
		}
	},

	["split_end_muzzle_brake"] = {
		label = "Split End Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "split_end_muzzle_brake.png",
		}
	},

	["advscope_attachment"] = {
		label = "Advanced Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "An advanced scope for a weapon",
		client = {
			image = "advscope_attachment.png",
		}
	},

	["veh_neons"] = {
		label = "Neons",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle neons",
		client = {
			image = "veh_neons.png",
		}
	},

	["weed_purplehaze_seed"] = {
		label = "Purple Haze Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Purple Haze",
		client = {
			image = "weed_seed.png",
		}
	},

	["veh_exterior"] = {
		label = "Exterior",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle exterior",
		client = {
			image = "veh_exterior.png",
		}
	},

	["squared_muzzle_brake"] = {
		label = "Squared Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "squared_muzzle_brake.png",
		}
	},

	["newsmic"] = {
		label = "News Microphone",
		weight = 100,
		stack = false,
		close = true,
		description = "A microphone for the news",
		client = {
			image = "newsmic.png",
		}
	},

	["precision_muzzle_brake"] = {
		label = "Precision Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "precision_muzzle_brake.png",
		}
	},

	["geocamo_attachment"] = {
		label = "Geometric Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A geometric camo for a weapon",
		client = {
			image = "geocamo_attachment.png",
		}
	},

	["veh_plates"] = {
		label = "Plates",
		weight = 1000,
		stack = true,
		close = true,
		description = "Install vehicle plates",
		client = {
			image = "veh_plates.png",
		}
	},

	["medscope_attachment"] = {
		label = "Medium Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A medium scope for a weapon",
		client = {
			image = "medscope_attachment.png",
		}
	},

	["veh_turbo"] = {
		label = "Turbo",
		weight = 1000,
		stack = true,
		close = true,
		description = "Install vehicle turbo",
		client = {
			image = "veh_turbo.png",
		}
	},

	["weed_ogkush_seed"] = {
		label = "OGKush Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of OG Kush",
		client = {
			image = "weed_seed.png",
		}
	},

	["holoscope_attachment"] = {
		label = "Holo Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A holo scope for a weapon",
		client = {
			image = "holoscope_attachment.png",
		}
	},

	["brushcamo_attachment"] = {
		label = "Brushstroke Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A brushstroke camo for a weapon",
		client = {
			image = "brushcamo_attachment.png",
		}
	},

	["thermalscope_attachment"] = {
		label = "Thermal Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A thermal scope for a weapon",
		client = {
			image = "thermalscope_attachment.png",
		}
	},

	["veh_toolbox"] = {
		label = "Toolbox",
		weight = 1000,
		stack = true,
		close = true,
		description = "Check vehicle status",
		client = {
			image = "veh_toolbox.png",
		}
	},

	["veh_wheels"] = {
		label = "Wheels",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle wheels",
		client = {
			image = "veh_wheels.png",
		}
	},

	["veh_brakes"] = {
		label = "Brakes",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle brakes",
		client = {
			image = "veh_brakes.png",
		}
	},

	["flat_muzzle_brake"] = {
		label = "Flat Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "flat_muzzle_brake.png",
		}
	},

	["slanted_muzzle_brake"] = {
		label = "Slanted Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "slanted_muzzle_brake.png",
		}
	},

	["clip_attachment"] = {
		label = "Clip",
		weight = 1000,
		stack = true,
		close = true,
		description = "A clip for a weapon",
		client = {
			image = "clip_attachment.png",
		}
	},

	["sessantacamo_attachment"] = {
		label = "Sessanta Nove Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A sessanta nove camo for a weapon",
		client = {
			image = "sessantacamo_attachment.png",
		}
	},

	["leopardcamo_attachment"] = {
		label = "Leopard Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A leopard camo for a weapon",
		client = {
			image = "leopardcamo_attachment.png",
		}
	},

	["comp_attachment"] = {
		label = "Compensator",
		weight = 1000,
		stack = true,
		close = true,
		description = "A compensator for a weapon",
		client = {
			image = "comp_attachment.png",
		}
	},

	["veh_interior"] = {
		label = "Interior",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle interior",
		client = {
			image = "veh_interior.png",
		}
	},

	["esrarislenmis"] = {
		label = "Paketlenmiş Esrar",
		weight = 100,
		stack = true,
		close = false,
		description = "İşlenmiş Esrar",
		client = {
			image = "islenmisesrar.png",
		}
	},

	["illegalFishBait"] = {
		label = "Illegal Fish Bait",
		weight = 50,
		stack = false,
		close = true,
		description = "A nice document",
		client = {
			image = "illegalFishBait.png",
		}
	},

	["esrar"] = {
		label = "Esrar",
		weight = 200,
		stack = true,
		close = false,
		description = "Esrar",
		client = {
			image = "esrar.png",
		}
	},

	["hookah"] = {
		label = "Nargile",
		weight = 2000,
		stack = true,
		close = true,
		description = "A traditional hookah",
		client = {
			image = "hookah.png",
		}
	},

	["bank_card"] = {
		label = "Bank Card",
		weight = 0,
		stack = false,
		close = true,
		description = "Used to access ATM",
		client = {
			image = "bank_card.png",
		}
	},

	["kenevir"] = {
		label = "Kenevir",
		weight = 0,
		stack = true,
		close = true,
		description = "Sidney would be very proud at you",
		client = {
			image = "kenevir.png",
		}
	},

	["kokain"] = {
		label = "Kokain",
		weight = 0,
		stack = true,
		close = true,
		description = "To get happy faster",
		client = {
			image = "kokain.png",
		}
	},
}