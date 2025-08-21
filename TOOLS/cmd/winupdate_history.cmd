@echo off
REM ============================================
REM Verifica se o PowerShell está disponível
REM ============================================

where powershell >nul 2>&1

if %errorlevel% equ 0 (
    REM PowerShell encontrado - abre histórico de atualizações no app Configurações
    start ms-settings:windowsupdate-history
) else (
    REM PowerShell não encontrado - abre atualizações via Painel de Controle
    control update
)

exit
