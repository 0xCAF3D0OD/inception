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
YELLOW="\033[1;33m"
RESET="\033[0m"

if [ $# -eq 0 ]; then
		echo -e "${RED}no input${RESET}"
		exit 1;
fi

while getopts ':cslra' OPTION; do
		case "$OPTION" in
		a)
			echo -e "${YELLOW}docker images${RESET}"
			docker images
			echo -e "${YELLOW}docker containers${RESET}"
			docker ps -a
			exit 0
			;;
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
			REP=$(docker image ls -a | grep $2 | awk '1==1 {print $1}' | tr "\n" " ")
#			TAG=$(docker image ls -a | grep $2 | awk '1==1 {print $2}' | tr "\n" " ")
			ID=$(docker image ls -a | grep $2 | awk '1==1 {print $3}' | tr "\n" " ")
			CONT=$(docker ps -a | grep $2 | awk '1==1 {print $1}' | tr "\n" " ")

			N_V=$(~/scripts/rename.sh $REP)
			echo "nv = $N_V"
			echo "cont = $CONT"
			if [[ -n $ID ]]; then
				docker image rm -f $ID
				docker rm -f $CONT
				docker build -t $N_V .
				if [[ "$3" == "-it" ]]; then
					docker run -it $N_V bash
					exit 0
				fi
				docker run $N_V
			fi
			if [ $? -eq 0 ]; then
				echo -e "\n${GREEN}it's a success${RESET}"
				exit 0;
			fi
			;;
		l)
			echo "Option l used"
			docker load -i "$2".tar
			exit 0
			;;
		r)
			echo "Option r used"
#			echo $0 $1 $2 $3
			docker run $2 $3
			exit 0
			;;
		?)
<<<<<<< HEAD
			echo "Usage: $(basename $0) [-a] [-c] [-s] [-l] [-r]"
			exit 1
			;;
		esac

done

if docker images "$1" | grep -q -F -- "$1"; then
		echo -e "\n${GREEN}it's already exist${RESET}"
		echo -e "${YELLOW}docker images${RESET}"
		docker images
		echo -e "${YELLOW}docker containers${RESET}"
		docker ps -a
else
		echo -e "\n${RED}it's doesn't exist${RESET}"
		docker build -t "$1" -f Dockerfile .
		if [[ "$2" == "-it" ]]; then
			docker run -it $1
			exit 0
		fi
		docker run "$1"
		echo -e "\n${GREEN}it's a success${RESET}"
fi
