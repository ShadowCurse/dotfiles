if status is-interactive
    # Commands to run in interactive sessions can go here
end

function vim
  nvim $argv
end

function l
  eza -lah --color=always --icons $argv
end

function ll
  eza -lah --color=always --icons $argv
end

set -gx PATH $HOME/.local/bin $PATH

set -x CARGO_INCREMENTAL 1
set -x RUST_BACKTRACE 1
set -gx PATH $HOME/.cargo/bin $PATH

fish_vi_key_bindings
set fish_greeting
direnv hook fish | source
starship init fish | source

# set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/antaraz/.ghcup/bin $PATH # ghcup-env

if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
  fenv source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
end
