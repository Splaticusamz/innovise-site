#!/bin/bash

# Script which offers to setup local developer customizations and also authenticate them into development services.

# Check for and install personalized extensions if specified by developer.
EXTENSIONS_FILE=".devcontainer/extensions.local"

# Function to wait for the VS Code IPC to be ready. Needed for installing extensions.
wait_for_code_shim() {
  local retries=30
  local wait_time=1
  echo "  Waiting for VS Code IPC..."
  
  # Auto-discover Cursor/VS Code server CLI if generic shim is failing
  if which code >/dev/null && [ "$(which code)" = "/usr/local/bin/code" ]; then
      local cursor_cli_dir=$(ls -d "$HOME/.cursor-server/bin/"*"/bin/remote-cli" 2>/dev/null | head -n 1)
      if [ -n "$cursor_cli_dir" ] && [ -d "$cursor_cli_dir" ]; then
          export PATH="$cursor_cli_dir:$PATH"
      fi
  fi
  
  for ((i=1; i<=retries; i++)); do
    # Dynamic discovery: check for a working socket in every iteration
    if [ -z "$VSCODE_IPC_HOOK_CLI" ] || ! code --list-extensions >/dev/null 2>&1; then
        # Try the 3 most recent sockets
        for socket in $(ls -t /tmp/vscode-ipc-*.sock 2>/dev/null | head -n 3); do
            export VSCODE_IPC_HOOK_CLI="$socket"
            if code --list-extensions >/dev/null 2>&1; then
                echo "  ✅ VS Code IPC ready."
                return 0
            fi
        done
        # Reset if none worked to avoid stuck invalid value
        unset VSCODE_IPC_HOOK_CLI
    else
       echo "  ✅ VS Code IPC ready."
       return 0
    fi
    
    echo "  Waiting for VS Code IPC... ${i}/${retries}"
    sleep "$wait_time"
  done
  
  echo "  ⚠️  VS Code IPC not ready after ${retries}s. Extension installation might fail."
  return 1
}

install_ext() {
  local ext="$1"
  # Run directly to show output/errors
  code --install-extension "$ext" --force || echo "  ❌ Failed to install $ext"
}

echo "----------------------------------------------------------------"
echo "Setting up local developer extensions..."

if [ -f "$EXTENSIONS_FILE" ]; then
    echo "  Found local extensions file: $EXTENSIONS_FILE"
    
    # Need to make sure this script is connected to Cursor before installing extensions.
    wait_for_code_shim
    
    while IFS= read -r ext; do
        echo "  Installing extension: $ext"
        install_ext "$ext"
    done < "$EXTENSIONS_FILE"
    
    echo "  ✅ Local extensions installed."

else
    echo "  No local extensions file found, which is fine for most users"
    echo "  If you'd like to add your own extensions, create a .devcontainer/extensions.local file"
fi


SETUP_FILE=".devcontainer/setup.local.sh"

echo "----------------------------------------------------------------"
echo "Setting up local developer customizations..."
if [ -f "$SETUP_FILE" ]; then
    echo "  Found local setup script: $SETUP_FILE"
    echo "  Running local setup..."
    
    # Ensure the script is executable
    chmod +x "$SETUP_FILE"
    
    # Run the script
    bash "$SETUP_FILE"
    
    echo "  ✅ Local setup completed."
else
    echo "  No local setup script found (.devcontainer/setup.local.sh)."
    echo "  If you want to run custom setup (e.g. install zsh), create this file."
    :
fi


echo "----------------------------------------------------------------"
echo "Welcome! To finish setup:"
echo " npm run dev - to start the Astro development server (http://localhost:4321)"
echo " npm run build - to build for production"
echo " npm run preview - to preview the production build"


echo "----------------------------------------------------------------"
echo "Git configuration: If you're prompted to enter your git credentials, enter them into VS Code (one-time per container build)."
echo "----------------------------------------------------------------"


