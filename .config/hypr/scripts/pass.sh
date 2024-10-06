#!/bin/bash

shopt -s nullglob globstar

# get all the saved password files
prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=("$prefix"/**/*.gpg)
password_files=("${password_files[@]#"$prefix"/}")
password_files=("${password_files[@]%.gpg}")

# Exclude specific passwords or patterns
exclude_patterns=("docker-credential-helpers") # Update these with the passwords you want to exclude

# Use mapfile (or readarray) to filter out excluded patterns
for pattern in "${exclude_patterns[@]}"; do
  mapfile -t password_files < <(printf '%s\n' "${password_files[@]}" | grep -v "$pattern")
done

# Show a list of all password files and save the selected one in a variable
password=$(printf '%s\n' "${password_files[@]}" | rofi -dmenu "$@")
[[ -n $password ]] || exit

pass show -c "$password" | head -n1 2>/dev/null
