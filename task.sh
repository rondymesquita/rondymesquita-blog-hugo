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
  hugo new $1
}

undraft(){
  hugo undraft $1
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

# # Execute the tasks
# for TASK in "$@"
# do
#  $TASK
# done

# If nothing, run default
if [ "$1" = "" ]; then
  help
fi

FUNCTION=$1
shift
$FUNCTION $@