set -g theme_display_virtualenv yes
set -g theme_display_user yes
set -g theme_title_display_user yes
set -g theme_display_hostname yes
set -g theme_display_sudo_user yes
set -g theme_show_exit_status yes
set -g theme_newline_cursor yes
set -g theme_display_git_default_branch yes
set -g theme_date_format "+%Y/%m/%d(%a) %H:%M:%S %Z"

set -gx RUSTUP_HOME $HOME/.rustup
set -gx CARGO_HOME $HOME/.cargo

if type -q batman
   set -gx MANPAGER env\ BATMAN_IS_BEING_MANPAGER=yes\ bash\ batman
   set -gx MANOFFOPT -c
end

if type -q lsd
   alias ls lsd
   alias la "lsd -la"
end
if type -q bat
   alias cat bat
end
if type -q fd
   alias find fd
end
if type -q rg
   alias grep rg
end

set VIRTUAL_ENV_DISABLE_PROMPT 1

if test -e ~/.config/fish/local_config.fish
    source ~/.config/fish/local_config.fish
end

if type -q fcitx5-remote
   fcitx5-remote -s keyboard-us
end