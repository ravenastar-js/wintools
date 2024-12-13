@echo off
color 0A
:: Exibir a janela do CMD
echo Criando ponto de restauracao...
Wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Criado via atalho", 100, 7
exit