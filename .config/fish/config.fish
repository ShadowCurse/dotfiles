if status is-interactive
    # Commands to run in interactive sessions can go here
end

function vim
  nvim $argv
end

function l
  exa -lah --color=always --icons $argv
end

function ll
  exa -lah --color=always --icons $argv
end

set -x CARGO_INCREMENTAL 1
set -x RUST_BACKTRACE 1

starship init fish | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/antaraz/.ghcup/bin $PATH # ghcup-env