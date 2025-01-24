@echo off
chcp 65001
color 0A
echo Desativando o Suporte à Plataforma de Máquina Virtual...
DISM /Online /Disable-Feature /FeatureName:VirtualMachinePlatform
if %errorlevel% equ 0 (
    echo Sucesso: Recurso desativado com sucesso!
) else (
    echo Erro: Falha ao desativar o recurso.
)