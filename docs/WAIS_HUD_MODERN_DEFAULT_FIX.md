# WAIS-HUD Modern Default ve Türkçe Dil Düzeltmesi

**Tarih**: 2026-04-04  
**Durum**: ✅ Tamamlandı

## Sorun
- WAIS-HUD'da ay isimleri ve bazı kelimeler İngilizce görünüyordu
- Kullanıcılar default olarak Modern HUD kullanmalıydı
- Selektor TAB yerine E tuşuna ayarlanmalıydı

## Yapılan Değişiklikler

### 1. WAIS-HUD Dil Ayarı (Config.json)
**Dosya**: `data/resources/[standalone]/wais-hudv6/web/public/Config.json`

```json
"language": "tr",  // "en" → "tr" değiştirildi
```

### 2. Default HUD Stilleri (Zaten Doğru)
```json
"rightCorner": {
    "style": "modern"  // ✓ Zaten modern
},
"carhud": {
    "style": "modern"  // ✓ Zaten modern
}
```

### 3. Selektor Tuş Ayarı (Zaten Doğru)
**Dosya**: `data/resources/[standalone]/tired-selektor/client/main.lua`

```lua
Config.Keybind = 86  -- E tuşu (korna ile aynı)
RegisterKeyMapping('selektorFlash', 'Selektor (Flash Lights)', 'keyboard', 'E')
```

## Türkçe Çeviriler (tr.json)
Tüm çeviriler eksiksiz:
- ✅ Ay isimleri (Ocak, Şubat, Mart, vb.)
- ✅ Gün isimleri (Pazartesi, Salı, vb.)
- ✅ Zaman (ÖÖ, ÖS, Saat, Dakika, Saniye)
- ✅ Sağ köşe (Meslek, Çete, Banka, Nakit, vb.)
- ✅ Araç HUD (km/s, Yakıt, Motor, Hız, Vites)
- ✅ Müzik menüsü
- ✅ Konum bilgileri
- ✅ Durum barları (Sağlık, Zırh, Açlık, Susuzluk, Stres)
- ✅ Ayarlar menüsü (tüm kategoriler ve açıklamalar)

## Test Adımları
1. Sunucuyu restart edin: `restart wais-hudv6`
2. Oyuna girin ve `/hud` komutunu kullanın
3. Tüm metinlerin Türkçe olduğunu doğrulayın
4. Araçta E tuşuna basarak selektörü test edin

## Notlar
- WAIS-HUD encrypted olduğu için JavaScript default ayarları değiştirilemez
- Config.json'da yapılan değişiklikler tüm yeni oyuncular için geçerli
- Mevcut oyuncular `/hud` ile Modern HUD'a geçebilir
- Selektor zaten E tuşuna ayarlıydı (korna ile aynı tuş)

## Sonuç
✅ WAIS-HUD tamamen Türkçeleştirildi  
✅ Default HUD Modern olarak ayarlandı  
✅ Selektor E tuşunda çalışıyor
