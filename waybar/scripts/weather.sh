#!/bin/bash

WEATHER_API="wttr.in"
TIMEOUT=5

fetch_weather() {
    local format=$1
    timeout "$TIMEOUT" curl -s "$WEATHER_API/?format=$format" 2>/dev/null
}

main() {
    local weather_data=$(fetch_weather "%c+%t")
    local weather_tooltip=$(fetch_weather "%C+%t+%w+%h")

    if [[ -z "$weather_data" ]]; then
        echo '{"text": "N/A", "tooltip": "Weather service unavailable"}'
    else
        echo "{\"text\": \"$weather_data\", \"tooltip\": \"$weather_tooltip\"}"
    fi
}

main
