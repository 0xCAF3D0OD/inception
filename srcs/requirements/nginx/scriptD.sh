#!/bin/bash
#
#RED="\033[1;31m"
#GREEN="\033[1;32m"
#RESET="\033[0m"
#
#if [ $# -eq 0 ]; then
#	echo -e "${RED}no input${RESET}"
#	exit 1;
#fi
#
#function usage {
#        echo "./$(basename "$0") -l --> shows usage"
#}
#
#optstring=":l"
#
#while getopts ${optstring} arg; do
#	case ${arg} in
#        l)
#        	if [ "$2" == "" ]; then
#        		echo "no image linked"
#        		exit 1;
#        	fi
#			docker load -i "$2".tar
#			exit 0;
#            ;;
#        :)
#            echo "\$0: Must supply an argument to -$OPTARG." >&2
#            exit 1
#            ;;
#        ?)
#            echo "Invalid option: -${OPTARG}."
#            exit 2
#            ;;	esac
#done
#
#if docker images "$1" | grep -q -F -- "$1"; then
#   	echo -e "\n${GREEN}it's already exist${RESET}"
#else
#	echo -e "\n${RED}it's doesn't exist${RESET}"
#	docker build -t "$1" -f Dockerfile .
#	docker run "$1"
#	echo -e "\n${GREEN}it's a success${RESET}"
#	image=$(docker ps -lq)
#	docker commit $image "$1"
#	docker save --output "$1".tar "$1"
#fi

set -e

RED="\033[1;31m"
GREEN="\033[1;32m"
RESET="\033[0m"

if [ $# -eq 0 ]; then
    echo -e "${RED}no input${RESET}"
    exit 1;
fi

while getopts ':csl' OPTION; do
   case "$OPTION" in
     c)
		echo "Option c used"
		image=$(docker ps -ql)
		# Utilisez la variable pour effectuer le commit
		echo $image
		docker commit $image "$2"
		exit 0
		;;
     s)
		echo "Option s used"
		# Stockez le nom du fichier dans une variable
		commit_file=$(basename "$2".tar)
		if [ $commit_file == "" ]; then
			echo "function exited"
			exit 1;
	    fi
	    IMAGE=$(docker ps -a | awk '1==1 {print $2}' | grep -v "IMAGE" |  grep -v "ID" | tr "\n" " ")
#	    docker save $IMAGE | gzip > "$commit_file".gz
		docker save -o "$commit_file" $IMAGE
		if [ $? -eq 0 ]; then
			echo -e "\n${GREEN}it's a success${RESET}"
			gzip "$commit_file"
			exit 0;
		else
			exit 1;
		fi
		;;
   	 l)
		echo "Option l used"
		docker load -i "$2".tar
		exit 0
		;;
     ?)
		echo "Usage: $(basename $0) [-a] [-b] [-c]"
		exit 1
		;;
   esac
done

if docker images "$1" | grep -q -F -- "$1"; then
    echo -e "\n${GREEN}it's already exist${RESET}"
else
    echo -e "\n${RED}it's doesn't exist${RESET}"
    docker build -t "$1" -f Dockerfile .
    docker run "$1"
    echo -e "\n${GREEN}it's a success${RESET}"
fi
