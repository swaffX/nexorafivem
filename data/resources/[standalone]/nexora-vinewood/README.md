# Nexora Vinewood Sign Changer

Vinewood tepesindeki büyük yazıyı değiştirmenizi sağlayan basit bir script.

## Özellikler

- `/vinewood` komutu ile yazıyı değiştirme
- Admin/God yetkisi kontrolü
- QBCore entegrasyonu
- Maksimum 8 karakter
- Tüm oyunculara senkronize
- 3D text rendering

## Kurulum

1. `nexora-vinewood` klasörünü `resources/[standalone]/` içine kopyalayın
2. `server.cfg` dosyanıza şu satırı ekleyin:
   ```
   ensure nexora-vinewood
   ```
3. Sunucuyu yeniden başlatın

## Kullanım

### Yazıyı Değiştirme
```
/vinewood
```
Komutu kullandığınızda bir input dialog açılır. Yeni yazıyı girin (max 8 karakter).

### Yazıyı Sıfırlama
```
/vinewood_reset
```
Yazıyı varsayılan "VINEWOOD" değerine döndürür.

## Yetkilendirme

`config.lua` dosyasında yetkili grupları düzenleyebilirsiniz:

```lua
Config.AuthorizedGroups = {
    'god',
    'admin'
}
```

## Bağımlılıklar

- QBCore Framework
- ox_lib (input dialog için)

## Notlar

- Yazı tüm oyunculara otomatik olarak senkronize edilir
- Sunucu yeniden başlatıldığında yazı varsayılan değere döner
- Gelecekte database entegrasyonu eklenebilir

## Yapımcılar

- swaffdev
- oguzxdev

## Lisans

MIT License
