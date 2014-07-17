if [[ ! -o interactive ]]; then
    return
fi

compctl -K _xdo xdo

_xdo() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(xdo commands)"
  else
    completions="$(xdo completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
