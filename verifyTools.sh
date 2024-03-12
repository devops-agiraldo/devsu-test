#!/bin/bash
# Script to check mandatory tools that must be installed

echo "Verifying mandatory tools"
check_command() {
    if command -v $1 &> /dev/null; then
        echo "$1 is installed."
    else
        echo "$1 is not installed. Excecution finished"
        exit 1
    fi
}
check_command /opt/apache-maven-3.6.3/bin/mvn
check_command kubectl
check_command docker
check_command java

echo "Tools verified successfully!"
