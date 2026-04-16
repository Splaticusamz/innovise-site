#!/bin/bash

echo "Running my custom local setup..."


# Setup bash-git-prompt for the node user
echo "Installing bash-git-prompt..."
# Clone bash-git-prompt if it isn't already there
if [ ! -d "$HOME/.bash-git-prompt" ]; then
  git clone https://github.com/magicmonty/bash-git-prompt.git \
    "$HOME/.bash-git-prompt" --depth=1
fi

# Append config to ~/.bashrc if it's not already present
if ! grep -q 'bash-git-prompt/gitprompt.sh' "$HOME/.bashrc" 2>/dev/null; then
  cat >> "$HOME/.bashrc" <<'EOF'
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source "$HOME/.bash-git-prompt/gitprompt.sh"
fi
GIT_PROMPT_THEME=Solarized
GIT_PROMPT_IGNORE_STASH=1
EOF
fi

# Add DeleteMergedBranches function to ~/.bashrc if it's not already there
if ! grep -q 'function DeleteMergedBranches' "$HOME/.bashrc" 2>/dev/null; then
  cat >> "$HOME/.bashrc" <<'EOF'

function DeleteMergedBranches() {
    local branches_to_keep="development|staging|qa|production"
    # Fetch latest from remote to ensure branch list is up-to-date
    git fetch --prune

    # Get branches that have been merged into current branch, excluding protected ones and the current branch itself
    local merged_branches=$(git branch --merged | grep -vE "^\*|^\s*($branches_to_keep)$")

    if [[ -n "$merged_branches" ]]; then
        echo "These branches will be deleted:"
        echo "$merged_branches"
        echo -n "Proceed? (y/n): "
        read -r answer
        if [ "$answer" = "y" ]; then
            echo "$merged_branches" | xargs -n 1 git branch -d
        else
            echo "Abort."`
        fi
    else
        echo "No branches to delete."
    fi
}
EOF
fi

# Larger history buffers; ignore shell-integration / option-dump noise in shared HISTFILE
if ! grep -Fq "set +o *:set -o *" "$HOME/.bashrc" 2>/dev/null; then
  cat >> "$HOME/.bashrc" <<'EOF'

export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTIGNORE='set +o *:set -o *'
EOF
fi

sudo chsh -s $(which bash) $(whoami)

git config --global user.email "loren@goinnovise.com"
git config --global core.editor "vim"
git config --global credential.helper store



echo "Custom setup finished!"


