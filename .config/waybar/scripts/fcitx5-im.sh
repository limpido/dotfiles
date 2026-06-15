#!/usr/bin/env bash
# Waybar custom module: current fcitx5 input method (return-type: json).
im="$(fcitx5-remote -n 2>/dev/null)"

case "$im" in
    "")
        # fcitx5 not running / no answer
        printf '{"text":"","tooltip":"fcitx5 not running","class":"off"}\n'
        ;;
    keyboard-us|keyboard-en*|keyboard-uk)
        printf '{"text":"EN","tooltip":"%s","class":"latin"}\n' "$im"
        ;;
    rime)
        printf '{"text":"中","tooltip":"Rime","class":"cjk"}\n'
        ;;
    mozc|anthy|kkc)
        printf '{"text":"あ","tooltip":"%s","class":"cjk"}\n' "$im"
        ;;
    hangul)
        printf '{"text":"한","tooltip":"Hangul","class":"cjk"}\n'
        ;;
    *)
        printf '{"text":"%s","tooltip":"%s","class":"other"}\n' "$im" "$im"
        ;;
esac
