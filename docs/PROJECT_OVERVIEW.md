# Project Overview

## 1. Genel ozet

Bu proje, QBCore tabanli bir FiveM roleplay sunucusudur. Repo; framework resource'lari, ozel gameplay paketleri, NUI arayuzleri, SQL dump'lari ve operasyon dosyalarini birlikte tutar.

Calisma mantigi:

1. `server.cfg` sunucuyu ve resource siralarini baslatir.
2. `qb-core` yuklenir.
3. QBCore'a bagli resource gruplari sirayla ayaga kalkar.
4. MariaDB uzerindeki `temelpaket` veritabani oyun state'ini besler.

## 2. Klasor haritasi

### Repo kok

- `data/`: deploy edilen ana sunucu icerigi
- `temelpaket.sql`: ana veritabani dump'i
- `txData/`: yardimci txAdmin verileri veya export edilmis runtime icerikleri
- `docs/`: ekip ve AI dokumani

### `data/` altindaki ana dosyalar

- `server.cfg`: temel FiveM config
- `server.cfg.example`: ornek veya kopya config
- `clear_cache.bat`: Windows cache temizleme yardimcisi
- `restart_resources.cfg`: konsoldan toplu restart yardimcisi
- `resources/`: tum resource'lar

## 3. Resource gruplari ve rolleri

### `[qb]`

Framework'un omurgasi.

Baslica paketler:

- `qb-core`: oyuncu, komut, job/gang state ve framework API
- `qb-inventory`: inventory sistemi
- `qb-management`: boss menu ve isyeri yonetimi
- `qb-policejob`, `qb-ambulancejob`: resmi meslekler
- `qb-target`, `qb-input`, `qb-menu`: etkilesim ve UI altyapisi
- `qb-vehiclekeys`, `qb-weathersync`, `qb-weapons`: yardimci gameplay modulleri

### `[alan]`

Sunucuya ozel sistemler ve uyarlamalar.

Baslica paketler:

- `hb_multicharacter`: karakter secimi
- `hb_mechanic`: mekanik / bennys mod ve tamir sistemi
- `hb_vehicleshop`: arac magazasi
- `high_phone`: telefon, fatura, mesajlasma, banka akislari
- `svdden_banking`: banka UI ve hesap hareketleri
- `hb_motel`: motel kiralama
- `hb_miner`, `hb_farming`: meslek benzeri ozel gameplay
- `alanNotify`: bildirim arayuzu

### `[meslek]`

Ek job ve mini gameplay paketleri.

Ornekler:

- `ak4y-advancedFishing`
- `qb-carwash`
- `tgiann-aracparcalama`
- `wais-jobpack`
- `quadro_*` paketleri
- `dpemotes`

### `[standalone]`

Framework disi ama diger resource'larin baglandigi kutuphaneler.

Tipik ornekler:

- `ox_lib`
- `oxmysql`
- diger NUI veya utility resource'lar

### `[voice]`

- `pma-voice`
- `qb-radio`

### Harita ve stream gruplari

- `[mlo]`
- `[stream]`
- `[defaultmaps]`

Bu gruplar map, interior, ymap, ydr ve benzeri stream iceriklerini saglar.

## 4. Baslatma sirasi

`data/server.cfg` dosyasina gore genel sira su mantikla ilerler:

1. FiveM default manager/resource'lari
2. `ox_lib`
3. `qb-core`
4. `[alan]`
5. `[qb]`
6. `[standalone]`
7. `[voice]`
8. `[defaultmaps]`
9. `[stream]`

Not:

- QBCore ve kutuphane resource'lari gec yuklenirse `No such export` veya `nil value` tarzinda hatalar cikabilir.
- Production layout repo ile birebir ayni olmayabilir; deploy yolu ayrica kontrol edilmelidir.

## 5. Onemli is akislarinin teknik ozeti

### Karakter secimi

- `hb_multicharacter` karakter secimi ve logout akislarini yonetir.
- `logout` ve `closeNUI` komutlari burada tanimlidir.

### Oyuncu state

- `players` tablosu oyuncunun para, karakter, job, gang, metadata ve ekstra telefon alanlarini tutar.
- `qb-core` oyuncu save / load akislarinin merkezi noktasi gibidir.

### Arac sahipligi ve modlama

- `player_vehicles` tablosu arac kayitlarini tutar.
- `hb_mechanic` tamir ve mod odemelerini oyuncudan alir.
- Bu odemeler `qb-management` tarafindaki isyeri fonuna aktarilmak istenir.

### Telefon ve fatura

- `high_phone` kendi SQL tablolarina dayanir.
- `phone_invoices` uzerinden fatura olusur.
- Fatura odendiginde oyuncudan banka parasini dusup isyeri hesabina aktarmaya calisir.

### Is yeri hesabi ve boss funds

- Bu repo'ya eklenen `qb-management/server/sv_accounts.lua`, `management_funds` tablosunu otomatik olusturur ve eksik export uyumlulugunu saglar.
- Boylece `hb_mechanic` gibi scriptler `exports['qb-management']:AddMoney(...)` kullanabilir.

## 6. Veritabani katmanlari

Bu projede DB kaynaklari birden fazla yerden gelir:

- `temelpaket.sql`: ana dump
- `high_phone.sql`: telefon tablolari
- `hb_motel.sql`: motel tablolari
- runtime tarafinda kodun kendi olusturdugu tablolar
  - ornek: `management_funds`

## 7. Bilinmesi gereken operasyon farki

Local repo:

- `data/resources/[qb]/qb-core`

Canli VPS'te aktif deployment:

- `/home/fivem/resources/[qb]/qb-core`

Yani bir degisiklik once repo'da yapilir, sonra deploy layout'una uygun sekilde sunucuya uygulanir.

## 8. Yeni gelen biri icin hizli onboarding

1. `server.cfg` oku
2. `[qb]` ve `[alan]` klasor listesine bak
3. `temelpaket.sql` ana tablolarini incele
4. Sorunlu resource varsa onun `fxmanifest.lua`, `server.lua`, `client.lua` ve varsa `.sql` dosyasini birlikte incele
5. Production issue varsa sunucudaki aktif layout'un repo ile ayni olup olmadigini kontrol et
