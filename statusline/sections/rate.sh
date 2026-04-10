# Section: Rate limits (5-hour and 7-day)
render_rate() {
    local has_data=false

    if [ "$sl_rate_5h" -ge 0 ] 2>/dev/null; then
        has_data=true
        local c
        c=$(tier_color "$sl_rate_5h")
        append_line2 "${c}5h:${sl_rate_5h}%${R}"
    fi

    if [ "$sl_rate_7d" -ge 0 ] 2>/dev/null; then
        has_data=true
        local c
        c=$(tier_color "$sl_rate_7d")
        append_line2 "${c}7d:${sl_rate_7d}%${R}"
    fi
}
