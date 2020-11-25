function remove_from_path --description 'Remove path by name'
  if set -l ind (contains -i -- $argv[1] $fish_user_paths)
    set -e fish_user_paths[$ind]
  end
end