function add_to_path --description 'Persistently prepends paths to your PATH'
    set -U fish_user_paths $argv $fish_user_paths
end