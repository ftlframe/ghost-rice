# Ghost Rice

A gray-purple Sway rice with distinct accent hues. Portable dotfiles bundle for Fedora (dnf) and Ubuntu (apt).

## What's included

| Component | Path | Description |
|-----------|------|-------------|
| Sway | `config/sway/` | Tiling WM — autotiling, swayr |
| Waybar | `config/waybar/` | Dual bar — top + bottom |
| Rofi | `config/rofi/` | App launcher (3-column grid) |
| swaync | `config/swaync/` | Notification center |
| Clipse | `config/clipse/` | TUI clipboard manager |
| wlogout | `config/wlogout/` | Power menu |
| swaylock | `config/swaylock/` | Lock screen |
| Fish | `config/fish/` | Shell with auto-tmux |
| Starship | `config/starship.toml` | Minimal prompt (`┌── ... └─ λ`) |
| Ghostty | `config/ghostty/` | Terminal emulator |
| tmux | `config/tmux/` | Terminal multiplexer — Ctrl+Space prefix, vim keybinds |
| Neovim | `config/nvim/` | Theme overlay only — palette + highlights + colorscheme plugin |
| Fonts | `fonts/` | JetBrainsMono Nerd Font + Material Symbols |

## Color palette — Ghost

Gray-purple base with distinct accent hues:

| Role | Hex | Usage |
|------|-----|-------|
| Background | `#0c0b10` | Near-black, purple tint |
| Surface | `#17151e` / `#221f2b` | UI overlays |
| Text | `#c4bdd4` | Washed lavender |
| Lilac | `#a899cc` | Primary accent — borders, active, keywords |
| Ghost Pink | `#d4a8b8` | Function calls, highlights |
| Steel Blue | `#7ea0b8` | Types, parameters |
| Sage Green | `#a8c4a0` / `#85b594` | Strings, git-add |
| Muted Amber | `#c4a87a` | Warnings, clock |
| Teal | `#7aab9a` | Links, valid paths |
| Dim | `#584f6a` | Comments |
| Red | `#c46878` | Errors |

## Install

```bash
git clone <this-repo>
cd ghost-rice
./dotfiles.sh
```

The installer will:
1. Detect your package manager (apt or dnf)
2. Install dependencies
3. Back up existing configs to `~/.config/backup-pre-ghost-<date>/`
4. Copy all configs to `~/.config/`
5. Install fonts and starship if missing
6. Overlay the nvim theme (non-destructive)
7. Install wallpaper to `~/Pictures/wallpapers/wallpaper_ghost.png`
8. Optionally set fish as default shell

## Post-install

1. **Monitors** — edit `~/.config/sway/displays.conf` (a stub is installed from `displays.conf.example`):
   ```
   output eDP-1 pos 0 0 res 1920x1080
   workspace 1 output eDP-1
   ```
2. **Ghostty & clipse** — install manually; neither is in apt/dnf repos.
3. **Neovim** — requires LazyVim already set up. The installer only drops theme files.
4. Log out and select **Sway** from your display manager.

## Manual installs (not in repos)

- **Ghostty** — https://ghostty.org/download
- **clipse** — https://github.com/savedra1/clipse/releases
- **autotiling** — `pip install --user autotiling`
- **swayr** — `cargo install swayr`

## Keybinds

Press `Super+/` for the searchable cheatsheet.

| Bind | Action |
|------|--------|
| `Super+Enter` | Terminal (ghostty) |
| `Super+d` | App launcher (rofi) |
| `Super+q` | Kill window |
| `Super+p` | Power menu (wlogout) |
| `Super+e` | File explorer (ghostty+ranger) |
| `Super+c` | Clipboard (clipse) |
| `Super+n` | Notification center |
| `Super+Tab` | Window switcher (swayr) |
| `Super+/` | Keybind cheatsheet |
| `Super+hjkl` | Focus movement |
| `Super+Shift+hjkl` | Move window |
| `Super+Ctrl+hjkl` | Resize (vim-style) |
| `Super+1-0` | Switch workspace |
| `Print` | Screenshot (grim+slurp+swappy) |
