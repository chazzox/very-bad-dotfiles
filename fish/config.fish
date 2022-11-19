alias ls  "exa --icons"
alias lsd  "exa --icons -alh"
alias ra "tmux attach-session -d -t base"
alias ran "tmux new-session -d -s base"
alias glow "glow -p"
alias latexindent.pl "latexindent"

if not set -q TMUX 
  and test "$TERM_PROGRAM" != "vscode"
    set -g TMUX ran
    eval $TMUX
	ra
end

oh-my-posh --init --shell fish --config ~/aliens.omp.json | source

# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 364A82
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7


# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow set -g fish_color_redirection $foreground set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment


# pnpm
set -gx PNPM_HOME "/Users/chazzox/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

set -gx CPATH "/Library/Developer/CommandLineTools/SDKs/MacOSX11.1.sdk/System/Library/Perl/5.28/darwin-thread-multi-2level/CORE"
set -gx EDITOR "nvim"
