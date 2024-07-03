set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"
set -g theme_display_virtualenv yes
set -g theme_display_user yes
set -g theme_title_display_user yes
set -g theme_display_hostname yes
set -g theme_display_sudo_user yes
set -g theme_show_exit_status yes
set -g theme_newline_cursor yes
set -g theme_display_git_default_branch yes

set -gx RUSTUP_HOME $HOME/.rustup
set -gx CARGO_HOME $HOME/.cargo

alias ls lsd
alias cat bat
alias find fd
alias grep rg
alias la "lsd -la"
set VIRTUAL_ENV_DISABLE_PROMPT 1

if test -e ~/.config/fish/local_config.fish
    source ~/.config/fish/local_config.fish
end
