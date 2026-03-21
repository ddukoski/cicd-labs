def successStatusDockerImagePush(tag) {
    echo "[SUCCESS] Pushed image with tag: ${tag}"
}

pipeline {
    def app
    stage('Clone repository') {
        checkout scm
    }
    stage('Build image') {
       app = docker.build("ddukoski/kiii-jenkins")
    }
    stage('Push image') {   

        def buildTag = "${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
        def latestTag = "${env.BRANCH_NAME}-latest"

        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push(buildTag)
            successStatusDockerImagePush(buildTag)
            app.push(latestTag)
            successStatusDockerImagePush(latestTag)
        }
    }
}
