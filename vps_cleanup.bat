@echo off
REM =====================================================
REM VPS Temizleme Scripti (Windows)
REM Nexora FiveM Server - Manuel Silme İşlemleri
REM =====================================================

echo ==========================================
echo   NEXORA FIVEM - VPS TEMİZLEME SCRİPTİ
echo ==========================================
echo.

REM Sunucu dizini
set SERVER_DIR=C:\FXServer\server-data

echo Sunucu dizini: %SERVER_DIR%
echo.

echo ==========================================
echo   SİLİNECEK DOSYALAR VE KLASÖRLER
echo ==========================================
echo.

REM qb-inventory (ox_inventory ile değiştirildi)
echo 1. qb-inventory kaldırılıyor...
if exist "%SERVER_DIR%\resources\[qb]\qb-inventory" (
    echo [SİLİNİYOR] qb-inventory
    rmdir /s /q "%SERVER_DIR%\resources\[qb]\qb-inventory"
    echo [OK] Silindi
) else (
    echo [ATLA] qb-inventory (zaten yok)
)
echo.

REM qb-shops (ox_inventory shops ile değiştirildi)
echo 2. qb-shops kaldırılıyor...
if exist "%SERVER_DIR%\resources\[qb]\qb-shops" (
    echo [SİLİNİYOR] qb-shops
    rmdir /s /q "%SERVER_DIR%\resources\[qb]\qb-shops"
    echo [OK] Silindi
) else (
    echo [ATLA] qb-shops (zaten yok)
)
echo.

REM 0r-mechanic (qb-customs ile değiştirildi)
echo 3. 0r-mechanic kaldırılıyor...
if exist "%SERVER_DIR%\resources\[meslek]\[legal]\0r-mechanic" (
    echo [SİLİNİYOR] 0r-mechanic
    rmdir /s /q "%SERVER_DIR%\resources\[meslek]\[legal]\0r-mechanic"
    echo [OK] Silindi
) else (
    echo [ATLA] 0r-mechanic (zaten yok)
)
echo.

REM simple-mechanic (qb-customs ile değiştirildi)
echo 4. simple-mechanic kaldırılıyor...
if exist "%SERVER_DIR%\resources\[meslek]\[legal]\simple-mechanic" (
    echo [SİLİNİYOR] simple-mechanic
    rmdir /s /q "%SERVER_DIR%\resources\[meslek]\[legal]\simple-mechanic"
    echo [OK] Silindi
) else (
    echo [ATLA] simple-mechanic (zaten yok)
)
echo.

REM Eski WAIS-HUD dosyaları
echo 5. Eski WAIS-HUD dosyaları temizleniyor...
if exist "%SERVER_DIR%\resources\[standalone]\wais-hudv6\web\public\logo_remover.js" (
    echo [SİLİNİYOR] logo_remover.js
    del /f /q "%SERVER_DIR%\resources\[standalone]\wais-hudv6\web\public\logo_remover.js"
    echo [OK] Silindi
) else (
    echo [ATLA] logo_remover.js (zaten yok)
)

if exist "%SERVER_DIR%\resources\[standalone]\wais-hudv6\client\money_sync.lua" (
    echo [SİLİNİYOR] money_sync.lua
    del /f /q "%SERVER_DIR%\resources\[standalone]\wais-hudv6\client\money_sync.lua"
    echo [OK] Silindi
) else (
    echo [ATLA] money_sync.lua (zaten yok)
)
echo.

REM qb-inventory bridge
echo 6. Eski qb-inventory bridge temizleniyor...
if exist "%SERVER_DIR%\resources\[qb]\qb-inventory\client\hud_bridge.lua" (
    echo [SİLİNİYOR] hud_bridge.lua
    del /f /q "%SERVER_DIR%\resources\[qb]\qb-inventory\client\hud_bridge.lua"
    echo [OK] Silindi
) else (
    echo [ATLA] hud_bridge.lua (zaten yok)
)
echo.

echo ==========================================
echo   GİT PULL İŞLEMİ
echo ==========================================
echo.

cd /d "%SERVER_DIR%"

echo Git durumu kontrol ediliyor...
git status

echo.
echo Git pull yapılıyor...
git pull

echo.
echo ==========================================
echo   TEMİZLEME TAMAMLANDI
echo ==========================================
echo.
echo [OK] Tüm gereksiz dosyalar silindi
echo [OK] Git pull tamamlandı
echo.
echo UYARI: Sunucuyu restart etmeyi unutma!
echo.

pause
