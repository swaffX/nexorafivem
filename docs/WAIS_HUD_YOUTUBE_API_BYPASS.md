# WAIS-HUD YouTube API Bypass (xsound Kullanımı)

**Tarih**: 2026-04-06  
**Durum**: ✅ Tamamlandı

## Sorun

WAIS-HUD'ın JavaScript'i YouTube API kullanmaya çalışıyordu:
```
Error fetching video data: [object Object]
Cannot set properties of null (setting 'play')
```

## Çözüm

WAIS-HUD'ın standart NUI callback'lerini (`playMusic`, `stopMusic`, vb.) override ettik ve xsound'a yönlendirdik.

## Değişiklikler

### 1. NUI Callback Override

**Önceki**: `wais:playMusic` (custom callback)  
**Yeni**: `playMusic` (WAIS-HUD'ın kendi callback'i)

```lua
RegisterNUICallback('playMusic', function(data, cb)
    local url = data.url or data.videoUrl
    
    -- xsound ile çal
    exports.xsound:PlayUrlPos(currentMusicId, url, volume, coords, false)
    
    -- Fake YouTube response gönder
    cb({ 
        success = true,
        videoData = {
            title = "xsound Music Player",
            duration = 0,
            thumbnail = ""
        }
    })
end)
```

### 2. Fake YouTube API Response

WAIS-HUD YouTube video bilgisi bekliyor, fake data gönderiyoruz:

```lua
RegisterNUICallback('getVideoData', function(data, cb)
    cb({ 
        success = true,
        videoData = {
            title = "xsound Music Player",
            duration = 0,
            thumbnail = "",
            author = "Nexora RP"
        }
    })
end)
```

### 3. Tüm Callback'ler Override Edildi

```lua
playMusic      -- YouTube API yerine xsound
stopMusic      -- xsound:Destroy
pauseMusic     -- xsound:Pause
resumeMusic    -- xsound:Resume
setVolume      -- xsound:setVolume
setBass        -- xsound:setBassGain (custom)
getVideoData   -- Fake response
getMusicStatus -- xsound durumu
```

## Nasıl Çalışıyor?

### 1. WAIS-HUD UI
- Kullanıcı M tuşuna basar
- Müzik sekmesine tıklar
- YouTube URL girer
- "Oynat" butonuna tıklar

### 2. NUI Callback
- WAIS-HUD JavaScript'i `playMusic` callback'ini çağırır
- Bizim Lua kodumuza gelir

### 3. xsound Çalıştırma
- URL'yi xsound'a gönderir
- Araçtaysa herkes duyar (30m)
- Yayaysa sadece kendisi duyar

### 4. Fake Response
- WAIS-HUD'a başarılı yanıt gönderilir
- YouTube API hatası almaz
- UI normal çalışır

## Avantajlar

### YouTube API Kullanmıyoruz
- ✅ API key gerektirmez
- ✅ Rate limit yok
- ✅ Daha hızlı
- ✅ Daha stabil

### xsound Kullanıyoruz
- ✅ Herkes duyabiliyor (araçta)
- ✅ Mesafe bazlı ses
- ✅ Bass kontrolü
- ✅ Daha iyi performans

### WAIS-HUD UI Korunuyor
- ✅ Aynı menü
- ✅ Aynı kontroller
- ✅ Kullanıcı farkı görmez

## Test Adımları

1. Sunucuyu restart et:
```bash
restart wais-hudv6
```

2. Oyuna gir ve M tuşuna bas
3. Müzik sekmesine tıkla
4. YouTube URL gir
5. Oynat butonuna tıkla
6. Hata almamalı, müzik çalmalı

## Teknik Detaylar

### Callback İsimleri
WAIS-HUD'ın encrypted JavaScript'i şu callback'leri çağırır:
- `playMusic` (bizim override ettiğimiz)
- `stopMusic`
- `pauseMusic`
- `resumeMusic`
- `setVolume`
- `getVideoData` (fake response)

### xsound Fonksiyonları
```lua
exports.xsound:PlayUrlPos(id, url, volume, coords, loop)
exports.xsound:PlayUrl(id, url, volume, loop)
exports.xsound:Pause(id)
exports.xsound:Resume(id)
exports.xsound:Destroy(id)
exports.xsound:setVolume(id, volume)
exports.xsound:setBassGain(id, gain)
exports.xsound:Distance(id, distance)
exports.xsound:Position(id, coords)
```

## Sınırlamalar

### YouTube Video Bilgisi Yok
- Şarkı adı gösterilmez
- Thumbnail gösterilmez
- Süre gösterilmez

**Çözüm**: Fake data gösteriyoruz ("xsound Music Player")

### Playlist Sistemi Yok
- Sonraki/önceki şarkı çalışmaz
- Geçmiş şarkılar kaydedilmez

**Gelecek**: Database ile playlist sistemi eklenebilir

## Sonuç

✅ YouTube API hatası düzeltildi  
✅ xsound ile müzik çalıyor  
✅ WAIS-HUD UI normal çalışıyor  
✅ Herkes duyabiliyor (araçta)  
✅ Bass kontrolü çalışıyor

WAIS-HUD artık YouTube API yerine xsound kullanıyor!
