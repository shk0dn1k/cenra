#!/bin/bash

printf "Alfa\nCat-exchange\nUnknown" | fzf \
  --prompt="Select company > " \
  --height=10
