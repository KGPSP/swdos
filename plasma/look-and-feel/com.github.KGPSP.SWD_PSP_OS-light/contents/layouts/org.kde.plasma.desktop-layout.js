var plasma = getApiVersion(1);

// Remove existing panels
var allPanels = panels();
for (var i = allPanels.length - 1; i >= 0; i--) {
    allPanels[i].remove();
}

// Create bottom panel (Windows 11 style)
var panel = new plasma.Panel;
panel.location = "bottom";
panel.height = gridUnit * 2.5;
panel.alignment = "center";
panel.minimumLength = gridUnit * 40;
panel.maximumLength = gridUnit * 80;

// Add widgets to panel in Windows 11 order
// 1. Application Launcher (Kickoff)
var kickoff = panel.addWidget("org.kde.plasma.kickoff");
kickoff.currentConfigGroup = ["General"];
// Try both user and system paths for the icon
var userIcon = userDataPath("plasma/desktoptheme/SWD_PSP_OS-light/icons/start.svg");
var systemIcon = "/usr/share/plasma/desktoptheme/SWD_PSP_OS-light/icons/start.svg";
var iconPath = userIcon || systemIcon;
kickoff.writeConfig("icon", iconPath);
kickoff.writeConfig("customButtonImage", iconPath);
kickoff.writeConfig("useCustomButtonImage", true);

// 2. Task Manager
var taskManager = panel.addWidget("org.kde.plasma.taskmanager");
taskManager.currentConfigGroup = ["General"];
taskManager.writeConfig("launchers", "");
taskManager.writeConfig("showOnlyCurrentDesktop", false);
taskManager.writeConfig("groupingStrategy", 0);
taskManager.writeConfig("sortingStrategy", 1);
taskManager.writeConfig("maxStripes", 1);

// 3. Add spacing
panel.addWidget("org.kde.plasma.panelspacer");

// 4. System Tray
var systemTray = panel.addWidget("org.kde.plasma.systemtray");
systemTray.currentConfigGroup = ["General"];
systemTray.writeConfig("showAllItems", false);
systemTray.writeConfig("scaleIconsToFit", true);

// 5. Digital Clock
var clock = panel.addWidget("org.kde.plasma.digitalclock");
clock.currentConfigGroup = ["Appearance"];
clock.writeConfig("dateFormat", "shortDate");
clock.writeConfig("showDate", true);
clock.writeConfig("dateDisplayFormat", "BelowTime");
clock.writeConfig("use24hFormat", true);

// 6. Show Desktop
panel.addWidget("org.kde.plasma.showdesktop");

// Set desktop wallpaper
var desktops = desktopsForActivity(currentActivity());
for (var i = 0; i < desktops.length; i++) {
    var desktop = desktops[i];
    desktop.wallpaperPlugin = "org.kde.image";
    desktop.currentConfigGroup = ["Wallpaper", "org.kde.image", "General"];
    // Try both user and system paths for wallpaper
    var userWallpaper = userDataPath("wallpapers/SWD_PSP_OS-light/contents/images/3840x2400.jpg");
    var systemWallpaper = "/usr/share/wallpapers/SWD_PSP_OS-light/contents/images/3840x2400.jpg";
    var wallpaperPath = userWallpaper || systemWallpaper;
    desktop.writeConfig("Image", wallpaperPath);
    desktop.writeConfig("FillMode", 2); // Scaled and Cropped
}

// Disable desktop toolbox
var desktop = desktops[0];
desktop.currentConfigGroup = ["General"];
desktop.writeConfig("showToolbox", false);