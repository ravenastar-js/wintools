var WshShell = WScript.CreateObject("WScript.Shell");
var CurrentDirectory = WshShell.CurrentDirectory;

var shortcuts = [
    { shortcut: "WINTOOLS MOUSE (HTA).lnk", target: "tools\\mouse\\menu.hta", root: true },
    { shortcut: "WINTOOLS TECLADO (CMD).lnk", target: "tools\\menu.cmd", root: true },
    { shortcut: "tools\\mouse\\reboot_normal.lnk", target: "tools\\mouse\\reboot_normal.cmd", root: false },
    { shortcut: "tools\\mouse\\reboot_bios.lnk", target: "tools\\mouse\\reboot_bios.cmd", root: false },
    { shortcut: "tools\\mouse\\shutdown.lnk", target: "tools\\mouse\\shutdown.cmd", root: false },
    { shortcut: "tools\\mouse\\task_manager.lnk", target: "tools\\mouse\\task_manager.cmd", root: false },
    { shortcut: "tools\\mouse\\lock_screen.lnk", target: "tools\\mouse\\lock_screen.cmd", root: false },
    { shortcut: "tools\\mouse\\open_appsfolder.lnk", target: "tools\\mouse\\open_appsfolder.cmd", root: false },
    { shortcut: "tools\\mouse\\god_mode.lnk", target: "tools\\mouse\\god_mode.cmd", root: false },
    { shortcut: "tools\\mouse\\clean_temp_files.lnk", target: "tools\\mouse\\clean_temp_files.cmd", root: false },
    { shortcut: "tools\\mouse\\enable_f8.lnk", target: "tools\\mouse\\enable_f8.cmd", root: false },
    { shortcut: "tools\\mouse\\disable_f8.lnk", target: "tools\\mouse\\disable_f8.cmd", root: false },
    { shortcut: "tools\\mouse\\create_restore_point.lnk", target: "tools\\mouse\\create_restore_point.cmd", root: false },
    { shortcut: "tools\\mouse\\enable_unlimited_restore_points.lnk", target: "tools\\mouse\\enable_unlimited_restore_points.cmd", root: false },
    { shortcut: "tools\\mouse\\open_site.lnk", target: "tools\\mouse\\open_site.cmd", root: false }
];

for (var i = 0; i < shortcuts.length; i++) {
    var shortcut = shortcuts[i].shortcut;
    var target = shortcuts[i].target;
    var root = shortcuts[i].root;

    var shortcutPath = root ? (CurrentDirectory + "\\" + shortcut) : (CurrentDirectory + "\\" + shortcut);
    var targetPath = CurrentDirectory + "\\" + target;

    try {
        var oLink = WshShell.CreateShortcut(shortcutPath);
        oLink.TargetPath = targetPath;
        oLink.WorkingDirectory = CurrentDirectory;
        oLink.WindowStyle = 1;
        oLink.IconLocation = targetPath + ", 0";
        oLink.Description = "Atalho criado pelo script";
        oLink.Save();
    } catch (e) {
        WScript.Echo("Erro ao criar o atalho: " + shortcutPath + ". Detalhes: " + e.message);
    }
}
