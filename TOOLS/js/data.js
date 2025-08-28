var menuOptions = [
    // ========== GERENCIAMENTO DO SISTEMA (ADMIN) ==========
    { label: '\x1b[94m◙\x1b[32m Reiniciar o dispositivo para BIOS (UEFI)', cmd: 'reboot_bios', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\reboot_bios.cmd\' -Verb RunAs"' },
    { label: '\x1b[94m◙\x1b[32m Habilitar F8', cmd: 'enable_f8', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\enable_f8.cmd\' -Verb RunAs"' },
    { label: '\x1b[94m◙\x1b[32m Desabilitar F8', cmd: 'disable_f8', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\disable_f8.cmd\' -Verb RunAs"' },
    { label: '\x1b[94m◙\x1b[32m Criar ponto de restauração', cmd: 'create_restore_point', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\create_restore_point.cmd\' -Verb RunAs"' },
    { label: '\x1b[94m◙\x1b[32m Habilitar ponto de restauração ilimitado', cmd: 'enable_unlimited_restore_points', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\enable_unlimited_restore_points.cmd\' -Verb RunAs"' },
    { label: '\x1b[94m◙\x1b[32m Limpar arquivos temporários', cmd: 'clean_temp_files', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\clean_temp_files.cmd\' -Verb RunAs"' },
    { label: '\x1b[94m◙\x1b[32m Verificar arquivos de sistema', cmd: 'sfc_scan', script: 'cmd /c sfc /scannow' },
    { label: '\x1b[94m◙\x1b[32m Gerenciar contas de usuário', cmd: 'open_guser', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\open_guser.cmd\' -Verb RunAs"' },

    // ========== GERENCIAMENTO DE ENERGIA ==========
    { label: '\x1b[94m◙\x1b[32m Reiniciar o dispositivo normalmente', cmd: 'reboot_normal', script: 'cmd /c %~dp0cmd\\reboot_normal.cmd' },
    { label: '\x1b[94m◙\x1b[32m Desligar o dispositivo', cmd: 'shutdown', script: 'cmd /c %~dp0cmd\\shutdown.cmd' },
    { label: '\x1b[94m◙\x1b[32m Bloquear a tela', cmd: 'lock_screen', script: 'cmd /c %~dp0cmd\\lock_screen.cmd' },

    // ========== FERRAMENTAS DO SISTEMA ==========
    { label: '\x1b[94m◙\x1b[32m Iniciar Gerenciador de Tarefas', cmd: 'task_manager', script: 'cmd /c %~dp0cmd\\task_manager.cmd' },
    { label: '\x1b[94m◙\x1b[32m Gerenciamento de Disco', cmd: 'open_gd', script: 'cmd /c %~dp0cmd\\open_gd.cmd' },
    { label: '\x1b[94m◙\x1b[32m Abrir God Mode', cmd: 'open_godmode', script: 'cmd /c %~dp0cmd\\open_godmode.cmd' },
    { label: '\x1b[94m◙\x1b[32m Abrir Pasta Lixeira', cmd: 'open_lixeira', script: 'cmd /c %~dp0cmd\\open_lixeira.cmd' },
    { label: '\x1b[94m◙\x1b[32m Exibir informações do sistema', cmd: 'system_info', script: 'cmd /c %~dp0cmd\\system_info.cmd' },
    { label: '\x1b[94m◙\x1b[32m Configurar início do sistema (msconfig)', cmd: 'msconfig', script: 'cmd /c %~dp0cmd\\msconfig.cmd' },
    { label: '\x1b[94m◙\x1b[32m Abrir Visualizador de Eventos', cmd: 'event_viewer', script: 'cmd /c %~dp0cmd\\event_viewer.cmd' },
    { label: '\x1b[94m◙\x1b[32m Desinstalar ou alterar um programa', cmd: 'uninstall_programs', script: 'cmd /c %~dp0cmd\\uninstall_programs.cmd' },
    { label: '\x1b[94m◙\x1b[32m Ativar ou desativar recursos do Windows', cmd: 'open_optwin', script: 'cmd /c %~dp0cmd\\open_optwin.cmd' },
    { label: '\x1b[94m◙\x1b[32m Auditoria de Eventos de Segurança do Windows (Últimas 168h)', cmd: 'monitor_eventos', script: 'cmd /c %~dp0cmd\\monitor_eventos.cmd' },
    { label: '\x1b[94m◙\x1b[32m Abrir Histórico de Atualizações do Windows', cmd: 'winupdate_history', script: 'cmd /c %~dp0cmd\\winupdate_history.cmd' },

    // ========== REDES E INTERNET ==========
    { label: '\x1b[94m◙\x1b[32m Conexões de Rede', cmd: 'conexoes_redes', script: 'cmd /c %~dp0cmd\\conexoes_redes.cmd' },
    { label: '\x1b[94m◙\x1b[32m Mostrar o cache DNS', cmd: 'display_dns', script: 'cmd /c %~dp0cmd\\display_dns.cmd' },
    { label: '\x1b[94m◙\x1b[32m Limpar o cache DNS', cmd: 'flush_dns', script: 'cmd /c %~dp0cmd\\flush_dns.cmd' },
    { label: '\x1b[94m◙\x1b[32m Abrir aba DNS navegador Firefox', cmd: 'firefox_dns', script: 'cmd /c %~dp0cmd\\firefox_dns.cmd' },
    { label: '\x1b[94m◙\x1b[32m Abrir aba DNS navegador Google', cmd: 'chrome_dns', script: 'cmd /c %~dp0cmd\\chrome_dns.cmd' },

    // ========== ACESSO RÁPIDO ==========
    { label: '\x1b[94m◙\x1b[32m Abrir a pasta de aplicativos', cmd: 'open_appsfolder', script: 'cmd /c %~dp0cmd\\open_appsfolder.cmd' },
    { label: '\x1b[94m◙\x1b[32m Abrir Quick Launch', cmd: 'open_quicklaunch', script: 'start explorer "%appdata%\\Microsoft\\Internet Explorer\\Quick Launch"' },

    // ========== VIRTUALIZAÇÃO ==========
    { label: '\x1b[94m◙\x1b[32m Ativar Suporte à PVM para usar o WSL', cmd: 'a_vm', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\a_vm.cmd\' -Verb RunAs"' },
    { label: '\x1b[94m◙\x1b[32m Desativar Suporte à PVM (caso necessário)', cmd: 'd_vm', script: 'powershell -command "Start-Process cmd.exe -ArgumentList \'/c %~dp0cmd\\d_vm.cmd\' -Verb RunAs"' },

    // ========== GUIAS E DOCUMENTAÇÃO ==========
    { label: '\x1b[37m◙\x1b[32m Verificação do HD/SSD', cmd: 'v_armazen', script: 'cmd /c start "" "%~dp0docs\\v_armazen.txt"' },
    { label: '\x1b[37m◙\x1b[32m Corrigindo arquivos do Windows', cmd: 'win_chkdsk', script: 'cmd /c start "" "%~dp0docs\\win_chkdsk.txt"' },
    { label: '\x1b[37m◙\x1b[32m Arquivos temporários', cmd: 'temp_files', script: 'cmd /c start "" "%~dp0docs\\temp_files.txt"' },
    { label: '\x1b[37m◙\x1b[32m Remoção de Bloatwares e programas indesejados', cmd: 'r_bloatwares', script: 'cmd /c start "" "%~dp0docs\\r_bloatwares.txt"' },
    { label: '\x1b[37m◙\x1b[32m Instalar o Windows 11 com Conta Local (sem conexão obrigatória)', cmd: 'win11_cl', script: 'cmd /c start "" "%~dp0docs\\win11_cl.txt"' },
    { label: '\x1b[37m◙\x1b[32m Configurações Importantes na BIOS/UEFI', cmd: 'config_bios', script: 'cmd /c start "" "%~dp0docs\\config_bios.txt"' },
    { label: '\x1b[37m◙\x1b[32m Criar Quick Launch', cmd: 'create_quicklaunch', script: 'cmd /c start "" "%~dp0docs\\create_quicklaunch.txt"' },
    { label: '\x1b[37m◙\x1b[32m Teclas de atalho do Windows', cmd: 'windows_keys', script: 'cmd /c start "" "%~dp0docs\\windows_keys.txt"' },
    { label: '\x1b[37m◙\x1b[32m Curso gratuito Windows Rápido e Seguro 2.0', cmd: 'wrs_2', script: 'cmd /c start "" "%~dp0docs\\wrs_2.txt"' },
    { label: '\x1b[37m◙\x1b[32m Flash USB inicializáveis (softwares)', cmd: 'usb_boot_tools', script: 'cmd /c start "" "%~dp0docs\\usb_boot_tools.txt"' },
    { label: '\x1b[37m◙\x1b[32m MBR Filter', cmd: 'mbr_filter', script: 'cmd /c start "" "%~dp0docs\\mbr_filter.txt"' },
    { label: '\x1b[37m◙\x1b[32m Instalação do Kali Linux no Windows via WSL', cmd: 'win_wsl', script: 'cmd /c start "" "%~dp0docs\\win_wsl.txt"' },
    { label: '\x1b[37m◙\x1b[32m Monitoramento de Segurança com o Visualizador de Eventos', cmd: 'v_eventos', script: 'cmd /c start "" "%~dp0docs\\v_eventos.txt"' },
    { label: '\x1b[37m◙\x1b[32m Ativação do Super God Mode', cmd: 'super_godmode', script: 'cmd /c start "" "%~dp0docs\\super_godmode.txt"' }
];

var NameAndSite = "github.com/ravenastar-js/wintools"