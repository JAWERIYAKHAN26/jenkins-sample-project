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
                        echo Stopping container %%i
                        docker stop %%i >nul 2>&1
                        docker rm %%i >nul 2>&1
                    )
                    '''

                    echo 'Running new container...'
                    // agar port already occupied hai toh force remove aur retry
                    bat '''
                    netstat -ano | findstr :8081 && (
                        for /f "tokens=5" %%p in ('netstat -ano ^| findstr :8081') do taskkill /PID %%p /F
                    )
                    docker run -d -p 8081:80 jenkins-sample-app
                    '''
                }
            }
        }
    }
}
git add Jenkinsfile