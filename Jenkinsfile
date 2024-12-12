pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t devops-webpage .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove any existing containers for the image
                    sh '''
                    docker ps -a -q -f "ancestor=devops-webpage" | xargs -r docker stop
                    docker ps -a -q -f "ancestor=devops-webpage" | xargs -r docker rm
                    
                    // Start a new container
                    docker run -d -p 80:80 --name devops-webpage-container devops-webpage
                    '''
                }
            }
        }
    }
}
