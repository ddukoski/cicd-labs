def app

pipeline {
    agent any

    stages {
        stage('Clone repository') {
            steps {
                checkout scm
            }
        }

        stage('Build image') {
            steps {
                script {
                    app = docker.build('ddukoski/kiii-jenkins')
                }
            }
        }

        stage('Push image') {
            steps {
                script {
                    def safeBranch = env.BRANCH_NAME.replaceAll('[^a-zA-Z0-9_.-]', '-')
                    def buildTag = "${safeBranch}-${env.BUILD_NUMBER}"
                    def latestTag = "${safeBranch}-latest"

                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
                        app.push(buildTag)
                        echo "[SUCCESS] Pushed image with tag: ${buildTag}"
                        app.push(latestTag)
                        echo "[SUCCESS] Pushed image with tag: ${latestTag}"
                    }
                }
            }
        }
    }
}
