#!/bin/bash

# Configuration
SEARCH_PATHS=(
    ~/projects
    ~/tools
    ~/.config
)

EXCLUDE_PATTERNS=(
    "*/.git"
    "*/node_modules"
)

if [ x"$ROFI_RETV" = x"1" ] || [ x"$ROFI_RETV" = x"2" ]
then
   coproc ( alacritty --working-directory "$@" > /dev/null 2>&1 )
   exit 0
fi

# Build exclusion arguments for fd
build_fd_exclusions() {
    local exclusions=()
    for pattern in "${EXCLUDE_PATTERNS[@]}"; do
        # Remove leading */ if present for fd
        local clean_pattern="${pattern#\*/}"
        exclusions+=(--exclude "$clean_pattern")
    done
    echo "${exclusions[@]}"
}

# Build exclusion arguments for find
build_find_exclusions() {
    local exclusions=()
    for pattern in "${EXCLUDE_PATTERNS[@]}"; do
        exclusions+=(-path "$pattern" -o)
    done
    # Remove the last -o
    if [ ${#exclusions[@]} -gt 0 ]; then
        unset 'exclusions[-1]'
    fi
    echo "${exclusions[@]}"
}

# Use fd if available (much faster), otherwise fall back to find
if command -v fd &> /dev/null; then
    exclusions=$(build_fd_exclusions)
    fd --type d --hidden --no-ignore $exclusions . "${SEARCH_PATHS[@]}"
else
    exclusions=$(build_find_exclusions)
    if [ -n "$exclusions" ]; then
        find "${SEARCH_PATHS[@]}" \( $exclusions \) -prune -o -type d -print
    else
        find "${SEARCH_PATHS[@]}" -type d -print
    fi
fi
