if status is-interactive

    # Auto-start tmux — each terminal gets its own session
    # Clean up detached sessions from closed terminals
    if command -q tmux; and not set -q TMUX
        for sess in (tmux list-sessions -F '#{session_name}:#{session_attached}' 2>/dev/null | string match -r '^(.+):0$' | string replace -r ':0$' '')
            tmux kill-session -t $sess
        end
        tmux new-session
    end

    # No greeting
    set fish_greeting

    # PATH additions
    fish_add_path $HOME/.cargo/bin
    fish_add_path $HOME/.local/bin

    # Ghost theme (gray-purple with distinct hues)
    set -g fish_color_normal c4bdd4           # default text
    set -g fish_color_command a899cc --bold   # commands (lilac)
    set -g fish_color_keyword a899cc --bold   # keywords (lilac)
    set -g fish_color_error c46878 --bold     # errors (red)
    set -g fish_color_param 7ea0b8            # parameters (steel blue)
    set -g fish_color_option c4a87a           # options (amber)
    set -g fish_color_quote a8c4a0            # strings (sage green)
    set -g fish_color_comment 584f6a          # comments
    set -g fish_color_autosuggestion 584f6a   # autosuggestions
    set -g fish_color_valid_path 7aab9a --underline  # valid paths (teal)
    set -g fish_pager_color_prefix a899cc --bold     # completion prefix
    set -g fish_pager_color_completion c4bdd4         # completions
    set -g fish_pager_color_description 584f6a        # completion descriptions
    set -g fish_pager_color_selected_background --background=221f2b

    # Use starship
    starship init fish | source

    # Aliases
    alias clear "printf '\033[2J\033[3J\033[1;1H'" # fix: kitty doesn't clear properly
    alias celar "printf '\033[2J\033[3J\033[1;1H'"
    alias claer "printf '\033[2J\033[3J\033[1;1H'"
    alias ls 'eza --icons'
    alias pamcan 'sudo dnf'
    alias q 'qs -c ii'
end
