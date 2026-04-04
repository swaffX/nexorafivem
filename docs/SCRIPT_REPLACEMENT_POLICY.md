# Script Replacement Policy

Bu sunucuda yeni bir script eklenirken ayni isi yapan eski script aktif resource agacinda birakilmaz.

Kurallar:
- Yeni script eklenmeden once ayni gorevi yapan eski scriptler isimleriyle tespit edilir.
- Eski script klasoru exact resource adi ile aktif agactan kaldirilir; sadece `stop` etmek yeterli sayilmaz.
- Eski script aktif klasorden kaldirilir ve yedek klasore tasinir.
- `server.cfg` sirasi yeni bagimliliklara gore guncellenir.
- SQL gerekiyorsa yeni scriptin SQL'i uygulanmadan deploy tamamlanmis sayilmaz.
- Restart ve test notunda "eski kaldirildi / yeni eklendi" listesi acikca yazilir.

Bu politika ozellikle su alanlarda zorunludur:
- multicharacter / spawn / loading
- inventory / appearance / radialmenu
- vehicle shop / garage / mechanic
- emote / carry / interaction

Amac:
- cift event zinciri olusmamasi
- ayni anda iki UI'nin calismamasi
- eski configlerin yeni scripti etkilememesi
- hata ayiklamayi kolaylastirmak
