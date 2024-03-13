#!/bin/bash
# Script to build an push image to repository

echo "Cleaning old resources"
rm -rf demo-devops-java


echo "Building docker image"
mv ../demo-devops-java/ .
docker build -t devsu-test:latest .

echo "Logging in docker"
echo "pass" | docker login -u repo --password-stdin

echo "Tagging the image"
docker tag devsu-test:latest felipegiraldog93080/devsu-ag:latest

echo "Pushing the image to repository"
docker push felipegiraldog93080/devsu-ag:latest

echo "Process completed successfully"
