# 🎧 Audio Filtre Rehberi - Nexora Speaker

## 📋 Filtre Tipleri ve İşlevleri

**Not**: xsound'un teknik limitleri nedeniyle filtreler şu an sadece UI gösterimi için çalışıyor. Gerçek audio filter için custom xsound fork gerekir.

---

## 🔹 Lowpass (Alçak Geçiren)

### Ne Yapar?
Yüksek frekansları keser, sadece bass ve orta sesleri bırakır.

### Efekt
Boğuk, kapalı bir ses - sanki kulaklarınız tıkalı gibi.

### Ne Zaman Kullanılır?
- 🚗 Araba camı kapalı hissi vermek
- 🎵 Uzaktan gelen müzik efekti
- 🏠 Duvar arkasından gelen ses

### Ayarlar
- **Frequency**: 500-2000 Hz (kesim noktası)
- **Gain**: -10 ile -40 dB (ne kadar kesilecek)

### Örnek Kullanım
```
Frequency: 800 Hz
Gain: -20 dB
Efekt: Araba camı kapalı, dışarıdan müzik duyuluyor
```

---

## 🔹 Highpass (Yüksek Geçiren)

### Ne Yapar?
Düşük frekansları (bass) keser, tizleri bırakır.

### Efekt
İnce, telefondan geliyormuş gibi ses.

### Ne Zaman Kullanılır?
- 📞 Radyo/telefon efekti
- 🏎️ Motor sesinden bass'ı ayırmak
- 🎙️ Vokal netliği artırmak

### Ayarlar
- **Frequency**: 200-1000 Hz (kesim noktası)
- **Gain**: -10 ile -40 dB

### Örnek Kullanım
```
Frequency: 300 Hz
Gain: -30 dB
Efekt: Telefon hoparlöründen gelen ses
```

---

## 🔹 Bandpass (Bant Geçiren)

### Ne Yapar?
Sadece belirli bir frekans aralığını geçirir.

### Efekt
Dar, filtrelenmiş bir ses (walkie-talkie gibi).

### Ne Zaman Kullanılır?
- 📻 Roleplay'de telsiz efekti
- 🔊 Eski hoparlör hissi
- 📡 Radyo yayını efekti

### Ayarlar
- **Frequency**: 1000-3000 Hz (merkez frekans)
- **Gain**: -5 ile -20 dB

### Örnek Kullanım
```
Frequency: 2000 Hz
Gain: -15 dB
Efekt: Polis telsizi
```

---

## 🔹 Notch (Bant Kesici)

### Ne Yapar?
Belirli bir frekansı keser, diğerlerini bırakır.

### Efekt
Belirli bir "rahatsız edici sesi" yok eder.

### Ne Zaman Kullanılır?
- 🔇 Cızırtı/feedback temizleme
- 🚗 Motor sesiyle çakışan frekansı silmek
- 🎵 İstenmeyen frekans temizleme

### Ayarlar
- **Frequency**: 500-5000 Hz (kesilecek frekans)
- **Gain**: -20 ile -40 dB

### Örnek Kullanım
```
Frequency: 1500 Hz
Gain: -30 dB
Efekt: Motor cızırtısı temizlendi
```

---

## 🔹 Peaking (Tepe Artırma/Azaltma)

### Ne Yapar?
Belirli frekansı yükseltir veya düşürür.

### Efekt
Bass boost veya tiz boost gibi.

### Ne Zaman Kullanılır?
- 🔥 Bass artırmak (arabada çok kullanılır)
- 🎤 Vocal netliği artırmak
- 🎸 Enstrüman vurgulama

### Ayarlar
- **Frequency**: 60-8000 Hz (hangi frekans)
- **Gain**: -20 ile +20 dB (artır/azalt)

### Örnek Kullanım
```
Frequency: 80 Hz
Gain: +15 dB
Efekt: Güçlü bass boost 🔊
```

---

## 🔹 Lowshelf (Alt Raf)

### Ne Yapar?
Belirli frekansın altını komple artırır veya azaltır.

### Efekt
Tüm bassları yükseltir.

### Ne Zaman Kullanılır?
- 🔊 Subwoofer efekti
- 🚗 Arabada "basslı müzik" hissi
- 🎵 Hip-hop/EDM müzik için

### Ayarlar
- **Frequency**: 100-500 Hz (hangi frekansın altı)
- **Gain**: -10 ile +20 dB

### Örnek Kullanım
```
Frequency: 200 Hz
Gain: +12 dB
Efekt: Tüm basslar güçlendirildi 💥
```

---

## 🔹 Highshelf (Üst Raf)

### Ne Yapar?
Belirli frekansın üstünü artırır/azaltır.

### Efekt
Parlaklık / tiz artışı.

### Ne Zaman Kullanılır?
- ✨ Müziği daha "net" yapmak
- 🎵 Kalite hissi artırmak
- 🎤 Vokal parlaklığı

### Ayarlar
- **Frequency**: 5000-10000 Hz (hangi frekansın üstü)
- **Gain**: -10 ile +15 dB

### Örnek Kullanım
```
Frequency: 8000 Hz
Gain: +8 dB
Efekt: Kristal netliğinde ses ✨
```

---

## 🔹 Allpass (Tüm Geçiren)

### Ne Yapar?
Frekansları kesmez ama faz değiştirir.

### Efekt
Genelde direkt fark edilmez.

### Ne Zaman Kullanılır?
- 🎚️ Gelişmiş ses efektleri (echo, reverb altyapısı)
- 🎵 Faz düzeltme
- 🔊 Çok gerekmez genelde

### Ayarlar
- **Frequency**: 1000-5000 Hz
- **Detune**: -4800 ile +4800 cents

### Örnek Kullanım
```
Frequency: 2000 Hz
Detune: 100 cents
Efekt: Hafif faz kayması (echo altyapısı)
```

---

## 🚗 FiveM İçin Pratik Kombinasyonlar

### 1. Basslı Müzik (Hip-Hop/EDM)
```
Lowshelf:
  Frequency: 200 Hz
  Gain: +15 dB

Peaking:
  Frequency: 80 Hz
  Gain: +12 dB

Efekt: Güçlü bass, arabada hissedilir 🔊
```

### 2. Dışarıdan Duyulma Efekti
```
Lowpass:
  Frequency: 800 Hz
  Gain: -25 dB

Efekt: Araba camı kapalı, uzaktan müzik 🚗
```

### 3. Radyo Efekti
```
Highpass:
  Frequency: 300 Hz
  Gain: -30 dB

Bandpass:
  Frequency: 2000 Hz
  Gain: -15 dB

Efekt: Eski radyo yayını 📻
```

### 4. Kaliteli Ses (Lüks Araba)
```
Highshelf:
  Frequency: 8000 Hz
  Gain: +6 dB

Lowshelf:
  Frequency: 150 Hz
  Gain: +8 dB

Efekt: Premium ses sistemi ✨
```

### 5. Telsiz Efekti (Polis RP)
```
Bandpass:
  Frequency: 2500 Hz
  Gain: -20 dB

Highpass:
  Frequency: 400 Hz
  Gain: -25 dB

Efekt: Polis telsizi 👮
```

---

## 📊 Frekans Referans Tablosu

| Frekans Aralığı | Ses Karakteri | Örnek |
|-----------------|---------------|-------|
| 20-60 Hz | Sub-bass | Kick drum, bas gitar |
| 60-250 Hz | Bass | Bas enstrümanlar |
| 250-500 Hz | Düşük orta | Erkek vokal, gitar |
| 500-2000 Hz | Orta | Vokal, piyano |
| 2000-4000 Hz | Yüksek orta | Vokal netliği |
| 4000-8000 Hz | Presence | Vokal parlaklığı |
| 8000-20000 Hz | Brilliance | Zil, hava, detay |

---

## ⚠️ Önemli Notlar

### xsound Limitleri
- xsound gerçek audio filter API'si sunmuyor
- Sadece volume kontrolü mevcut
- Gerçek filter için custom fork gerekir

### Alternatif Çözümler
1. **Custom xsound Fork**: Web Audio API ile gerçek filtreler
2. **Farklı Ses Sistemi**: Howler.js, Tone.js gibi
3. **NUI Audio**: HTML5 Audio API kullanımı

### Gelecek Planlar
- Custom xsound fork geliştirme
- Gerçek audio filter implementasyonu
- Preset sistemi (Rock, Pop, Jazz, vb.)

---

## 🎯 Sonuç

Filtreler şu an sadece UI gösterimi için çalışıyor. Gerçek audio efektleri için:
- Custom xsound modifikasyonu gerekir
- Veya farklı bir ses sistemi kullanılmalı
- Web Audio API entegrasyonu yapılmalı

**Mevcut Durum**: Filtreler kaydediliyor ama ses üzerinde değişiklik yapmıyor (ses bozulmasını önlemek için).

---

**Hazırlayan**: Nexora RP Team  
**Tarih**: 2026-04-05  
**Versiyon**: 1.2.0
