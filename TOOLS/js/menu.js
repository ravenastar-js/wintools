// Definindo as opções do menu em um array sem números
var menuOptions = [
    { label: 'Reiniciar para BIOS (UEFI)', cmd: 'reboot_bios', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\reboot_bios.cmd\' -Verb RunAs"' },
    { label: 'Reiniciar normalmente', cmd: 'reboot_normal', script: 'cmd /c %~dp0cmd\\reboot_normal.cmd' },
    { label: 'Desligar o PC', cmd: 'shutdown', script: 'cmd /c %~dp0cmd\\shutdown.cmd' },
    { label: 'Iniciar Gerenciador de Tarefas', cmd: 'task_manager', script: 'cmd /c %~dp0cmd\\task_manager.cmd' },
    { label: 'Bloquear a Tela', cmd: 'lock_screen', script: 'cmd /c %~dp0cmd\\lock_screen.cmd' },
    { label: 'Abrir a pasta de Aplicativos', cmd: 'open_appsfolder', script: 'cmd /c %~dp0cmd\\open_appsfolder.cmd' },
    { label: 'Abrir God Mode', cmd: 'open_godmode', script: 'cmd /c %~dp0cmd\\open_godmode.cmd' },
    { label: 'Limpar Arquivos Temporarios', cmd: 'clean_temp', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\clean_temp_files.cmd\' -Verb RunAs"' },
    { label: 'Habilitar F8', cmd: 'enable_f8', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\enable_f8.cmd\' -Verb RunAs"' },
    { label: 'Desabilitar F8', cmd: 'disable_f8', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\disable_f8.cmd\' -Verb RunAs"' },
    { label: 'Criar Ponto de Restauracao', cmd: 'create_restore_point', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\create_restore_point.cmd\' -Verb RunAs"' },
    { label: 'Habilitar Ponto de Restauracao Ilimitado', cmd: 'enable_unlimited_restore_points', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\enable_unlimited_restore_points.cmd\' -Verb RunAs"' },
    { label: 'Exibir Informacoes do Sistema', cmd: 'system_info', script: 'cmd /c %~dp0cmd\\system_info.cmd' },
    { label: 'Verificar e Reparar Disco', cmd: 'check_disk', script: 'cmd /c sfc /scannow' },
    { label: 'Configurar Inicio do Sistema (msconfig)', cmd: 'msconfig', script: 'cmd /c %~dp0cmd\\msconfig.cmd' },
    { label: 'Verificar Arquivos de Sistema', cmd: 'sfc_scan', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\sfc_scan.cmd\' -Verb RunAs"' },
    { label: 'Abrir Visualizador de Eventos', cmd: 'event_viewer', script: 'cmd /c %~dp0cmd\\event_viewer.cmd' }
];

// Função para gerar o script CMD
function generateCmdScript(options) {
    var script = '@echo off\r\ncolor 0A\r\n\r\n';
    script += 'rem Verifica se o script está sendo executado como administrador\r\n';
    script += 'net session >nul 2>&1\r\n';
    script += 'if %errorLevel% neq 0 (\r\n';
    script += '    color 0C\r\n';
    script += '    echo Solicitando permissao de administrador...\r\n';
    script += '    goto elevate\r\n';
    script += ') else (\r\n';
    script += '    goto runScript\r\n';
    script += ')\r\n\r\n';
    script += ':elevate\r\n';
    script += 'rem Reexecuta o script com permissões de administrador\r\n';
    script += 'cd /d "%~dp0"\r\n';
    script += 'powershell -Command "Start-Process \'%~s0\' -Verb RunAs"\r\n';
    script += 'exit /b\r\n\r\n';
    script += ':runScript\r\n';
    script += 'rem Muda para o diretório correto\r\n';
    script += 'cd /d "%~dp0"\r\n\r\n';
    script += ':menu\r\ncls\r\ncolor 0A\r\n'; // Adiciona a cor verde
    script += 'echo ==================================================\r\n';
    script += 'echo.\r\n' + 'echo          github.com/ravenastar-js/wintools\r\n' + 'echo.\r\n';
    script += 'echo ==================================================\r\n';
    script += 'echo.\r\n';

    for (var i = 0; i < options.length; i++) {
        script += 'echo [ ' + (i + 1) + ' ] ' + options[i].label + '\r\n';
    }
    script += 'echo [0m\r\n';
    script += 'echo [ \x1b[97mG\x1b[0m ] \x1b[97mAcessar Codigo Fonte no GitHub\x1b[0m\r\n';
    script += 'echo [ \x1b[93mH\x1b[0m ] \x1b[93mAjuda - Exibe tela de ajuda.\x1b[0m\r\n';
    script += 'echo [ \x1b[91mE\x1b[0m ] \x1b[91mSair - Sai do script.\x1b[32m\r\n';

    script += 'echo ==================================================\r\n';
    script += 'set /p choice=Digite a sua escolha (1-' + options.length + ', H, E, ou G):\x1b[0m\r\n\r\n';

    for (var i = 0; i < options.length; i++) {
        script += 'if /i "%choice%"=="' + (i + 1) + '" goto ' + options[i].cmd + '\r\n';
    }

    script += 'if /i "%choice%"=="G" goto github\r\n';
    script += 'if /i "%choice%"=="H" goto help\r\n';
    script += 'if /i "%choice%"=="E" goto exit\r\n';
    script += 'goto invalid_choice\r\n\r\n';

    for (var i = 0; i < options.length; i++) {
        script += ':' + options[i].cmd + '\r\n';
        script += options[i].script + '\r\n';
        script += 'pause\r\n';
        script += 'goto menu\r\n\r\n';
    }

    script += ':github\r\nstart https://github.com/ravenastar-js/wintools\r\npause\r\ngoto menu\r\n\r\n';

    script += ':help\r\ncls\r\ncolor 0E\r\necho Ajuda:\r\n';

    for (var i = 0; i < options.length; i++) {
        script += 'echo [ ' + (i + 1) + ' ] ' + options[i].label + '\r\n';
    }

    script += 'echo [ G ] Acessar Codigo Fonte no GitHub\r\n';
    script += 'echo [ H ] Ajuda - Exibe esta tela de ajuda.\r\n';
    script += 'echo [ E ] Sai do script.\r\n';

    script += 'color 0E\r\npause\r\ncolor 0A\r\ngoto menu\r\n\r\n';

    script += ':exit\r\nexit\r\n';

    script += ':invalid_choice\r\npowershell -command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show(\'Escolher entre 1 a ' + options.length + ', H, E, ou G.\', \'Erro\', \'OK\', \'Error\')}"\r\npause\r\ngoto menu\r\n';

    return script;
}

// Utilizando WScript.Shell para criar e escrever o arquivo menu.cmd na pasta anterior à pasta em que o script está sendo executado (que é a pasta "js")
var shell = new ActiveXObject("WScript.Shell");
var fso = new ActiveXObject("Scripting.FileSystemObject");
var currentFolder = fso.GetParentFolderName(WScript.ScriptFullName);
var parentFolder = fso.GetParentFolderName(currentFolder);

var cmdFilePath = fso.BuildPath(parentFolder, "menu.cmd");
var cmdFile = fso.CreateTextFile(cmdFilePath, true);

var cmdScript = generateCmdScript(menuOptions);
cmdFile.Write(cmdScript);
cmdFile.Close();


