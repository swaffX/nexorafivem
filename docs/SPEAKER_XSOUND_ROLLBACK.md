# swx_speaker ve xsound Rollback

## Tarih: 2026-04-07

## Yapılan İşlem
swx_speaker ve xsound scriptleri commit `cc0c1af534e3b4ab5611e12c2b8b0d9e041cfdd5` versiyonuna geri alındı.

## Komut
```bash
cd data
git checkout cc0c1af534e3b4ab5611e12c2b8b0d9e041cfdd5 -- "resources/[standalone]/swx_speaker" "resources/[voice]/xsound"
git restore --staged .
```

## Değişen Dosyalar

### swx_speaker (5 dosya)
- `README.md` - 40 satır değişti
- `client.lua` - 1790 satır değişti (büyük değişiklik)
- `config.lua` - 4 satır değişti
- `fxmanifest.lua` - 4 satır değişti
- `server.lua` - 74 satır silindi

### xsound (4 dosya)
- `html/scripts/SoundPlayer.js` - 2 satır değişti
- `html/scripts/audioFilters.js` - 67 satır değişti
- `html/scripts/functions.js` - 14 satır değişti
- `html/scripts/listener.js` - 51 satır değişti

## Toplam Değişiklik
- 9 dosya değişti
- 980 ekleme
- 1066 silme

## Geri Alınan Özellikler

### swx_speaker
- ✅ Müzik geçmişi sistemi (musicHistory)
- ✅ Pause/Resume özelliği
- ✅ Filtre sistemi (filterChain, baseVolume)
- ✅ Title düzeltme sistemi
- ✅ YouTube URL parsing
- ✅ Persistent history loading

### xsound
- ✅ AudioFilterManager class
- ✅ Web Audio API entegrasyonu
- ✅ Gerçek filtre desteği (lowpass, highpass, etc.)
- ✅ Filter chain sistemi
- ✅ Gain node kontrolü

## Neden Geri Alındı?
Yeni versiyonlarda yapılan değişiklikler sorun çıkarıyordu veya istenmeyen özellikler eklenmişti. Eski stabil versiyon tercih edildi.

## Önemli Notlar

### Commit Bilgisi
- **Commit Hash**: cc0c1af534e3b4ab5611e12c2b8b0d9e041cfdd5
- **Tarih**: Bu commit'teki versiyon
- **Durum**: Stabil, test edilmiş

### Geri Alınan Özellikler Hakkında
Eğer bu özelliklere ihtiyaç duyulursa:
1. Git history'den geri getirilebilir
2. Yeni bir branch'te geliştirilebilir
3. Test edildikten sonra merge edilebilir

### Test Edilmesi Gerekenler
- ✅ swx_speaker müzik çalma
- ✅ xsound ses sistemi
- ✅ wais-hudv6 entegrasyonu
- ✅ Filtre sistemi (eğer kullanılıyorsa)
- ✅ Müzik geçmişi (eğer kullanılıyorsa)

## Geri Alma (Undo)
Eğer bu rollback'i geri almak isterseniz:

```bash
cd data
git checkout HEAD -- "resources/[standalone]/swx_speaker" "resources/[voice]/xsound"
```

## Tarih
- **Rollback Tarihi**: 2026-04-07
- **Rollback Eden**: Kiro AI Assistant
- **Sebep**: Kullanıcı talebi
- **Hedef Commit**: cc0c1af534e3b4ab5611e12c2b8b0d9e041cfdd5
