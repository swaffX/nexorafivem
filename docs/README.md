# Nexora FiveM Docs

Bu klasor, projeye yeni katilan bir gelistirici veya baska bir AI modelinin repo'yu hizli anlamasi icin hazirlandi.

## Once bunu oku

1. `docs/AI_CONTEXT.md`
2. `docs/PROJECT_OVERVIEW.md`
3. `docs/RESOURCE_MAP.md`
4. `docs/DATABASE_AND_MARIADB.md`
5. `docs/OPERATIONS_AND_COMMANDS.md`

## Bu proje nedir?

Bu repo, QBCore tabanli bir FiveM roleplay sunucusunun kaynak dosyalarini tutar.

Ana bilesenler:

- `data/server.cfg`: Sunucu baslatma ve resource sirasi
- `data/resources/[qb]`: QBCore cekirdek ve temel islevler
- `data/resources/[alan]`: Sunucuya ozel veya uyarlanmis resource'lar
- `data/resources/[meslek]`: Meslek, mini-job ve ekstra gameplay paketleri
- `data/resources/[standalone]`: Framework disi bagimsiz araclar
- `data/resources/[voice]`: Ses ve radyo sistemi
- `temelpaket.sql`: Ana MariaDB dump dosyasi

## Onemli not

Repo'nun kanonik klasor yapisi `data/...` altindadir.

Canli VPS'te deploy sekli farkli olabilir. Ornegin bu projede canli sunucuda resource'lar `/home/fivem/resources/...` altinda calisiyor olabilir. Yani:

- Repo yolu: `data/resources/[qb]/qb-core`
- VPS calisan yol: `/home/fivem/resources/[qb]/qb-core`

Dokumanlari okurken bu iki layout'u karistirma.

## Dokuman amaci

Bu docs paketi su sorulari hizli cevaplamak icin yazildi:

- Proje hangi dosyalardan olusuyor?
- Resource'lar nasil gruplaniyor?
- Veritabani degisikligi nereye, nasil eklenir?
- MariaDB uzerinden tablo/kolon/seed nasil uygulanir?
- Hangi komut dosyalari operasyon icin kullaniliyor?
- Sunucuda hata oldugunda ilk nereye bakilir?

## Degisiklik yapmadan once

- `server.cfg`, gercek lisans anahtari ve baglanti string'lerini commit etme.
- Runtime cache, `txData`, `alpine`, log ve benzeri ortam dosyalarini commit etme.
- Yeni bir DB ihtiyaci varsa once `docs/DATABASE_AND_MARIADB.md` oku.
- Sunucuda calisan layout ile repo layout'unun birebir ayni olmadigini kontrol et.
