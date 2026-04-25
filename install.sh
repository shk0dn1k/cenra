#!/bin/bash

echo "Installing cenra..."

REPO_DIR=$(pwd)

# -------------------------
# 1. install fzf if missing
# -------------------------
if ! command -v fzf &> /dev/null; then
  echo "Installing fzf..."

  if command -v yum &> /dev/null; then
    sudo yum install -y fzf

  elif command -v apt &> /dev/null; then
    sudo apt update
    sudo apt install -y fzf

  else
    # fallback for mac / other systems
    if [ ! -d "$HOME/.fzf" ]; then
      git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
      ~/.fzf/install --all
    fi
  fi
else
  echo "fzf already installed"
fi

# -------------------------
# 2. make sure scripts exist
# -------------------------
if [ ! -f "$REPO_DIR/bin/cenra" ]; then
  echo "ERROR: bin/cenra not found"
  exit 1
fi

if [ ! -d "$REPO_DIR/modules" ]; then
  echo "ERROR: modules folder not found"
  exit 1
fi

# -------------------------
# 3. permissions
# -------------------------
chmod +x bin/cenra
chmod +x modules/users/users.sh
chmod +x modules/users/select_company.sh

# -------------------------
# 4. install binary
# -------------------------
mkdir -p ~/.cenra/bin

cp bin/cenra ~/.cenra/bin/cenra

# -------------------------
# 5. PATH (no duplicates)
# -------------------------
SHELL_RC="$HOME/.zshrc"

if [ -f "$HOME/.bashrc" ]; then
  SHELL_RC="$HOME/.bashrc"
fi

if ! grep -q ".cenra/bin" "$SHELL_RC"; then
  echo 'export PATH="$HOME/.cenra/bin:$PATH"' >> "$SHELL_RC"
  echo "PATH updated in $SHELL_RC"
else
  echo "PATH already configured"
fi

# -------------------------
# 6. done
# -------------------------
echo ""
echo "cenra installed successfully"
echo "run: cenra help"
