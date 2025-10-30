pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/JAWERIYAKHAN26/jenkins-sample-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker image...'
                    bat 'docker build -t jenkins-sample-app .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    echo 'Running container...'
                    bat 'docker run -d -p 8081:80 jenkins-sample-app'
                }
            }
        }
    }
}
stage('Run Docker Container') {
    steps {
        script {
            echo 'Running container...'
            // Stop old container if it exists
            bat 'docker stop $(docker ps -q --filter "ancestor=jenkins-sample-app") || echo "No old container running"'
            // Run new container
            bat 'docker run -d -p 8081:80 jenkins-sample-app'
        }
    }
}
