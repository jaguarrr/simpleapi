#!/bin/bash

#####
# Script to be used when changes are applied to the app
# once a change to the app has been pushed to git
# a trigger should start this script with image name,
# version and deployment config file as parameters
# this script will update the deployment config file
# with the new version and apply the changes to the
# kubernetes cluster.
# Kubernetes deployment will handle the rollout without 
# any downtime.
#####

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]
  then
    echo "USAGE: $0 ImageName Version DeploymentFile"
    echo "Example: $0 jaguar/simpleapi 04 k8syamls/deployment.yaml"
    exit 1
fi


IMAGE=$1
VERSION=$2
DEPLOYMENTFILE=$3

docker build -t $IMAGE:$VERSION .
docker push $IMAGE:$VERSION


sed -i "s@image: ${IMAGE}:..@image: ${IMAGE}:${VERSION}@g" $DEPLOYMENTFILE

kubectl apply -f $DEPLOYMENTFILE

