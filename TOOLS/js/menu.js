// Definindo as opções do menu em um array sem números
var menuOptions = [
    { label: 'Reiniciar para BIOS (UEFI)', cmd: 'reboot_bios', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\reboot_bios.cmd\' -Verb RunAs"' },
    { label: 'Reiniciar normalmente', cmd: 'reboot_normal', script: 'cmd /c %~dp0cmd\\reboot_normal.cmd' },
    { label: 'Desligar o PC', cmd: 'shutdown', script: 'cmd /c %~dp0cmd\\shutdown.cmd' },
    { label: 'Iniciar Gerenciador de Tarefas', cmd: 'task_manager', script: 'cmd /c %~dp0cmd\\task_manager.cmd' },
    { label: 'Bloquear a tela', cmd: 'lock_screen', script: 'cmd /c %~dp0cmd\\lock_screen.cmd' },
    { label: 'Abrir a pasta de aplicativos', cmd: 'open_appsfolder', script: 'cmd /c %~dp0cmd\\open_appsfolder.cmd' },
    { label: 'Gerenciamento de Disco', cmd: 'open_gd', script: 'cmd /c %~dp0cmd\\open_gd.cmd' },
    { label: 'Abrir God Mode', cmd: 'open_godmode', script: 'cmd /c %~dp0cmd\\open_godmode.cmd' },
    { label: 'Limpar arquivos temporários', cmd: 'clean_temp_files', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\clean_temp_files.cmd\' -Verb RunAs"' },
    { label: 'Abrir Pasta Lixeira', cmd: 'open_lixeira', script: 'cmd /c %~dp0cmd\\open_lixeira.cmd' },
    { label: 'Habilitar F8', cmd: 'enable_f8', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\enable_f8.cmd\' -Verb RunAs"' },
    { label: 'Desabilitar F8', cmd: 'disable_f8', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\disable_f8.cmd\' -Verb RunAs"' },
    { label: 'Criar ponto de restauração', cmd: 'create_restore_point', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\create_restore_point.cmd\' -Verb RunAs"' },
    { label: 'Habilitar ponto de restauração ilimitado', cmd: 'enable_unlimited_restore_points', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\enable_unlimited_restore_points.cmd\' -Verb RunAs"' },
    { label: 'Exibir informações do sistema', cmd: 'system_info', script: 'cmd /c %~dp0cmd\\system_info.cmd' },
    { label: 'Configurar início do sistema (msconfig)', cmd: 'msconfig', script: 'cmd /c %~dp0cmd\\msconfig.cmd' },
    { label: 'Verificar arquivos de sistema', cmd: 'sfc_scan', script: 'cmd /c sfc /scannow' },
    { label: 'Abrir Visualizador de Eventos', cmd: 'event_viewer', script: 'cmd /c %~dp0cmd\\event_viewer.cmd' },
    { label: 'Abrir Quick Launch', cmd: 'open_quicklaunch', script: 'start explorer "%appdata%\\Microsoft\\Internet Explorer\\Quick Launch"' },
    { label: 'Criar Quick Launch', cmd: 'create_quicklaunch', script: 'cmd /c %~dp0cmd\\create_quicklaunch.cmd' },
    { label: 'Desinstalar ou alterar um programa', cmd: 'uninstall_programs', script: 'cmd /c %~dp0cmd\\uninstall_programs.cmd' },
    { label: 'Conexões de Rede', cmd: 'conexoes_redes', script: 'cmd /c %~dp0cmd\\conexoes_redes.cmd' },
    { label: 'Mostrar o cache DNS', cmd: 'display_dns', script: 'cmd /c %~dp0cmd\\display_dns.cmd' },
    { label: 'Limpar o cache DNS', cmd: 'flush_dns', script: 'cmd /c %~dp0cmd\\flush_dns.cmd' },
    { label: 'Abrir aba DNS navegador Firefox', cmd: 'firefox_dns', script: 'cmd /c %~dp0cmd\\firefox_dns.cmd' },
    { label: 'Abrir aba DNS navegador Google', cmd: 'chrome_dns', script: 'cmd /c %~dp0cmd\\chrome_dns.cmd' },
    { label: 'Teclas de atalho do Windows', cmd: 'windows_keys', script: 'cmd /c %~dp0cmd\\windows_keys.cmd' },
    { label: 'Curso gratuito Windows Rápido e Seguro 2.0', cmd: 'wrs_2', script: 'cmd /c %~dp0cmd\\wrs_2.cmd' },
    { label: 'Flash USB inicializáveis (softwares)', cmd: 'usb_boot_tools', script: 'cmd /c %~dp0cmd\\usb_boot_tools.cmd' },
    { label: 'Ativar Suporte à PVM para usar o WSL', cmd: 'a_vm', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\a_vm.cmd\' -Verb RunAs"' },
    { label: 'Desativar Suporte à PVM (caso necessário)', cmd: 'd_vm', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\d_vm.cmd\' -Verb RunAs"' }
];

var COLORS = {
    DEFAULT: '0A',
    ERROR: '0C'
};

// Função para adicionar espaços e alinhar o texto à direita
function padRight(text, length) {
    if (text.length >= length) {
        return text;
    }
    var padding = '';
    for (var i = 0; i < (length - text.length); i++) {
        padding += ' ';
    }
    return text + padding;
}
// Função para gerar o script CMD
function generateCmdScript(options) {   
    var script = '@echo off\r\ncolor ' + COLORS.DEFAULT + '\r\n\r\n';
    script += 'rem Verifica se o script esta sendo executado como administrador\r\n';
    script += 'net session >nul 2>&1\r\n';
    script += 'if %errorLevel% neq 0 (\r\n';
    script += '    color ' + COLORS.ERROR + '\r\n';
    script += '    echo Solicitando permissao de administrador...\r\n';
    script += '    goto elevate\r\n';
    script += ') else (\r\n';
    script += '    chcp 65001\r\n';
    script += '    goto runScript\r\n';
    script += ')\r\n\r\n';
    script += ':elevate\r\n';
    script += 'rem Reexecuta o script com permissoes de administrador\r\n';
    script += 'cd /d "%~dp0"\r\n';
    script += 'powershell -Command "Start-Process \'%~s0\' -Verb RunAs"\r\n';
    script += 'exit /b\r\n\r\n';
    script += ':runScript\r\n';
    script += 'rem Muda para o diretorio correto\r\n';
    script += 'cd /d "%~dp0"\r\n\r\n';
    script += ':menu\r\ncls\r\ncolor ' + COLORS.DEFAULT + '\r\n'; // Adiciona a cor verde
    script += 'echo ==================================================\r\n';
    script += 'echo.\r\n' + 'echo          github.com/ravenastar-js/wintools\r\n' + 'echo.\r\n';
    script += 'echo ==================================================\r\n';
    script += 'echo.\r\n';

    var midIndex = Math.ceil(options.length / 2);
    for (var i = 0; i < midIndex; i++) {
        var leftLabel = '[ ' + (i + 1) + ' ] ' + options[i].label;
        var rightLabel = (i + midIndex < options.length) ? '[ ' + (i + midIndex + 1) + ' ] ' + options[i + midIndex].label : '';
        script += 'echo ' + padRight(leftLabel, 50) + rightLabel + '\r\n';
    }

    script += 'echo [0m\r\n';
    script += 'echo [ \x1b[97mG\x1b[0m ] \x1b[97mAcessar Codigo Fonte no GitHub\x1b[0m\r\n';
    script += 'echo [ \x1b[91mE\x1b[0m ] \x1b[91mSair - Sai do script.\x1b[32m\r\n';
    
    
    script += 'echo ==================================================\r\n';
    script += 'set /p choice=Digite a sua escolha (1-' + options.length + ', G ou E):\x1b[93m \r\n\r\n';

    for (var i = 0; i < options.length; i++) {
        script += 'if /i "%choice%"=="' + (i + 1) + '" goto ' + options[i].cmd + '\r\n';
    }

    script += 'if /i "%choice%"=="G" goto github\r\n';
    script += 'if /i "%choice%"=="E" goto exit\r\n';
    script += 'goto invalid_choice\r\n\r\n';

    for (var i = 0; i < options.length; i++) {
        script += ': ' + options[i].cmd + '\r\n';
        script += 'echo [0m\r\n'
        script += options[i].script + '\r\n';
        script += 'pause\r\n';
        script += 'goto menu\r\n\r\n';
    }

    script += ':github\r\necho [0m\r\nstart https://github.com/ravenastar-js/wintools\r\npause\r\ngoto menu\r\n\r\n';
    script += ':exit\r\nexit\r\n';
    script += ':invalid_choice\r\npowershell -command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show(\'Escolher entre 1 a ' + options.length + ', G ou E.\', \'Erro\', \'OK\', \'Error\')}"\r\npause\r\ngoto menu\r\n';

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
