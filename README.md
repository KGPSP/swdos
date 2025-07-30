## SWD_PSP_OS KDE Theme

SWD_PSP_OS KDE is a professional theme for KDE Plasma desktop, prepared for Debian 12.x distributions for PSP (Państwowa Straż Pożarna - State Fire Service).

### Quick Start

```bash
# Clone and enter directory
git clone https://github.com/KGPSP/swdos.git
cd swdos

# Make scripts executable
chmod +x *.sh

# Install theme
./install.sh

# Apply theme
./apply-theme.sh
```

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

- Debian 12.x (Bookworm) or compatible distribution
- KDE Plasma 5.x or 6.x
- Git (for cloning repository)
- Kvantum theme engine (optional, for application styling)

To install Kvantum:
```bash
sudo apt install qt5-style-kvantum qt5-style-kvantum-themes
```

## Installation

### Complete Installation Guide

#### Step 1: Clone the Repository

```sh
git clone https://github.com/KGPSP/swdos.git
cd swdos
```

#### Step 2: Make Scripts Executable

```sh
chmod +x *.sh
# Or use the helper script:
./make-executable.sh
```

#### Step 3: Install Theme Files

For user installation (recommended):
```sh
./install.sh
```

For system-wide installation:
```sh
sudo ./install.sh
```

The installer will show progress for each component:
- Aurorae themes (window decorations)
- Color schemes
- Kvantum themes
- Plasma desktop themes
- Look and Feel packages
- Wallpapers

#### Step 4: Apply the Theme

After installation, apply the theme using ONE of these methods:

**Method A: Using the apply script (recommended)**
```sh
./apply-theme.sh
```

**Method B: Manual application**
1. Go to **System Settings → Appearance → Global Theme**
2. Select **SWD_PSP_OS-dark**
3. Click **Apply**
4. Make sure BOTH checkboxes are selected:
   - ✓ Appearance Settings (colors, icons, plasma theme)
   - ✓ Desktop and Window Layout (panel configuration, widgets, kickoff)

#### Step 5: Apply Wallpaper (if needed)

If the wallpaper doesn't apply automatically:
```sh
./apply-wallpaper.sh
```

#### Step 6: Verify Installation

To check if everything is installed correctly:
```sh
./verify-installation.sh
```

### SDDM Theme Installation

To install the login screen theme:

For Plasma 5:
```sh
sudo ./sddm-dark/5.0/install.sh
```

For Plasma 6:
```sh
sudo ./sddm-dark/6.0/install.sh
```

## Troubleshooting

### Common Issues

#### Wallpaper not applying
1. Run `./apply-wallpaper.sh`
2. Check wallpaper path: `./verify-installation.sh`
3. Manually set wallpaper: Right-click desktop → Configure Desktop and Wallpaper → Select PSP wallpaper

#### Theme partially applied
1. Ensure both checkboxes are selected when applying theme
2. Log out and log back in
3. Run `./apply-theme.sh` again

#### Icons missing or incorrect
1. Check if Win11 icon theme is installed
2. Go to System Settings → Appearance → Icons → Select Win11

#### Panel not styled correctly
1. Right-click on panel → Enter Edit Mode
2. Adjust panel height and alignment
3. Exit Edit Mode

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
2. Select "SWD_PSP_OS-dark"
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