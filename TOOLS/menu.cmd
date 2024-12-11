@echo off
color 0A
:menu
cls
echo ==================================================
echo.
echo          github.com/ravenastar-js/wintools
echo.
echo ==================================================
echo.
echo [ 1 ] Reiniciar para BIOS (UEFI)
echo [ 2 ] Reiniciar normalmente
echo [ 3 ] Desligar o PC
echo [ 4 ] Iniciar Gerenciador de Tarefas
echo [ 5 ] Bloquear a Tela
echo [ 6 ] Abrir a pasta de Aplicativos
echo [ 7 ] Abrir God Mode
echo [ 8 ] Limpar Arquivos Temp
echo [ 9 ] Habilitar F8
echo [ 10 ] Desabilitar F8
echo [ 11 ] Criar Ponto de Rest
echo [ 12 ] Habilitar Ponto de Rest Ilimitado
echo [ 13 ] Sair
echo.
echo ==================================================
set /p choice=Digite a sua escolha (1-13):

if "%choice%"=="1" goto reboot_bios
if "%choice%"=="2" goto reboot_normal
if "%choice%"=="3" goto shutdown
if "%choice%"=="4" goto task_manager
if "%choice%"=="5" goto lock_screen
if "%choice%"=="6" goto open_appsfolder
if "%choice%"=="7" goto open_godmode
if "%choice%"=="8" goto clean_temp
if "%choice%"=="9" goto enable_f8
if "%choice%"=="10" goto disable_f8
if "%choice%"=="11" goto create_restore_point
if "%choice%"=="12" goto enable_unlimited_restore_points
if "%choice%"=="13" goto exit
goto invalid_choice

:reboot_bios
cls
echo Detectando tipo de BIOS...
powershell -command "Confirm-SecureBootUEFI" | findstr "True"
if %errorlevel%==0 (
    msg * "Sistema UEFI detectado. Reiniciando para BIOS..."
    shutdown /r /fw /t 0
) else (
    powershell -command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Sistema BIOS legado detectado. Reinicializacao direta para BIOS nao suportada.', 'Erro', 'OK', 'Error')}"
)
goto menu

:reboot_normal
shutdown /r /t 0
goto exit

:shutdown
shutdown /s /t 0
goto exit

:task_manager
start taskmgr
goto menu

:lock_screen
rundll32.exe user32.dll,LockWorkStation
goto menu

:open_appsfolder
explorer shell:appsfolder
goto menu

:open_godmode
mkdir "%userprofile%\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
explorer "%userprofile%\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
goto menu

:clean_temp
cd %~dp0..\..\..
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\clean_temp_files.cmd' -Verb RunAs"
goto menu



:enable_f8
bcdedit /set {default} bootmenupolicy legacy
goto menu

:disable_f8
bcdedit /set {default} bootmenupolicy standard
goto menu

:create_restore_point
Wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Criado via atalho", 100, 7
goto menu

:enable_unlimited_restore_points
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v SystemRestorePointCreationFrequency >nul 2>&1
if %errorlevel%==0 (
    powershell -command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('A chave ja existe.', 'Aviso', 'OK', 'Warning')}"
) else (
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v SystemRestorePointCreationFrequency /t REG_DWORD /d 0 /f
)
goto menu

:invalid_choice
powershell -command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Escolher entre 1 a 13.', 'Erro', 'OK', 'Error')}"
goto menu

:exit
exit
