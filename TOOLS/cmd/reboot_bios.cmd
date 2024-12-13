@echo off
color 0A

rem Verifica se o script está sendo executado como administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo Solicitando permissao de administrador...
    goto elevate
) else (
    goto runScript
)

:elevate
rem Reexecuta o script com permissões de administrador
cd /d "%~dp0"
powershell -Command "Start-Process '%~s0' -Verb RunAs"
exit /b

:runScript
rem Muda para o diretório correto
cd /d "%~dp0"

echo Detectando tipo de BIOS...
powershell -command "Confirm-SecureBootUEFI" | findstr "True"
if %errorlevel%==0 (
    msg * "Sistema UEFI detectado. Reiniciando para BIOS..."
    shutdown /r /fw /t 0
) else (
    powershell -command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Sistema BIOS legado detectado. Reinicializacao direta para BIOS nao suportada.', 'Erro', 'OK', 'Error')}"
exit /b
)
