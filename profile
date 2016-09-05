# bash.
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# zsh.
if [ -n "$ZSH" ]; then
    # include .zshrc if it exists
    if [ -f "$HOME/.zshrc" ]; then
	. "$HOME/.zshrc"
    fi
fi

# Set PATH so it includes user's private bin directories.
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH=~/.npm-global/bin:$PATH
export PATH=~/.config/composer/vendor/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH

export LANGUAGE="fr:en"
export LC_MESSAGES="fr_FR.UTF-8"
export LC_CTYPE="fr_FR.UTF-8"
export LC_COLLATE="fr_FR.UTF-8"
