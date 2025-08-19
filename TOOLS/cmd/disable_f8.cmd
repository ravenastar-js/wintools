@echo off
color 0A
echo Desabilitando F8 do BOOT...
rem Desabilitar F8
bcdedit /set {default} bootmenupolicy standard