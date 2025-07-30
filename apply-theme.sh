#!/bin/bash

# Apply SWD_PSP_OS Theme Script
# This script applies the theme after installation

THEME_NAME="SWD_PSP_OS"

echo "Applying ${THEME_NAME} theme..."
echo

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Determine theme variant
if [[ "$1" == "--light" ]]; then
    VARIANT="light"
    COLOR_SCHEME="SWD_PSP_OSLight"
    DESKTOP_THEME="${THEME_NAME}-light"
    LOOKANDFEEL_THEME="com.github.KGPSP.${THEME_NAME}-light"
    AURORAE_THEME="__aurorae__svg__${THEME_NAME}-light"
    KVANTUM_THEME="${THEME_NAME}-light"
    WALLPAPER_THEME="${THEME_NAME}-light"
else
    VARIANT="dark"
    COLOR_SCHEME="SWD_PSP_OSDark"
    DESKTOP_THEME="${THEME_NAME}-dark"
    LOOKANDFEEL_THEME="com.github.KGPSP.${THEME_NAME}-dark"
    AURORAE_THEME="__aurorae__svg__${THEME_NAME}-dark"
    KVANTUM_THEME="${THEME_NAME}-dark"
    WALLPAPER_THEME="${THEME_NAME}-dark"
fi

echo "Applying ${VARIANT} variant..."
echo

# 1. Apply Look and Feel package FIRST (this should configure everything)
echo "1. Applying Look and Feel package..."
if command_exists plasma-apply-lookandfeel; then
    plasma-apply-lookandfeel -a "${LOOKANDFEEL_THEME}" 2>/dev/null && echo "   ✓ Look and Feel applied" || echo "   ✗ Could not apply Look and Feel automatically"
else
    echo "   ✗ plasma-apply-lookandfeel not found"
fi

# 2. Apply color scheme (with correct name)
echo "2. Applying color scheme..."
if command_exists plasma-apply-colorscheme; then
    plasma-apply-colorscheme "${COLOR_SCHEME}" 2>/dev/null && echo "   ✓ Color scheme applied" || echo "   ✗ Could not apply color scheme automatically"
else
    echo "   ✗ plasma-apply-colorscheme not found"
fi

# 3. Apply desktop theme (Plasma theme)
echo "3. Applying Plasma desktop theme..."
if command_exists plasma-apply-desktoptheme; then
    plasma-apply-desktoptheme "${DESKTOP_THEME}" 2>/dev/null && echo "   ✓ Desktop theme applied" || echo "   ✗ Could not apply desktop theme automatically"
else
    echo "   ✗ plasma-apply-desktoptheme not found"
fi

# 4. Apply window decorations (Aurorae theme)
echo "4. Applying window decorations..."
if command_exists kwriteconfig5; then
    kwriteconfig5 --file kwinrc --group org.kde.kdecoration2 --key theme "${AURORAE_THEME}"
    echo "   ✓ Window decorations configured"
elif command_exists kwriteconfig6; then
    kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key theme "${AURORAE_THEME}"
    echo "   ✓ Window decorations configured (Plasma 6)"
else
    echo "   ✗ kwriteconfig not found"
fi

# 5. Force kickoff icon configuration
echo "5. Configuring kickoff icon..."
if command_exists kwriteconfig5; then
    # Configure kickoff to use start icon
    kwriteconfig5 --file plasma-org.kde.plasma.desktop-appletsrc --group Containments --group 1 --group Applets --group 2 --group Configuration --group General --key icon "start"
    echo "   ✓ Kickoff icon configured"
elif command_exists kwriteconfig6; then
    kwriteconfig6 --file plasma-org.kde.plasma.desktop-appletsrc --group Containments --group 1 --group Applets --group 2 --group Configuration --group General --key icon "start"
    echo "   ✓ Kickoff icon configured (Plasma 6)"
else
    echo "   ✗ Could not configure kickoff icon"
fi

# 6. Apply Kvantum theme
echo "6. Applying Kvantum theme..."
if command_exists kvantummanager; then
    kvantummanager --set "${KVANTUM_THEME}" 2>/dev/null && echo "   ✓ Kvantum theme applied" || echo "   ✗ Could not apply Kvantum theme automatically"
else
    echo "   ⚠ Kvantum not installed - install with: sudo apt install qt5-style-kvantum"
fi

# 7. Apply wallpaper
echo "7. Applying wallpaper..."
if command_exists plasma-apply-wallpaperimage; then
    # Try user directory first
    WALLPAPER_PATH="$HOME/.local/share/wallpapers/${WALLPAPER_THEME}/contents/images/3840x2400.jpg"
    if [[ -f "$WALLPAPER_PATH" ]]; then
        plasma-apply-wallpaperimage "$WALLPAPER_PATH" 2>/dev/null && echo "   ✓ Wallpaper applied from user directory" || echo "   ✗ Could not apply user wallpaper"
    # Try system directory
    elif [[ -f "/usr/share/wallpapers/${WALLPAPER_THEME}/contents/images/3840x2400.jpg" ]]; then
        plasma-apply-wallpaperimage "/usr/share/wallpapers/${WALLPAPER_THEME}/contents/images/3840x2400.jpg" 2>/dev/null && echo "   ✓ Wallpaper applied from system directory" || echo "   ✗ Could not apply system wallpaper"
    else
        echo "   ✗ Wallpaper file not found"
    fi
else
    echo "   ✗ plasma-apply-wallpaperimage not found"
fi

# 8. Clear plasma cache and restart services
echo "8. Restarting KDE services..."

# Clear plasma cache
if [[ -d "$HOME/.cache/plasma-svgelements" ]]; then
    rm -rf "$HOME/.cache/plasma-svgelements"
    echo "   ✓ Cleared plasma SVG cache"
fi

if [[ -d "$HOME/.cache/plasma_theme_"* ]]; then
    rm -rf "$HOME/.cache/plasma_theme_"*
    echo "   ✓ Cleared plasma theme cache"
fi

# Restart KWin
if command_exists qdbus; then
    qdbus org.kde.KWin /KWin reconfigure 2>/dev/null && echo "   ✓ KWin restarted" || echo "   ✗ Could not restart KWin"
fi

# Restart plasmashell
echo "9. Restarting plasmashell..."
if command_exists kquitapp5; then
    kquitapp5 plasmashell 2>/dev/null
    sleep 2
    plasmashell &>/dev/null &
    echo "   ✓ Plasmashell restarted"
elif command_exists kquitapp6; then
    kquitapp6 plasmashell 2>/dev/null
    sleep 2
    plasmashell &>/dev/null &
    echo "   ✓ Plasmashell restarted (Plasma 6)"
else
    echo "   ⚠ Please restart plasmashell manually: kquitapp5 plasmashell && plasmashell &"
fi

echo
echo "🎉 Theme application complete!"
echo
echo "📋 What should now be visible:"
echo "  ✓ Red PSP Start button instead of KDE logo"
echo "  ✓ Red gradient desktop wallpaper"
echo "  ✓ Windows 11 style window decorations"
echo "  ✓ PSP splash screen during boot"
echo
echo "🔧 If some components were not applied automatically:"
echo "1. Go to System Settings → Appearance → Global Theme"
echo "2. Select '${DESKTOP_THEME}'"
echo "3. Click 'Apply' and ensure BOTH checkboxes are selected:"
echo "   ✓ Appearance Settings"
echo "   ✓ Desktop and Window Layout"
echo
echo "🎨 For Kvantum themes (if installed):"
echo "1. Open Kvantum Manager"
echo "2. Select '${KVANTUM_THEME}'"
echo "3. Click 'Use this theme'"
echo
echo "🔄 You may need to log out and log back in for all changes to take effect."

# Verify critical components
echo
echo "🔍 Quick verification:"
CURRENT_THEME=$(kreadconfig5 --file plasmarc --group Theme --key name 2>/dev/null)
if [[ "$CURRENT_THEME" == "${DESKTOP_THEME}" ]]; then
    echo "  ✓ Plasma theme is active: $CURRENT_THEME"
else
    echo "  ⚠ Plasma theme verification failed. Current: ${CURRENT_THEME:-unknown}"
fi