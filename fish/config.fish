alias lsd  "exa --icons -alh"
alias ra "tmux attach-session -d -t base"
alias ran "tmux new-session -d -s base"
alias glow "glow -p"
alias latexindent.pl "latexindent"

function ls
  command exa --icons $argv
end

if not set -q TMUX 
  and test "$TERM_PROGRAM" != "vscode"
    set -g TMUX ran
    eval $TMUX
	ra
end

oh-my-posh --init --shell fish --config $(brew --prefix oh-my-posh)/themes/bubblesextra.omp.json | source

# pnpm
set -gx PNPM_HOME "/Users/chazzox/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

set -gx CPATH "/Library/Developer/CommandLineTools/SDKs/MacOSX11.1.sdk/System/Library/Perl/5.28/darwin-thread-multi-2level/CORE"
set -gx EDITOR "nvim"
