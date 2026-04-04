# Resource Map

Bu dosya, `data/resources` altindaki ana resource gruplarini ve yuksek seviyede ne yaptiklarini listeler.

## `[qb]` QBCore cekirdegi

- `qb-adminmenu`: admin komutlari ve admin panel akislari
- `qb-ambulancejob`: EMS / hastane meslegi
- `qb-core`: framework cekirdegi, oyuncu load/save, komut sistemi
- `qb-crafting`: crafting sistemi
- `qb-doorlock`: kapilar ve kilit mantigi
- `qb-input`: input dialog / form UI
- `qb-interior`: interior yardimci akislari
- `qb-inventory`: inventory sistemi
- `qb-management`: boss menu ve isyeri yonetimi
- `qb-menu`: menu UI
- `qb-policejob`: polis meslegi
- `qb-smallresources`: cesitli kucuk utility ve gameplay ozellikleri
- `qb-target`: hedefleme / interaction raycast sistemi
- `qb-vehiclekeys`: arac anahtar sistemi
- `qb-weapons`: silah mantigi
- `qb-weathersync`: hava durumu senkronizasyonu

## `[alan]` Sunucuya ozel veya ozellestirilmis sistemler

- `alanNotify`: ozel notification UI
- `hb_chat`: chat arayuzu
- `hb_farming`: farming / toplama isi
- `hb_loading`: loading screen
- `hb_me`: `/me` benzeri rolplay metin sistemi
- `hb_mechanic`: mekanik / bennys / tamir ve mod sistemi
- `hb_miner`: madencilik isi
- `hb_motel`: motel kiralama sistemi
- `hb_multicharacter`: coklu karakter secimi
- `hb_vehicleshop`: arac galerisi / satis sistemi
- `high_phone`: telefon, mesaj, mail, fatura, banka entegrasyonlari
- `qg_markets`: market / ticaret sistemi
- `svdden_banking`: banka UI ve hesap islemleri

## `[meslek]` Ek gameplay ve meslek paketleri

- `ak4y-advancedFishing`: gelismis balikcilik
- `dpemotes`: emote sistemi
- `qb-carwash`: arac yikama
- `quadro_drift`: drift odakli gameplay paketi
- `quadro_kucakomuz`: tasima / omuz / kucak sistemi
- `quadro_meth`: meth ile ilgili gameplay paketi
- `tgiann-aracparcalama`: arac parcala / chop shop benzeri sistem
- `wais-jobpack`: toplu meslek paketi

## `[standalone]` Framework disi temel araclar

- `ataturkiye`: muhtemelen sunucuya ozel utility veya branding paketi
- `bob74_ipl`: IPL / interior loader
- `connectqueue`: baglanti sirasi yonetimi
- `cylex_animmenu`: animasyon menusu
- `cylex_garage`: garage yardimci sistemi
- `illenium-appearance`: karakter gorunumu / kiyafet sistemi
- `interact-sound`: ses tetikleme utility'si
- `LegacyFuel`: arac yakit sistemi
- `menuv`: menu kutuphanesi
- `ms-fpsbooster`: performans / optimizasyon yardimcisi
- `npc-control`: NPC yogunlugu kontrolu
- `oxmysql`: MariaDB / MySQL adaptor katmani
- `ox_lib`: utility, UI ve helper kutuphanesi
- `PolyZone`: bolge algilama kutuphanesi
- `progressbar`: ilerleme cubugu UI
- `ps-ui`: minigame / UI yardimcilari
- `quadro_bed`: yatak / dinlenme benzeri utility olabilir
- `radialmenu`: radial action menu
- `safecracker`: kasa kirma minigame
- `screenshot-basic`: screenshot utility
- `wais-hudv6`: HUD paketi
- `xsound`: ses sistemi utility'si

## `[voice]`

- `pma-voice`: ana ses sistemi
- `qb-radio`: telsiz / radyo sistemi

## `[defaultmaps]`

- `dealer_map`: varsayilan dealer map
- `hospital_map`: hastane map'i
- `[prison_map]`: hapishane map paketleri

## `[stream]`

`[stream]/[maps]` altindaki stream map paketleri:

- `hb_digitalden`
- `hb_perrera`
- `hb_pinkcage`

## `[mlo]`

Ozel interior / map paketleri:

- `alegria_bennys`
- `Bahama_Mamas`
- `fivem-ipl`
- `gabz_imp_garage`
- `int_jdmhub`
- `lks_hckrspc`
- `ls_custom5`
- `melanom_pier`
- `melanom_pier_high`
- `melanom_pier_mid`
- `paletosheriff`
- `paradise-club`
- `patoche_bridge`
- `SLBK11_MissionRow`

## `[cfx-default]`

FiveM ile gelen default manager/system/gameplay paketlerini icerir. Genelde:

- `mapmanager`
- `spawnmanager`
- `sessionmanager`
- `hardcap`
- `baseevents`
- `basic-gamemode`

gibi temel parcalari kapsar.

## AI ve ekip icin okuma tavsiyesi

Bir issue veya feature calisirken:

1. ilgili resource'i bu dosyadan bul
2. resource'in `fxmanifest.lua` dosyasini oku
3. sonra `server.lua`, `client.lua`, `config.lua` ve varsa `.sql` dosyasina gec
4. framework bagimliligini `[qb]` veya `[standalone]` tarafinda kontrol et
