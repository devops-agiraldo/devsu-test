#!/bin/bash
# Script to clone de git devsu repo

echo "Cleaning old resources"
rm -rf demo-devops-java

echo "Cloning Devsu Project"
git clone https://bitbucket.org/devsu/demo-devops-java.git

echo "Successfully cloned project"
