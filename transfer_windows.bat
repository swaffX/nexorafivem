@echo off
echo ===================================
echo FiveM VPS Transfer - Windows
echo ===================================
echo VPS IP: 194.105.5.37
echo Kullanici: root
echo.
echo Transfer basliyor...
echo.

REM SCP komutu varsa kullan
where scp >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [1/4] Data klasoru aktariliyor...
    scp -r data root@194.105.5.37:~/fivem-server/
    
    echo [2/4] txData klasoru aktariliyor...
    scp -r txData root@194.105.5.37:~/fivem-server/
    
    echo [3/4] SQL dosyasi aktariliyor...
    scp temelpaket.sql root@194.105.5.37:~/
    
    echo [4/4] Setup script aktariliyor...
    scp vps_setup.sh root@194.105.5.37:~/
    
    echo.
    echo ===================================
    echo Transfer Tamamlandi!
    echo ===================================
    echo.
    echo Simdi VPS'e baglanin:
    echo   ssh root@194.105.5.37
    echo.
    echo VPS'te kurulum icin:
    echo   bash ~/vps_setup.sh
    echo.
) else (
    echo HATA: SCP bulunamadi!
    echo.
    echo Lutfen asagidaki yontemlerden birini kullanin:
    echo.
    echo 1. Git Bash yukleyin ve transfer_to_vps.sh calistirin
    echo 2. WinSCP kullanin (GUI)
    echo 3. PowerShell'de: bash transfer_to_vps.sh
    echo.
    echo Detayli rehber: VPS_TRANSFER_GUIDE.md
)

pause
