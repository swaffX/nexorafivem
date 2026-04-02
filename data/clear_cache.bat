@echo off
echo FiveM Cache Temizleniyor...
echo.

REM Cache klasorunu temizle
if exist "cache\files" (
    echo Cache/files klasoru temizleniyor...
    rmdir /s /q "cache\files"
    mkdir "cache\files"
    echo Cache/files temizlendi!
) else (
    echo Cache/files klasoru bulunamadi.
)

echo.
echo Cache temizleme tamamlandi!
echo Sunucuyu yeniden baslatabilirsiniz.
echo.
pause
