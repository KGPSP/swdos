## SWD_PSP_OS KDE Theme

SWD_PSP_OS KDE is a professional theme for KDE Plasma desktop, prepared for Debian 12.x distributions for PSP (Państwowa Straż Pożarna - State Fire Service).

### About

This theme provides a modern and clean interface designed specifically for use in PSP (Polish State Fire Service) workstations running Debian 12.x with KDE Plasma desktop environment.

### Features

In this repository you'll find:

- Aurorae Themes (Window decorations)
- Kvantum Themes (Application styling)
- Plasma Color Schemes
- Plasma Desktop Themes with custom PSP kickoff button
- Plasma Look-and-Feel Settings with desktop layout configuration
- SDDM Login Themes with PSP branding
- Custom PSP wallpapers and logos
- Automatic panel and widget configuration

### System Requirements

- Debian 12.x (Bookworm)
- KDE Plasma 5.x or 6.x
- Kvantum theme engine (for application styling)

## Installation

### Step 1: Install Theme Files

```sh
./install.sh
```

For system-wide installation (recommended for workstations):
```sh
sudo ./install.sh
```

### Step 2: Apply the Theme

After installation, the theme needs to be applied. Use the included script:

```sh
./apply-theme.sh        # For dark theme (default)
./apply-theme.sh --light # For light theme
```

If the wallpaper doesn't apply automatically:
```sh
./apply-wallpaper.sh        # For dark wallpaper
./apply-wallpaper.sh --light # For light wallpaper
```

Or apply manually:
1. Go to **System Settings → Appearance → Global Theme**
2. Select **SWD_PSP_OS-dark** or **SWD_PSP_OS-light**
3. Click **Apply**
4. Check all components you want to apply:
   - ✓ Appearance Settings (colors, icons, plasma theme)
   - ✓ Desktop and Window Layout (panel configuration, widgets, kickoff)

### SDDM Theme Installation

To install the login screen theme:

For Plasma 5:
```sh
sudo ./sddm-dark/5.0/install.sh  # Dark variant
sudo ./sddm-light/5.0/install.sh # Light variant
```

For Plasma 6:
```sh
sudo ./sddm-dark/6.0/install.sh  # Dark variant
sudo ./sddm-light/6.0/install.sh # Light variant
```

## Uninstall

```sh
./uninstall.sh
```

## Verification

To verify the installation was successful:
```sh
./verify-installation.sh
```

This will check all theme components are properly installed.

## Configuration

After installation:
1. Go to System Settings → Appearance → Global Theme
2. Select "SWD_PSP_OS-dark" or "SWD_PSP_OS-light"
3. Ensure both checkboxes are selected:
   - Appearance Settings
   - Desktop and Window Layout
4. Click Apply
5. Restart the session for full effect

## License

GNU GPL v3

## Credits

Based on original work by yeyushengfan258
Customized for PSP (Państwowa Straż Pożarna) by KGPSP

---

**Note**: This theme is specifically designed for official use within the Polish State Fire Service (PSP) on Debian 12.x systems.