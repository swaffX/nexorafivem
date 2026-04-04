# AI Context

Bu dosya, repo'ya ilk kez bakan bir model icin hizli baglam ozetidir.

## One-line summary

Bu repo, QBCore tabanli bir FiveM RP sunucusunun kaynaklarini, SQL dump'ini ve operasyon dosyalarini tutar.

## Ana teknoloji yiginlari

- FiveM
- Lua
- QBCore
- oxmysql / MariaDB
- NUI tabanli HTML/CSS/JS arayuzleri
- txAdmin ile operasyon

## Repo kok yapisi

- `data/`: Sunucuya deploy edilen ana icerik
- `data/resources/`: FiveM resource klasorleri
- `temelpaket.sql`: Ana DB dump
- `txData/`: Yerel/yardimci txAdmin verileri olabilir, runtime veri gibi dusun
- `docs/`: Ekip ve AI icin proje rehberleri

## Resource gruplari

- `[qb]`: QBCore cekirdegi ve temel sunucu mekanikleri
- `[alan]`: Sunucuya ozel sistemler
- `[meslek]`: Ek gameplay ve meslek paketleri
- `[standalone]`: Bagimsiz kutuphaneler ve yardimci resource'lar
- `[voice]`: Ses sistemi
- `[stream]`, `[mlo]`, `[defaultmaps]`: Harita ve stream icerikleri

## En onemli dosyalar

- `data/server.cfg`
- `data/clear_cache.bat`
- `data/restart_resources.cfg`
- `temelpaket.sql`
- `data/resources/[qb]/qb-core/server/commands.lua`
- `data/resources/[alan]/high_phone/server/bank.lua`
- `data/resources/[alan]/hb_mechanic/server/sv_bennys.lua`
- `data/resources/[qb]/qb-management/server/sv_accounts.lua`

## Onemli is akislari

### Oyuncu karakter akisi

- `hb_multicharacter` karakter secimi ve logout akislarini yonetir.
- QBCore `players` tablosu temel oyuncu kaydini tutar.

### Arac akisi

- `player_vehicles` tablosu sahiplik, mod, plate ve finans bilgisini tutar.
- `hb_mechanic` arac mod/repair akisini yonetir.

### Telefon / fatura akisi

- `high_phone` telefon ve fatura sistemini yonetir.
- `phone_invoices` tablosuna kayit atar.
- Odeme sonrasi `qb-bossmenu:server:addAccountMoneyScript` event'i ile is yeri hesabina para aktarabilir.

### Is yeri fonu akisi

- `qb-management` is yeri / boss menu tarafidir.
- Bu repoda eklenen `sv_accounts.lua`, `management_funds` tablosunu ve eksik export uyumlulugunu saglar.

## Veritabani hakkinda hizli notlar

- Ana dump dosyasi: `temelpaket.sql`
- Resource'e ozel SQL dosyalari da vardir:
  - `data/resources/[alan]/high_phone/high_phone.sql`
  - `data/resources/[alan]/hb_motel/hb_motel.sql`
- Her DB degisikligi icin:
  1. Schema degisikligini yaz
  2. Resource kodunu guncelle
  3. MariaDB uzerinde uygula
  4. Sunucuyu veya ilgili resource'u dogrula

## Operasyon gercegi

Yerel repo `data/...` altinda organize edilmis olabilir ama canli VPS bu dosyalari dogrudan `/home/fivem/...` altina acmis olabilir.

Bu nedenle bir AI model her zaman sunlari ayirmalidir:

- source-of-truth repo yolu
- canli sunucudaki deploy yolu

## Guvenlik ve commit kurali

- Gercek `server.cfg` gizli bilgi icerebilir.
- Cache, txAdmin runtime, logs ve artifacts commit edilmemeli.
- DB sifreleri, CFX lisansi ve production kimlik bilgileri docs'a duz metin olarak yazilmamali.

## Yeni bir AI model ne yapmali?

1. `docs/PROJECT_OVERVIEW.md` oku
2. Sonra `docs/DATABASE_AND_MARIADB.md` oku
3. Sorun bir resource ile ilgiliyse once ilgili `fxmanifest.lua`, sonra `server.lua` ve `client.lua` dosyalarina bak
4. Production sorunu varsa local repo ve VPS layout farkini kontrol et
