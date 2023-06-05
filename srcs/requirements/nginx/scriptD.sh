#!/bin/bash

RED="\033[1;31m"
GREEN="\033[1;32m"
RESET="\033[0m"

if [ $# -eq 0 ]; then
	echo -e "${RED}no input${RESET}"
	exit 1;
fi

function usage {
        echo "./$(basename "$0") -l --> shows usage"
}

optstring=":l"

while getopts ${optstring} arg; do
	case ${arg} in
        l)
        	if [ "$2" == "" ]; then
        		echo "no image linked"
        		exit 1;
        	fi
			docker load -i "$2".tar
			exit 0;
            ;;
        :)
            echo "\$0: Must supply an argument to -$OPTARG." >&2
            exit 1
            ;;
        ?)
            echo "Invalid option: -${OPTARG}."
            exit 2
            ;;	esac
done

if docker images "$1" | grep -q -F -- "$1"; then
   	echo -e "\n${GREEN}it's already exist${RESET}"
else
	echo -e "\n${RED}it's doesn't exist${RESET}"
	docker build -t "$1" -f Dockerfile .
	docker run --rm "$1"
	echo -e "\n${GREEN}it's a success${RESET}"
	docker commit "$1" "my-tagged-image"
	docker save "my-tagged-image" -o "$1".tar
fi
