

source ~/.gitprompt.sh

PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[92m\]\u\[\e[0m\]@\[\e[38;5;99m\]\h\[\e[0m\]${PS1_CMD1}:\[\e[93m\]\w\[\e[0m\]   ⏱️ \A\n\[\e[92m\]\\$\[\e[0m\] '

# alias information 
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias nl="nvim -c':e#<1'"
alias nold='nvim -c "Telescope oldfiles"'
alias pd="popd &> /dev/null"
# alias information for the local machine
# alias ssh_p="ssh tht5102@peroni.cs.northwestern.edu"
# alias ssh_to_scratch='ssh -t tht5102@peroni.cs.northwestern.edu "cd /nfs-scratch/tht5102 ; bash --login"'
# alias ssh_l="ssh penn@penn-OMEN.local"
# alias ll="eza -lh --group-directories-first --icons --total-size --sort=size --color=always" # requires eza, and overwriting ohmyzsh if needed
