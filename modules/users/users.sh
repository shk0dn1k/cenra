#!/bin/bash

source ~/cenra/modules/users/data.sh

COMPANY=$(bash ~/cenra/modules/users/select_company.sh)

echo ""

case "$COMPANY" in
  "Alfa")
    echo "Users in Alfa"
    for u in "${ALFA_USERS[@]}"; do
      echo "• $u"
    done
    ;;

  "Cat-exchange")
    echo "Users in Cat-exchange"
    for u in "${CAT_USERS[@]}"; do
      echo "• $u"
    done
    ;;

  "Unknown")
    echo "Users in Unknown"
    for u in "${UNKNOWN_USERS[@]}"; do
      echo "• $u"
    done
    ;;
esac

echo ""
