@echo off
chcp 65001
color 0A
echo Ativando o Suporte à Plataforma de Máquina Virtual...
DISM /Online /Enable-Feature /FeatureName:VirtualMachinePlatform /All
if %errorlevel% equ 0 (
    echo Sucesso: Recurso ativado com sucesso!
) else (
    echo Erro: Falha ao ativar o recurso.
)