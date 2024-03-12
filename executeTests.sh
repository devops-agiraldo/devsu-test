#!/bin/bash
# Script to execute maven tests

cd "demo-devops-java"
echo "Applying Unit Tests"
/opt/apache-maven-3.6.3/bin/mvn clean test -B
echo "Applying Static code analysis"
/opt/apache-maven-3.6.3/bin/mvn spotbugs:check -B
echo "Applying Code Coverage"
/opt/apache-maven-3.6.3/bin/mvn clean test jacoco:report -B
echo "Vulnerability Scann"
/opt/apache-maven-3.6.3/bin/mvn org.owasp:dependency-check-maven:check -B

echo "Tests applied succesfully!"
