@echo off
color 0A
echo Detectando tipo de BIOS...
powershell -command "Confirm-SecureBootUEFI" | findstr "True"
if %errorlevel%==0 (
    msg * "Sistema UEFI detectado. Reiniciando para BIOS..."
    shutdown /r /fw /t 0
) else (
    powershell -command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Sistema BIOS legado detectado. Reinicializacao direta para BIOS nao suportada.', 'Erro', 'OK', 'Error')}"
    exit
)
