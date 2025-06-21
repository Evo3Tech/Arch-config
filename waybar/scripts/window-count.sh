#!/bin/bash

get_window_count() {
    if command -v hyprctl &>/dev/null; then
        hyprctl clients -j 2>/dev/null | jq length 2>/dev/null || \
        hyprctl clients 2>/dev/null | grep -c "class:" 2>/dev/null
    else
        echo "0"
    fi
}

main() {
    local count=$(get_window_count)
    echo "{\"text\": \"$count\"}"
}

main
