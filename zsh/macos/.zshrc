# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

ZSH_THEME="robbyrussell"

alias ll='lsd -lha --group-dirs=first'
alias cat='bat'

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'

export PATH=$HOME/.toolbox/bin:$PATH
export JAVA_HOME="/Library/Java/JavaVirtualMachines/amazon-corretto-24.jdk/Contents/Home"

alias bb="brazil-build"

load-nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
  unfunction node npm npx
}

node() { load-nvm; node "$@" }
npm()  { load-nvm; npm "$@" }
npx()  { load-nvm; npx "$@" }
nvm()  { load-nvm; nvm "$@" }

preexec() {
  echo
}

# Added by smithy-mcp
export PATH="/Users/jmcada/.config/smithy-mcp/mcp-servers:$PATH"
export NODE_OPTIONS=--openssl-legacy-provider

# Set required environment variables for brew in linux
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$($(brew --prefix)/bin/mise activate zsh)"

PROMPT='
 %F{cyan}%m%f %F{green}%n%f %F{yellow}%~%f
 %F{green}~ '


# To enable vim motions in the command prompt
bindkey -v

# Remove default meta keybindings that conflict with vi mode
bindkey -r "^[h"
bindkey -r "^[H"
bindkey -r "^[b"
bindkey -r "^[f"
bindkey -r "^[w"
bindkey -r "^[e"
bindkey -r "^[u"
bindkey -r "^[k"
bindkey -r "^[d"

# Tmux configuration
# Enable different histories for each pane
if [[ $TMUX_PANE ]]; then
  HISTFILE=$HOME/.bash_history_tmux_${TMUX_PANE:1}
fi

# Nvim configuration
export XDG_CONFIG_HOME="$HOME"

# Yazi configuration
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
export EDITOR="nvim"

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
