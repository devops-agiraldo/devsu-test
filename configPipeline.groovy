pipeline {
    agent any

    stages {
        stage('verifyTools') {
            options {
                timeout(time: 1, unit: "MINUTES")
            }
            steps {
                sh './verifyTools.sh'
            }
        }
        stage('cloneProject') {
            options {
                timeout(time: 5, unit: "MINUTES")
            }
            steps {
                sh './cloneRepo.sh'
            }
        }
        stage('applyMvnTests') {
            options {
                timeout(time: 30, unit: "MINUTES")
            }
            steps {
                sh './addPluggins.sh'
                sh './executeTests.sh'
            }
        }
        stage('buildApp') {
            options {
                timeout(time: 30, unit: "MINUTES")
            }
            steps {
                dir('docker') {
                sh './buildImage.sh'
                }
            }
        }
            stage('deployApp') {
            options {
                timeout(time: 30, unit: "MINUTES")
            }
            steps {
                dir('k8s') {
                sh './createResourcesk8s.sh'
                }
            }
        }
    }
}
