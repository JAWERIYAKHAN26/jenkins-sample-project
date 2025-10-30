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
            echo 'Stopping old container if running...'
            bat '''
            for /f "tokens=*" %%i in ('docker ps -q --filter "ancestor=jenkins-sample-app"') do (
                docker stop %%i
                docker rm %%i
            )
            '''

            echo 'Running new container...'
            bat 'docker run -d -p 8081:80 jenkins-sample-app'
        }
    }
}

    }
}
// test webhook auto build
