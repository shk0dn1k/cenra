#!/bin/bash

echo "Installing cenra CLI..."

INSTALL_DIR="$HOME/.cenra"

mkdir -p $INSTALL_DIR/bin

cp bin/cenra $INSTALL_DIR/bin/cenra

chmod +x $INSTALL_DIR/bin/cenra

# добавляем в PATH (если нет)
if ! grep -q ".cenra/bin" ~/.zshrc 2>/dev/null; then
  echo 'export PATH=$PATH:$HOME/.cenra/bin' >> ~/.zshrc
fi

if ! grep -q ".cenra/bin" ~/.bashrc 2>/dev/null; then
  echo 'export PATH=$PATH:$HOME/.cenra/bin' >> ~/.bashrc
fi

echo ""
echo "cenra installed successfully"
echo "Run: cenra help"
