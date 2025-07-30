#!/bin/bash

# Fix Kickoff Icon Script
# This script specifically fixes the kickoff button icon

echo "🔧 Fixing kickoff button icon..."

# Stop plasmashell
echo "1. Stopping plasmashell..."
if command -v kquitapp5 >/dev/null; then
    kquitapp5 plasmashell 2>/dev/null
elif command -v kquitapp6 >/dev/null; then
    kquitapp6 plasmashell 2>/dev/null
else
    killall plasmashell 2>/dev/null
fi

sleep 3

# Clear plasma cache
echo "2. Clearing plasma cache..."
rm -rf "$HOME/.cache/plasma-svgelements"
rm -rf "$HOME/.cache/plasma_theme_"*
rm -rf "$HOME/.cache/icon-cache.kcache"

# Force kickoff configuration
echo "3. Configuring kickoff icon..."

# Method 1: Direct kwriteconfig
if command -v kwriteconfig5 >/dev/null; then
    # Try different possible applet configurations
    for container in {1..10}; do
        for applet in {1..20}; do
            kwriteconfig5 --file plasma-org.kde.plasma.desktop-appletsrc --group Containments --group $container --group Applets --group $applet --group Configuration --group General --key icon "start" 2>/dev/null
        done
    done
    echo "   ✓ Kickoff configuration written (Plasma 5)"
elif command -v kwriteconfig6 >/dev/null; then
    # Try different possible applet configurations
    for container in {1..10}; do
        for applet in {1..20}; do
            kwriteconfig6 --file plasma-org.kde.plasma.desktop-appletsrc --group Containments --group $container --group Applets --group $applet --group Configuration --group General --key icon "start" 2>/dev/null
        done
    done
    echo "   ✓ Kickoff configuration written (Plasma 6)"
fi

# Method 2: Script-based panel reset with kickoff icon
echo "4. Applying desktop layout..."

# Find and apply look-and-feel layout
DARK_LAYOUT="$HOME/.local/share/plasma/look-and-feel/com.github.KGPSP.SWD_PSP_OS-dark/contents/layouts/org.kde.plasma.desktop-layout.js"

if [[ -f "$DARK_LAYOUT" ]]; then
    # Apply the layout script which should set the start icon
    if command -v plasma-apply-lookandfeel >/dev/null; then
        plasma-apply-lookandfeel -a "com.github.KGPSP.SWD_PSP_OS-dark" --resetLayout 2>/dev/null
        echo "   ✓ Applied dark layout with start icon"
    fi
fi

# Restart plasmashell
echo "5. Restarting plasmashell..."
plasmashell &>/dev/null &

echo
echo "✅ Kickoff fix complete!"
echo "🔄 Please wait 5-10 seconds for plasmashell to fully restart."
echo
echo "If the icon still doesn't show:"
echo "1. Right-click on the start button"
echo "2. Select 'Configure Application Dashboard'"
echo "3. Click on the icon next to 'Icon:'"
echo "4. Search for 'start' and select the red PSP icon"
echo "5. Click 'OK'" 