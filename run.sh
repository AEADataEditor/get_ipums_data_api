#!/bin/bash


if [[ -f config.txt ]]
then 
   configfile=config.txt
else 
   configfile=init.config.txt
fi


echo "================================"
echo "Pulling defaults from ${configfile}:"
cat $configfile
echo "--------------------------------"

source $configfile

echo "================================"
echo "Running docker:"
set -ev

# When we are on Github Actions
if [[ $CI ]] 
then
   DOCKEROPTS="--rm"
#   DOCKERIMG=$(echo $GITHUB_REPOSITORY | tr [A-Z] [a-z])
#   TAG=latest
else
   DOCKEROPTS="-it --rm -e DISABLE_AUTH=true -e IPUMS_API_KEY=$IPUMS_API_KEY -p 8787:8787"
   #source $configfile
   #DOCKERIMG=$MYHUBID/$MYIMG
fi
source $configfile
DOCKERIMG=$MYHUBID/$MYIMG

# ensure that the directories are writable by Docker
chmod a+rwX .


# run the docker and the Stata file
# note that the working directory will be set to '/code' by default

time docker run $DOCKEROPTS \
  -v $(pwd):/home/rstudio/project \
  -w /home/rstudio/project \
  $DOCKERIMG:$TAG 



