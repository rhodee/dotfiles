function remove_from_path --description 'Permanently remove paths from PATH'
  if set -l index (contains -i $argv[1] $PATH)
    set --erase -U fish_user_paths[$index]
  else
    echo "$argv[1] not found in PATH: $PATH"
  end
end