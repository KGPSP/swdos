## SWD_PSP_OS KDE Theme

SWD_PSP_OS KDE is a professional theme for KDE Plasma desktop, prepared for Debian 12.x distributions for PSP (Państwowa Straż Pożarna - State Fire Service).

### About

This theme provides a modern and clean interface designed specifically for use in PSP (Polish State Fire Service) workstations running Debian 12.x with KDE Plasma desktop environment.

### Features

In this repository you'll find:

- Aurorae Themes (Window decorations)
- Kvantum Themes (Application styling)
- Plasma Color Schemes
- Plasma Desktop Themes
- Plasma Look-and-Feel Settings
- SDDM Login Themes
- Custom wallpapers and branding

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

Or apply manually:
1. Go to **System Settings → Appearance → Global Theme**
2. Select **SWD_PSP_OS-dark** or **SWD_PSP_OS-light**
3. Click **Apply**
4. Check all components you want to apply (colors, icons, plasma theme, etc.)

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

## Configuration

After installation:
1. Go to System Settings → Appearance
2. Select "SWD_PSP_OS" in Global Theme
3. Apply the theme
4. Restart the session for full effect

## License

GNU GPL v3

## Credits

Based on original work by yeyushengfan258
Customized for PSP (Państwowa Straż Pożarna) by KGPSP

---

**Note**: This theme is specifically designed for official use within the Polish State Fire Service (PSP) on Debian 12.x systems.