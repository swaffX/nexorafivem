# YouTube Video İndirme Rehberi

Loading screen'de YouTube videosu göstermek için videoyu indirip yerel olarak kullanmanız gerekiyor.

## Video Bilgileri
- **YouTube URL:** https://www.youtube.com/watch?v=yz3VUMpdjfE
- **Hedef Dosya:** `data/resources/[exe-eklenti]/izzy_loading/video.mp4`

## İndirme Adımları

### Yöntem 1: yt-dlp (Önerilen)

1. **yt-dlp'yi indirin:**
   - Windows: https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe
   - İndirdiğiniz dosyayı `C:\Windows\` klasörüne koyun (veya PATH'e ekleyin)

2. **Komutu çalıştırın:**
   ```bash
   cd "C:\Users\zeyne\OneDrive\Masaüstü\nexorafivem\data\resources\[exe-eklenti]\izzy_loading"
   
   yt-dlp -f "bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[height<=1080][ext=mp4]" --merge-output-format mp4 -o "video.mp4" https://www.youtube.com/watch?v=yz3VUMpdjfE
   ```

3. **Alternatif (daha küçük dosya):**
   ```bash
   yt-dlp -f "bestvideo[height<=720][ext=mp4]+bestaudio[ext=m4a]/best[height<=720][ext=mp4]" --merge-output-format mp4 -o "video.mp4" https://www.youtube.com/watch?v=yz3VUMpdjfE
   ```

### Yöntem 2: Online İndirici

1. **Web sitesine gidin:**
   - https://y2mate.com/
   - https://savefrom.net/
   - https://yt1s.com/

2. **URL'yi yapıştırın:**
   ```
   https://www.youtube.com/watch?v=yz3VUMpdjfE
   ```

3. **Kalite seçin:**
   - 1080p MP4 (önerilen)
   - veya 720p MP4 (daha küçük dosya)

4. **İndirin ve yeniden adlandırın:**
   - İndirilen dosyayı `video.mp4` olarak yeniden adlandırın
   - `data/resources/[exe-eklenti]/izzy_loading/` klasörüne kopyalayın

### Yöntem 3: PowerShell ile yt-dlp

```powershell
# yt-dlp'yi indir
Invoke-WebRequest -Uri "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe" -OutFile "yt-dlp.exe"

# Videoyu indir
.\yt-dlp.exe -f "bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[height<=1080][ext=mp4]" --merge-output-format mp4 -o "video.mp4" https://www.youtube.com/watch?v=yz3VUMpdjfE

# Temizlik
Remove-Item "yt-dlp.exe"
```

## Video Özellikleri

İndirdiğiniz videonun şu özelliklere sahip olması önerilir:
- **Format:** MP4
- **Çözünürlük:** 1920x1080 (1080p) veya 1280x720 (720p)
- **Codec:** H.264
- **Boyut:** Tercihen 50MB altında (loading hızı için)

## Dosya Konumu

Video dosyası şu konumda olmalı:
```
data/resources/[exe-eklenti]/izzy_loading/video.mp4
```

## Test

1. Videoyu indirip doğru konuma koyun
2. FiveM sunucusunu yeniden başlatın
3. Oyuna bağlanın ve loading screen'i kontrol edin

## Sorun Giderme

### Video oynatılmıyor
- Dosya adının tam olarak `video.mp4` olduğundan emin olun
- Dosyanın doğru klasörde olduğunu kontrol edin
- Video codec'inin H.264 olduğunu doğrulayın

### Video çok büyük
- 720p kalitede indirin
- Video sıkıştırma aracı kullanın (HandBrake önerilir)

### Ses var
- Video zaten muted olarak oynatılıyor (HTML'de `muted` attribute'u var)
- Sorun yoksa ses duyulmaz

## Not

YouTube iframe embed'i FiveM loading screen'de çalışmaz çünkü:
- FiveM CEF (Chromium Embedded Framework) kısıtlamaları
- YouTube'un iframe politikaları
- Güvenlik nedenleriyle external content yüklenemez

Bu yüzden videoyu yerel olarak kullanmak zorundasınız.
