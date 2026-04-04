# Blip Audit - 2026-04-04

Bu not, blip sistemini merkezi ve tekrar edilebilir hale getirmek icin tutuldu.

## Tespit Edilen Sorunlar

- `mHud` icindeki kare minimap yerlesimi stabil degildi; kamera ve minimap maske yerlesimi kayma hissi uretiyordu.
- Map/MLO resource'larinin buyuk kismi kendi blipini uretmiyor.
- Bazi gameplay resource'lari blip uretiyor ama sadece kendi ana noktalarini kapsiyor; ek map binalari bos kaliyor.
- Ayni isi yapan birden fazla resource bir arada tutuldugunda blip ve marker karmaasina yol aciyor.

## Mevcut Resource'lardan Gelen Blipler

- `qb-policejob`: Mission Row, Prison, Paleto
- `qb-ambulancejob`: Pillbox
- `hb_motel`: Pinkcage Motel, Perrera Beach Motel
- `galer`: Vehicle shop, police shop, boat shop, aircraft shop
- `kaves_mechanic`: illegal mechanic noktasi

## Merkezi Olarak Eklenen Map Blipleri

- `LosSantosCustoms` -> `Burton Customs`
- `exemech5` -> `Benny's Customs`
- `VPD` -> `Vinewood Police Department`
- `hedwig_sheriff` -> `Sandy Shores Sheriff`
- `highwaypatrol` -> `SAHP Station`
- `fibv` -> `FIB Headquarters`

## Yuksek Guvenli Koordinatlar

- `Burton Customs`: `-337.43, -136.89, 39.01`
- `Benny's Customs`: `-205.73, -1307.17, 31.29`
- `Vinewood Police Department`: `640.25, 1.12, 82.79`
- `Sandy Shores Sheriff`: `1853.17, 3689.51, 34.27`
- `SAHP Station`: `826.80, -1290.00, 28.24`
- `FIB Headquarters`: `136.17, -761.76, 45.75`

## Bilerek Ayrica Ele Alinacaklar

- `malikane1`, `malikane3`, `malikane5`, `malikane7` gibi custom mansion resource'lari dosya tarafinda acik config koordinati vermiyor.
- Bu tip resource'larda coordinate'i tahmin etmek yerine oyun ici dogrulama ile ekleme yapmak daha guvenli.
- Sonraki turda bu mansion'lar icin tek tek oyun ici lokasyon teyidi alip ayri blip seti eklenmeli.

## Bundan Sonrasi Icin Kural

- Yeni bir script veya map eklenirken ayni isi yapan eski resource aktif auctan isim bazli cikarilacak.
- Yeni blip ihtiyaclari once merkezi resource'ta toplanacak.
- Dogrudan resource icine daigik blip eklemek yerine once merkezi blip kaydi kontrol edilecek.
