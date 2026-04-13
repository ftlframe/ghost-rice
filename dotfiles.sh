#!/usr/bin/env bash
set -euo pipefail

# Ghost Rice — Sway rice installer (gray-purple, Ghost palette)
# Usage: ./dotfiles.sh
# Skips packages and configs that already exist.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.config/backup-pre-ghost-$(date +%Y-%m-%d)"

echo "=== Ghost Rice — Sway Installer ==="
echo ""

# --- Detect distro ---
if command -v apt &>/dev/null; then
    PKG_MGR="apt"
elif command -v dnf &>/dev/null; then
    PKG_MGR="dnf"
else
    echo "Unsupported package manager. Only apt (Ubuntu/Debian) and dnf (Fedora) are supported."
    exit 1
fi

echo "Detected package manager: $PKG_MGR"

pkg_installed() {
    if [ "$PKG_MGR" = "apt" ]; then
        dpkg -s "$1" &>/dev/null
    elif [ "$PKG_MGR" = "dnf" ]; then
        rpm -q "$1" &>/dev/null
    fi
}

echo ""
echo "=== Installing packages ==="

if [ "$PKG_MGR" = "apt" ]; then
    PKGS=(
        sway sway-notification-center swaylock swayidle
        waybar rofi wlogout fish tmux
        playerctl pavucontrol
        grim slurp wl-clipboard swappy
        eza jq ranger
        blueman network-manager-gnome
        polkit-gnome-1 gnome-keyring
    )
else
    PKGS=(
        sway swaync swaylock swayidle
        waybar rofi wlogout fish tmux
        playerctl pavucontrol
        grim slurp wl-clipboard swappy
        eza jq ranger
        blueman NetworkManager-tui
        polkit-gnome gnome-keyring
    )
fi

MISSING=()
for pkg in "${PKGS[@]}"; do
    pkg_installed "$pkg" || MISSING+=("$pkg")
done

if [ ${#MISSING[@]} -gt 0 ]; then
    echo "  Installing: ${MISSING[*]}"
    if [ "$PKG_MGR" = "apt" ]; then
        sudo apt update
        sudo apt install -y "${MISSING[@]}"
    else
        sudo dnf install -y "${MISSING[@]}"
    fi
else
    echo "  All packages already installed, skipping"
fi

# autotiling — python package
if ! command -v autotiling &>/dev/null; then
    if command -v pip3 &>/dev/null; then
        pip3 install --user autotiling || echo "NOTE: install autotiling manually"
    else
        echo "NOTE: Install autotiling: pip install autotiling"
    fi
fi

# swayr — window/workspace switcher (cargo crate, referenced in sway config)
if [ ! -x "$HOME/.cargo/bin/swayrd" ]; then
    if command -v cargo &>/dev/null; then
        cargo install swayr || echo "NOTE: swayr install failed — Super+Tab switcher will not work"
    else
        echo "NOTE: Install rust/cargo then run: cargo install swayr"
    fi
fi

# clipse — not in repos
if ! command -v clipse &>/dev/null; then
    echo "NOTE: clipse is not in apt/dnf repos."
    echo "      Install from: https://github.com/savedra1/clipse/releases"
fi

# Ghostty — not in repos
if ! command -v ghostty &>/dev/null; then
    echo "NOTE: Ghostty is not in apt/dnf repos."
    echo "      Install from: https://ghostty.org/download"
fi

# --- Fonts ---
if fc-list | grep -qi "JetBrainsMono Nerd"; then
    echo "  Fonts already installed, skipping"
else
    echo ""
    echo "=== Installing JetBrains Mono Nerd Font ==="
    mkdir -p ~/.local/share/fonts
    cp "$SCRIPT_DIR/fonts/"*.ttf ~/.local/share/fonts/
    fc-cache -f
    echo "  Font installed"
fi

# --- Starship ---
if command -v starship &>/dev/null; then
    echo "  Starship already installed, skipping"
else
    echo ""
    echo "=== Installing starship ==="
    sudo install -m 755 "$SCRIPT_DIR/bin/starship" /usr/local/bin/starship
    echo "  Starship installed"
fi

# --- Backup existing configs ---
echo ""
echo "=== Backing up existing configs to $BACKUP_DIR ==="

BACKED_UP=0
for dir in sway waybar rofi swaync fish ghostty tmux clipse wlogout swaylock; do
    if [ -d "$HOME/.config/$dir" ]; then
        mkdir -p "$BACKUP_DIR"
        cp -r "$HOME/.config/$dir" "$BACKUP_DIR/"
        echo "  Backed up $dir"
        BACKED_UP=1
    fi
done
if [ -f "$HOME/.config/starship.toml" ]; then
    mkdir -p "$BACKUP_DIR"
    cp "$HOME/.config/starship.toml" "$BACKUP_DIR/"
    BACKED_UP=1
fi
[ "$BACKED_UP" -eq 0 ] && echo "  Nothing to back up"

# --- Copy configs ---
echo ""
echo "=== Installing configs ==="

for dir in sway waybar rofi swaync fish ghostty tmux clipse wlogout swaylock; do
    if [ -d "$SCRIPT_DIR/config/$dir" ]; then
        mkdir -p "$HOME/.config/$dir"
        cp -r "$SCRIPT_DIR/config/$dir/." "$HOME/.config/$dir/"
        echo "  Installed $dir"
    fi
done

# Starship config
if [ -f "$SCRIPT_DIR/config/starship.toml" ]; then
    cp "$SCRIPT_DIR/config/starship.toml" "$HOME/.config/starship.toml"
    echo "  Installed starship.toml"
fi

# Nvim theme overlay (non-destructive — only writes theme files)
if [ -d "$SCRIPT_DIR/config/nvim" ]; then
    mkdir -p "$HOME/.config/nvim/lua/theme"
    mkdir -p "$HOME/.config/nvim/lua/plugins"
    cp "$SCRIPT_DIR/config/nvim/lua/theme/palette.lua" "$HOME/.config/nvim/lua/theme/"
    cp "$SCRIPT_DIR/config/nvim/lua/theme/highlights.lua" "$HOME/.config/nvim/lua/theme/"
    cp "$SCRIPT_DIR/config/nvim/lua/plugins/colorscheme.lua" "$HOME/.config/nvim/lua/plugins/"
    echo "  Installed nvim theme overlay"
fi

# Ensure scripts are executable
chmod +x "$HOME/.config/sway/keybinds.sh" "$HOME/.config/sway/volume-up.sh" 2>/dev/null || true

# --- displays.conf (machine-specific) ---
if [ ! -f "$HOME/.config/sway/displays.conf" ]; then
    if [ -f "$SCRIPT_DIR/config/sway/displays.conf.example" ]; then
        cp "$SCRIPT_DIR/config/sway/displays.conf.example" "$HOME/.config/sway/displays.conf"
        echo ""
        echo "NOTE: Stub displays.conf installed — EDIT IT for your monitor layout."
    else
        touch "$HOME/.config/sway/displays.conf"
    fi
fi

# --- Wallpaper ---
if [ -f "$SCRIPT_DIR/wallpaper_ghost.png" ]; then
    mkdir -p "$HOME/Pictures/wallpapers"
    if [ ! -f "$HOME/Pictures/wallpapers/wallpaper_ghost.png" ]; then
        echo ""
        echo "=== Installing wallpaper ==="
        cp "$SCRIPT_DIR/wallpaper_ghost.png" "$HOME/Pictures/wallpapers/wallpaper_ghost.png"
        echo "  Installed wallpaper_ghost.png"
    else
        echo "  Wallpaper already exists, skipping"
    fi
fi

# --- Set fish as default shell ---
if command -v fish &>/dev/null; then
    FISH_PATH="$(command -v fish)"
    if [ "$SHELL" != "$FISH_PATH" ]; then
        echo ""
        read -p "Set fish as default shell? [y/N] " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            grep -q "$FISH_PATH" /etc/shells || echo "$FISH_PATH" | sudo tee -a /etc/shells
            chsh -s "$FISH_PATH"
            echo "  Default shell set to fish"
        fi
    fi
fi

echo ""
echo "=== Done! ==="
echo ""
echo "Next steps:"
echo "  1. Edit ~/.config/sway/displays.conf for your monitor layout"
echo "  2. Install ghostty + clipse manually if missing (see notes above)"
echo "  3. Log out and select 'Sway' from your display manager"
echo ""
echo "Keybinds: Super+Enter (terminal), Super+d (launcher), Super+/ (cheatsheet)"
