/* groovylint-disable CompileStatic */
pipeline {
    agent any
    environment {
        IMAGE_NAME = 'ddukoski/kiii-jenkins'
    }
    stages {
        stage('Clone repository') {
            steps {
                checkout scm
                sh 'git rev-parse --short HEAD'
            }
        }
        stage('Build image') {
            steps {
                script {
                    app = docker.build("${IMAGE_NAME}:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Push image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub_credentials') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push('latest')
                    }
                }
            }
        }
    }
}