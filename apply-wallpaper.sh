#!/bin/bash

# Apply SWD_PSP_OS Wallpaper Script
# This script manually applies the wallpaper if it doesn't apply automatically

THEME_NAME="SWD_PSP_OS"

echo "Applying ${THEME_NAME} wallpaper..."
echo

# Use dark variant
VARIANT="dark"

# Check for wallpaper paths
USER_WALLPAPER="$HOME/.local/share/wallpapers/${THEME_NAME}-dark/contents/images/3840x2400.jpg"
SYSTEM_WALLPAPER="/usr/share/wallpapers/${THEME_NAME}-dark/contents/images/3840x2400.jpg"

# Find which wallpaper exists
WALLPAPER_PATH=""
if [[ -f "$USER_WALLPAPER" ]]; then
    WALLPAPER_PATH="$USER_WALLPAPER"
    echo "Found wallpaper in user directory"
elif [[ -f "$SYSTEM_WALLPAPER" ]]; then
    WALLPAPER_PATH="$SYSTEM_WALLPAPER"
    echo "Found wallpaper in system directory"
else
    echo "Error: Wallpaper not found!"
    echo "Please run ./install.sh first"
    exit 1
fi

echo "Using wallpaper: $WALLPAPER_PATH"

# Method 1: Using plasma-apply-wallpaperimage
if command -v plasma-apply-wallpaperimage >/dev/null 2>&1; then
    echo "Applying wallpaper using plasma-apply-wallpaperimage..."
    plasma-apply-wallpaperimage "$WALLPAPER_PATH"
fi

# Method 2: Using qdbus (more direct method)
if command -v qdbus >/dev/null 2>&1; then
    echo "Applying wallpaper using qdbus..."
    qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "
        var allDesktops = desktops();
        for (i=0;i<allDesktops.length;i++) {
            d = allDesktops[i];
            d.wallpaperPlugin = 'org.kde.image';
            d.currentConfigGroup = Array('Wallpaper', 'org.kde.image', 'General');
            d.writeConfig('Image', 'file://$WALLPAPER_PATH');
        }
    "
fi

# Method 3: Using kwriteconfig5
if command -v kwriteconfig5 >/dev/null 2>&1; then
    echo "Setting wallpaper configuration..."
    kwriteconfig5 --file plasma-org.kde.plasma.desktop-appletsrc --group Containments --group 1 --group Wallpaper --group org.kde.image --group General --key Image "file://$WALLPAPER_PATH"
fi

echo
echo "Wallpaper application complete!"
echo "You may need to:"
echo "1. Right-click on desktop → Configure Desktop and Wallpaper"
echo "2. Select the PSP wallpaper manually"
echo "3. Or log out and log back in"