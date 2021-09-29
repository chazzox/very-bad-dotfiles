if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ls="ls -Ga --color=auto"
alias audio="ncpamixer"

oh-my-posh --init --shell fish --config ~/.poshthemes/marcduiker.omp.json | source
