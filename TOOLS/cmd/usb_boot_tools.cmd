@echo off
setlocal

:: Create temporary instructions file
set instructionsFile=%TEMP%\usb_boot_tools.txt

:: Write the shortcut list to the instructions file
echo ╭────【 Formatar e criar unidades flash USB inicializáveis (softwares) > "%instructionsFile%"
echo • ventoy.net >> "%instructionsFile%"
echo • rufus.ie >> "%instructionsFile%"
echo • pendrivelinux.com/yumi-multiboot-usb-creator >> "%instructionsFile%"
echo. >> "%instructionsFile%"
echo ╭────【 Recomendação de vídeo >> "%instructionsFile%"
echo • youtu.be/Qrd4acipw3Q >> "%instructionsFile%"

:: Open instructions file
start notepad "%instructionsFile%"

endlocal
