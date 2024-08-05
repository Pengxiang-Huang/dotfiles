

source ~/.gitprompt.sh

PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[92m\]\u\[\e[0m\]@\[\e[38;5;99m\]\h\[\e[0m\]${PS1_CMD1}:\[\e[93m\]\w\[\e[0m\]   ⏱️ \A\n\[\e[92m\]\\$\[\e[0m\] '

# alias information 
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias nl="nvim -c':e#<1'"
alias nold='nvim -c "Telescope oldfiles"'
alias pd="popd &> /dev/null"
