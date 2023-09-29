alias lsd  "eza --icons -alh"
alias ra "tmux attach-session -d -t base"
alias ran "tmux new-session -d -s base"
alias glow "glow -p"
alias latexindent.pl "latexindent"

function ls
  command eza --icons $argv
end

if not set -q TMUX 
  and test "$TERM_PROGRAM" != "vscode" 
  and test "$TERM_PROGRAM" != "Jetbrains.Fleet"
  and test "$TERM_PROGRAM" != "\"intellij\""
    set -g TMUX ran
    eval $TMUX
	ra
end

oh-my-posh --init --shell fish --config $(brew --prefix oh-my-posh)/themes/bubblesextra.omp.json | source

# pnpm
set -gx PNPM_HOME "/Users/chazzox/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

set -gx CPATH "/Library/Developer/CommandLineTools/SDKs/MacOSX11.1.sdk/System/Library/Perl/5.28/darwin-thread-multi-2level/CORE"
set -gx EDITOR "nvim"

# jfrog env settings 
set -gx EMAIL "charlie.aylott@matillion.com"
set -gx JFROG_PLATFORM_READ_USER "$EMAIL"
set -gx JFROG_PLATFORM_READ_TOKEN ""
set -gx JFROG_PLATFORM_READ_TOKEN_BASE64 "$(echo -n $JFROG_PLATFORM_READ_TOKEN | base64)" 
