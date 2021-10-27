function dclearunused --description 'Clean docker images from local engine'
    set -l sha (docker images | grep none | awk 'FNR > 1 {print $3}')
    for purgeSha in $sha
        docker rmi $purgeSha
    end
end

function volumepurge --description 'Clean docker volumes'
    docker system prune -af --volumes
end

function dce --description 'Run exec within Docker Compose'
    set -l COMMAND $argv
    set -l SERVICE (string split -r -m1 "/" -- $PWD)[2]
    docker-compose exec $SERVICE $COMMAND
end

function dcu --description 'Run \'up\' Docker Compose command'
    set -l SERVICE_DIR (pwd)
    set -l SERVICE (string split -r -m1 "/" -- $SERVICE_DIR)[2]
    docker-compose stop $SERVICE ;and docker-compose rm -f $SERVICE
    docker-compose up -d
end

function dc_shell --description 'Run a bash shell in the target container'
    set -l SERVICE_DIR (pwd)
    set -l SERVICE (string split -r -m1 "/" -- $SERVICE_DIR)[2]
    set -l SHELL /bin/sh
    docker exec -it $SERVICE $SHELL
end

function dc_setup --description 'The following can be used to bootstrap a service'
  set -l SERVICE_DIR (pwd)
  set -l SERVICE (string split -r -m1 "/" -- $SERVICE_DIR)[2]
  docker stop $SERVICE
  docker rm $SERVICE
  docker-compose stop $SERVICE
end

function dc_setdown
  docker stop "$argv"
  docker rm "$argv"
  docker-compose stop "$argv"
end

function dc_restart
  docker stop "$argv"
  docker rm "$argv"
  docker-compose up -d
end

function dc_rebuild
    docker-compose build "$argv"
    and docker-compose stop "$argv"
    and docker-compose up -d "$argv"
end

function dc_cycle
    docker-compose stop "$argv"
    and docker-compose up -d "$argv"
end

function dc_clean
    docker rm "(docker ps -a -q)"
    docker rmi "(docker images -q -f dangling=true)"
end

function dc_nuke
    docker kill eval (docker ps -q)
    docker rm eval (docker ps -a -q)
    docker rmi eval (docker images -q)
end

function dc_ports
    docker ps --filter name=$argv --format "{{.Names}}: {{.Ports}}"
end

function dc --description 'Docker compose command'
  switch $argv[1]
    case shell
      dc_shell
    case clean
      dc_clean
    case ps
      docker-compose ps | rg -v DISABLED
    case setup
      dc_setup "$argv[2..-1]"
    case setdown
      dc_setdown "$argv[2..-1]"
    case restart
      dc_restart "$argv[2..-1]"
    case console
      dc_console "$argv[2..-1]"
    case cycle
      dc_cycle "$argv[2..-1]"
    case nuke
      dc_nuke
    case ports
      dc_ports $argv[2..-1]
    case rebuild
      dc_rebuild "$argv[2..-1]"
    case '*'
      docker-compose $argv[1..-1]
  end
end