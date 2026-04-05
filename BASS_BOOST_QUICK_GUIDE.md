# 🎵 SWX Speaker - Bass Boost Quick Guide

## 🚀 How to Enable Bass Boost

### Step 1: Play Music
1. Get in a vehicle (driver seat)
2. Press **K** to open speaker menu
3. Select **"Müzik çal"**
4. Enter YouTube URL or direct audio file URL

### Step 2: Apply Bass Boost Filters
1. Go to **Diğer > Filtreler**
2. Select **"Yeni filtre ekle"**
3. Choose filter type:

#### For Powerful Bass 💥
```
Filter: Lowshelf (Alt Raf)
- Frequency: 150 Hz
- Gain: +15 dB
- Q: 0 (auto-calculated)
```

#### For Deep Sub-Bass 🔊
```
Filter: Peaking (Tepe Artırma)
- Frequency: 80 Hz
- Gain: +12 dB
- Q: 0 (auto-calculated)
```

#### For Premium Sound ✨
```
Add BOTH filters:
1. Lowshelf: 150 Hz, +8 dB
2. Highshelf: 8000 Hz, +6 dB
```

### Step 3: Combine Filters
You can add multiple filters! Recommended combinations:

**Hip-Hop Bass:**
- Lowshelf 150 Hz (+15 dB) + Peaking 80 Hz (+12 dB)

**Balanced Sound:**
- Lowshelf 200 Hz (+8 dB) + Highshelf 8000 Hz (+5 dB)

**Radio Effect:**
- Highpass 300 Hz (-30 dB) + Bandpass 2000 Hz (-15 dB)

## ⚙️ Filter Settings Guide

### Lowshelf (Best for Bass)
- **Frequency**: 100-300 Hz (lower = deeper bass)
- **Gain**: +5 to +20 dB (higher = more bass)
- **Q**: Auto-calculated based on gain
- **Effect**: Boosts all frequencies BELOW the set frequency

### Peaking (Targeted Boost)
- **Frequency**: 60-250 Hz for bass, 3000-8000 Hz for treble
- **Gain**: +5 to +15 dB (boost) or -5 to -15 dB (cut)
- **Q**: Auto-calculated (lower = wider band)
- **Effect**: Boosts a specific frequency range

### Highshelf (Treble Control)
- **Frequency**: 5000-10000 Hz (higher = more sparkle)
- **Gain**: +3 to +10 dB
- **Effect**: Boosts all frequencies ABOVE the set frequency

## 🎯 Quick Presets

### 🏎️ Car Audio Setup
```
1. Lowshelf: 150 Hz, +15 dB
2. Peaking: 80 Hz, +12 dB
Result: Feel the bass in your car!
```

### 🎧 Studio Quality
```
1. Lowshelf: 200 Hz, +8 dB
2. Highshelf: 8000 Hz, +6 dB
Result: Clear, premium sound
```

### 📻 Old Radio
```
1. Highpass: 300 Hz, -30 dB
2. Bandpass: 2000 Hz, -15 dB
Result: Vintage radio effect
```

### 🔇 Remove Bass (For Voice)
```
1. Highpass: 200 Hz, -20 dB
Result: Remove low frequencies
```

## ❌ Important Notes

### What Doesn't Work
- ❌ YouTube URLs (iframe limitation)
- ❌ Spotify links
- ❌ SoundCloud links

### What Works
- ✅ Direct MP3/WAV/OGG URLs
- ✅ Local audio files
- ✅ Audio streaming URLs

### Troubleshooting

**Filter not working?**
1. Wait a few seconds after playing music
2. Check console for errors
3. Try applying filter again

**Bass not strong enough?**
1. Increase Gain to +15 or +20 dB
2. Lower Frequency to 80-100 Hz
3. Add a second Peaking filter at 60 Hz

**Sound distorted?**
1. Reduce Gain to +10 dB or lower
2. Increase Frequency to 200+ Hz
3. Lower Q value (if manually set)

##  Bass Frequency Guide

| Frequency | Description | Best For |
|-----------|-------------|----------|
| 20-60 Hz | Sub-bass | Earthquake effect |
| 60-100 Hz | Deep bass | Powerful thump |
| 100-200 Hz | Bass | Most music bass |
| 200-300 Hz | Low mids | Warmth |
| 300+ Hz | Mids/Highs | Not bass |

## 🔧 Advanced Tips

### Layering Filters
Apply filters in this order:
1. **Lowshelf** (broad bass boost)
2. **Peaking** (targeted frequency boost)
3. **Highshelf** (treble enhancement)

### Fine-Tuning
- **Too boomy?** Increase frequency
- **Too weak?** Increase gain
- **Too narrow?** Lower Q value
- **Too broad?** Higher Q value

### Performance
- Each filter uses CPU resources
- Max recommended: 3-4 filters
- Remove unused filters

## 🎮 Menu Navigation

```
K → Ana Menü
  → Diğer
    → Filtreler
      → Yeni filtre ekle
        → Lowshelf (for bass)
        → Peaking (for bass/treble)
        → Highshelf (for treble)
```

## 📱 Console Commands (Debug)

Enable F8 console to see filter logs:
```
[xSound Filters] 🎵 BASS FILTER APPLIED: lowshelf | Freq: 150Hz | Gain: 15dB | Q: 2.0
[SWX Speaker] Filtre başarıyla uygulandı: LOWSHELF
```

---

**Made with ❤️ by Nexora RP**  
**Version**: 1.2.1 (Bass Boost Fix)
