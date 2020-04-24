#!/usr/bin/env bash
#
# This script will set up your OSX or *Nix (Debian tested) system to just get on with
# focusing on editing code on the rig you are currently sitting in front of.
#
# ./boot.sh [--path=<HOME>] [--dry-run=true|false] [--skip-target=<ANY TARGET>,<ANOTHER TARGET>]

set -eo pipefail

# Icon Variables
checkmark="\033[1;32m✓\033[0m"
error="\033[1;93m✘\033[0m"
bullet="\033[1;31m•\033[0m"
warning="\033[1;36m⚠\033[0m"
blank=" "

# Defaults
HOME_DIRECTORY="$HOME"
LOG_ONLY="false"
SKIPPED_TARGETS=""

# Help Output
HELP_OUTPUT=$(cat <<-EOF
Usage: boot [options]
Example: ./boot.sh [--path=<HOME>] [--dry-run=true|false]
-h|--help|help			Display this help message
--path							Path to place to drop config files (default: $HOME_DIRECTORY)
--dry-run						Does nothing, but print what it was going to do.
--skip-target				Will ignore attempting to install or move configs for target. Comma separated list.
EOF
)

# Identify Host YMMV.
HOST_OS=$(uname)

if [[ $HOST_OS == "Linux" ]]; then
	printf "\n\xe2\x9d\xaf Starting Bootstrap Script for $HOST_OS \n"
elif [[ $HOST_OS == "Darwin" ]]; then
	printf "\n\xe2\x9d\xaf Starting Bootstrap Script for $HOST_OS \n"
else
	printf "\n\xe2\x9d\xaf This OS is not supported \n"
	printf "$HELP_OUTPUT\n"
	exit 1
fi

# Collect version information for future use.
while [[ $# -gt 0 ]]; do
	case $1 in
		-h|--help|help)
		HELP="true"
		shift
		;;
		--path=*)
		HOME_DIRECTORY=$(echo -n ${1#*=} | sed 's/,/ /g')
		shift
		;;
		--dry-run=*)
		LOG_ONLY=$(echo -n ${1#*=} | sed 's/,/ /g')
		shift
		;;
		--skip-target=*)
		OIFS=$IFS;
		IFS=",";
		sk=$(echo -n ${1#*=} | sed 's/,/ /g')
		SKIPPED_TARGETS=($sk)
		IFS=$OIFS
		shift
		;;
		*)
		printf "Unknown option $1\n"
		printf "$HELP_OUTPUT\n"
		exit 1
		shift
		;;
	esac
done

# Caller requested help. Display it now.
if [[ $HELP == "true" ]]; then
	printf "$HELP_OUTPUT\n"
	exit 0
fi

OSX_PREREQS=(
	brew
)

PREREQS=(
	git
	curl
)

TARGETS=(
	nvim
	vim
	tmux
	tig
)

# Prerequisite check is here to find either 'brew' or 'go' these are the easier
# ways to install the tools per their docs. Even though we check for cURL not
# gonna implement.
if [[ $HOST_OS == "Darwin" ]]; then
	for i in "${OSX_PREREQS[@]}"; do
		if which "$i" &> /dev/null; then

			if [[ "$LOG_ONLY" == "true" ]]; then
				printf "\n\xe2\x9d\xaf Searching for $i.\n"
			fi

			if [[ "$i" == "brew" ]]; then
				HAS_BREW="true"
			fi

			if [[ "$LOG_ONLY" == "true" ]]; then
				printf "\n\xe2\x9d\xaf Has $i.\n"
			fi
			printf "$checkmark $i\n"
		else
			if [[ "$LOG_ONLY" == "true" ]]; then
				printf "\n\xe2\x9d\xaf Dependency not found: $i.\n"
			fi
			printf "$warning $i\n"
		fi
	done
fi

for i in "${PREREQS[@]}"; do
	if which "$i" &> /dev/null; then
		if [[ "$LOG_ONLY" == "true" ]]; then
			printf "\n\xe2\x9d\xaf Searching for $i.\n"
		fi

		if [[ "$i" == "git" ]]; then
			HAS_GIT="true"
		fi

		if [[ "HAS_BREW" == "true" ]]; then
			HAS_BREW="true"
		fi

		if [[ "$i" == "curl" ]]; then
			HAS_CURL="true"
		fi

		if [[ "$LOG_ONLY" == "true" ]]; then
			printf "\n\xe2\x9d\xaf Has $i.\n"
		fi
		printf "$checkmark $i\n"
	else
		if [[ "$LOG_ONLY" == "true" ]]; then
			printf "\n\xe2\x9d\xaf Dependency not found: $i.\n"
		fi
		printf "$warning $i\n"
	fi
done

printf "\n\xe2\x9d\xaf Checking for existing dependencies.\n"
printf "\xe2\x9d\xaf Will attempt to install missing dependencies only.\n\n"

if [[ "$HAS_GIT" == "" ]]; then
	printf "\n\xe2\x9d\xaf cannot proceed without git on 'PATH'\n"
	printf "$HELP_OUTPUT\n"
	exit 1
fi

if [[ "$HAS_BREW" == "true" ]] && [[ $HOST_OS == "Darwin" ]]; then
	printf "\n\xe2\x9d\xaf This script will now install the following programs with 'brew': \n"
fi

for i in "${TARGETS[@]}"; do
	if [[ ! " ${SKIPPED_TARGETS[@]} " =~ " ${i} " ]]; then
		if [[ "$LOG_ONLY" == "true" ]]; then
			printf "\n\xe2\x9d\xaf Checking for target on PATH: $i.\n"
		fi

		if which "$i" &> /dev/null; then
			if [[ -n "$i" ]]; then
				if [[ "$LOG_ONLY" == "true" ]]; then
					printf "\n\xe2\x9d\xaf Target ($i) found will not attempt to install.\n"
				fi
				printf "$checkmark $i\n"
			else
				if [[ "$LOG_ONLY" == "true" ]]; then
					printf "\n\xe2\x9d\xaf Target ($i) not found will attempt to install.\n"
				fi
				printf "$warning $i\n"
			fi
		fi
	else
		printf "\n$warning Target skipped: $i\n"
	fi
done

# TODO
# Install things and the things the thing requires.

printf "\n\xe2\x9d\xaf $checkmark Ready To Go!!!"

exit 0

