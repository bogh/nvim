fish_add_path $HOME/.local/bin
fish_add_path $HOME/.opencode/bin
fish_add_path $HOME/.local/share/nvim/mason/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x EDITOR nvim
set -x SHELL /usr/bin/fish
set -x NODE_EXTRA_CA_CERTS $HOME/.npm/rootCA.pem
# set -x COMPOSE_PARALLEL_LIMIT 4

starship init fish | source

alias upstream="git push -u origin (git branch --show-current)"
alias cp='xcp'
alias ls='lsd --header --color=always --group-directories-first'

set -x SSH_AUTH_SOCK ~/.1password/agent.sock
set -x GIT_SSH /usr/bin/ssh

abbr -a p pnpm
abbr -a d docker
abbr -a lg lazygit
abbr -a ld lazydocker
abbr -a cld claude --dangerously-skip-permissions

# git
abbr -a gco "git checkout"
abbr -a gs "git status"
abbr -a gp "git push"
abbr -a gpl "git pull"

# worktrunk 
abbr -a wts "wt switch"
abbr -a wca "wt step commit --stage=all"
abbr -a nv nvim
abbr -a tx tmux

echo "BASE initialized..."
