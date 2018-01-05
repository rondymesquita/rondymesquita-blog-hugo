#!/bin/bash
clear

DIR="rondymesquita.github.io"
PUBLIC="$DIR/public"

declare -A FUNCTIONS
FUNCTIONS=(
  ["serve"]="Hugo serve"
)

help(){
  echo "*** Help"
  for i in "${!FUNCTIONS[@]}"
  do
    echo "$i: ${FUNCTIONS[$i]}"
  done
  echo ""
}

build(){
  cd $DIR
  hugo -b http://rondymesquita.github.io
  cd ..
}

serve(){
 cd $DIR
 hugo serve
 cd .. 
}

serve-draft(){
 cd $DIR
 hugo -D serve
 cd .. 
}

new(){
  cd $DIR
  hugo new $1
  cd ..
}

undraft(){
  cd $DIR
  hugo undraft $1
  cd ..
}

configure(){
 cd $PUBLIC
 rm -rf .git
 git init
 git remote add origin git@github.com:rondymesquita/rondymesquita.github.io.git
 cd .. 
}

deploy(){
  build
  cd $PUBLIC
  git add -A
  git commit -m "$(date)"
  git push -f origin master
  cd .. 
}

say(){
  echo "You said $@"
}


# # Execute the tasks
# for TASK in "$@"
# do
#  $TASK
# done

FUNCTION=""
# ARG=""

while getopts ":t:a:" opt; do
  case $opt in
    t)
      # echo "-t was triggered, Parameter: $OPTARG" >&2
      FUNCTION=${OPTARG}
      ;;
    a)
      ARG+=(${OPTARG})
      ;;
  esac
done

echo "$FUNCTION"
echo "${ARG[@]}"

$FUNCTION ${ARG[@]}

# If nothing, run default
if [ "$1" = "" ]; then
  help
fi

# echo $1

# FUNCTION=$1
# shift
# $FUNCTION $@