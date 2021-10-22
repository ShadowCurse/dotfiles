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
set -x RUSTFLAGS DEFAULT="-C target-cpu=native"
set -x RUST_BACKTRACE 1

starship init fish | source
