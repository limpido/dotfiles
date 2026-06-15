#!/usr/bin/env python3
"""Waybar custom module: one dot per window on the focused niri workspace.

Empty circle (○) = unfocused window, filled circle (●) = focused window.
Dots are ordered left-to-right by their position in niri's scrolling layout.
Stays alive on niri's event-stream and reprints on every change.

Output uses Pango markup so the focused dot can be colored independently
(Catppuccin Mocha: empty = overlay0, focused = mauve).
"""
import json
import subprocess
import sys

EMPTY = "○"
FULL = "●"
COLOR_EMPTY = "#6c7086"   # overlay0
COLOR_FULL = "#cba6f7"    # mauve


def niri_json(*args):
    try:
        out = subprocess.run(
            ["niri", "msg", "--json", *args],
            capture_output=True, text=True, check=True,
        ).stdout
        return json.loads(out)
    except Exception:
        return None


def focused_workspace_id():
    wss = niri_json("workspaces") or []
    for w in wss:
        if w.get("is_focused"):
            return w["id"]
    for w in wss:
        if w.get("is_active"):
            return w["id"]
    return None


def sort_key(w):
    pos = (w.get("layout") or {}).get("pos_in_scrolling_layout")
    if pos:
        return (0, pos[0], pos[1])
    return (1, w.get("id", 0), 0)  # floating / unplaced windows go last


def emit():
    ws = focused_workspace_id()
    wins = niri_json("windows") or []
    if ws is not None:
        wins = [w for w in wins if w.get("workspace_id") == ws]
    wins.sort(key=sort_key)

    parts = []
    for w in wins:
        if w.get("is_focused"):
            parts.append(f"<span color='{COLOR_FULL}'>{FULL}</span>")
        else:
            parts.append(f"<span color='{COLOR_EMPTY}'>{EMPTY}</span>")
    print(" ".join(parts), flush=True)


def main():
    emit()
    try:
        proc = subprocess.Popen(
            ["niri", "msg", "event-stream"],
            stdout=subprocess.PIPE, text=True,
        )
    except Exception:
        return
    for _ in proc.stdout:
        emit()


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        sys.exit(0)
