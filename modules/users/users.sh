#!/bin/bash

source ~/cenra/modules/users/data.sh

# -------------------------
# 1. select company (fzf)
# -------------------------
COMPANY=$(printf "Alfa\nCat-exchange\nUnknown" | fzf \
  --prompt="Select company > " \
  --height=10)

[ -z "$COMPANY" ] && exit 0

# -------------------------
# 2. build users list
# -------------------------
case "$COMPANY" in
  "Alfa")
    USERS=("${ALFA_USERS[@]}")
    ;;
  "Cat-exchange")
    USERS=("${CAT_USERS[@]}")
    ;;
  "Unknown")
    USERS=("${UNKNOWN_USERS[@]}")
    ;;
esac

# -------------------------
# 3. select user (fzf)
# -------------------------
USER=$(printf "%s\n" "${USERS[@]}" | fzf \
  --prompt="Select user > " \
  --height=10)

[ -z "$USER" ] && exit 0

# -------------------------
# 4. output user data
# -------------------------
echo ""
echo "User data"
echo "----------------"
echo "Company: $COMPANY"
echo "User:    $USER"
echo "Status:  ACTIVE"
echo "Role:    MEMBER"
echo ""
