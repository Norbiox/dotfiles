# i3 (X11) → sway (Wayland) migration

Hardware: Dell laptop, Intel UHD (i915) drives all displays, NVIDIA T600 is
render-offload only (`prime-run`). Sway runs entirely on the iGPU — no
`--unsupported-gpu`, no NVIDIA-Wayland pain. All displays hang off `card1`
(eDP-1 + DP-6/7/8).

## What changed (done)

Scripts are **backward-compatible**: they detect the session
(`$WAYLAND_DISPLAY` / `$XDG_SESSION_TYPE`) and pick the right tool, so they keep
working under both i3 and sway.

New helper wrappers in `.scripts/`:

| Helper       | Wayland          | X11                  | Replaces            |
|--------------|------------------|----------------------|---------------------|
| `clipcopy`   | wl-copy          | xclip -sel clipboard | `xclip` (copy)      |
| `clippaste`  | wl-paste -p      | xclip -o             | `xclip -o` (primary)|
| `wmmsg`      | swaymsg          | i3-msg               | `i3-msg`            |
| `lock`       | swaylock         | betterlockscreen     | lock screen         |
| `screenshot` | grim/slurp/satty | scrot/flameshot      | screenshot          |
| `setbg`      | swaybg           | xwallpaper           | wallpaper           |

Edited to use the wrappers / session detection:
`menu-emoji`, `menu-handler`, `menu-jitsi`, `menu-meet`, `linkhandler`
(clipboard); `menu-workspaces`, `bring_*_workspace*`, `i3exit.sh` (IPC);
`spawn_dropdown` (sway `app_id`+swaymsg / i3 `instance`+i3-msg);
`menu-screens` + `menu-autorandr` (kanshi `kanshictl switch` / autorandr).

New configs:
- `.config/sway/config` — translated from `.config/i3/config`. Colors inlined
  (no Xresources), picom dropped, autorandr→kanshi, xss-lock→swayidle,
  betterlockscreen→swaylock, scrot/flameshot→grim, unclutter/numlockx via sway
  input, clipman→cliphist. Validated with `sway --validate`.
- `.config/kanshi/config` — display profiles (autorandr replacement).

Packages added to `.scripts/install/base.sh` (sway, swaybg, swayidle, swaylock,
kanshi, grim, slurp, swappy, wl-clipboard, wmenu, gammastep, xdg-desktop-portal-*,
autotiling, cliphist, satty).

## Manual steps still required

1. **Verify kanshi outputs.** `.config/kanshi/config` uses connector names
   `DP-6/7/8` from current wiring — confirm and reorder with
   `swaymsg -t get_outputs`. For dock stability switch to EDID descriptions.
2. **Launch sway.** From a TTY: `exec sway` in `~/.bash_profile`, or add a
   session entry for a display manager. Ensure `.profile` is sourced so PATH +
   `TERMINAL_CMD`/`DMENU_COMMAND` are set inside the sway session.
3. **Third-party dmenu tools** (`dmenu-bluetooth`, `networkmanager_dmenu`) are
   X11 dmenu-based. On Wayland point them at `wmenu`/`wofi` (set
   `$DMENU_COMMAND`/`$DMENU_BLUETOOTH_LAUNCHER`, or the nmcli-dmenu config).
   The `menu` wrapper already branches to `wmenu` — own scripts are fine.
4. **Wacom** — intentionally skipped. `wacom-setup`/`menu-wacom` stay X11-only
   (`xsetwacom` has no Wayland equivalent for pad button keymaps). Stylus
   `map_to_output` can be done later via sway `input ... map_to_output`.
5. **swaybar tray** — confirm `blueman-applet`/`nm-applet`/`pasystray` show in
   the tray; otherwise install a tray-capable bar or use waybar.
