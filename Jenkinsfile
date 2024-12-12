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
                    // Stop and remove the old container if it's running
                    sh '''
                    if [ $(docker ps -q -f name=devops-webpage-container) ]; then
                        echo "Stopping and removing old container..."
                        docker stop devops-webpage-container
                        docker rm devops-webpage-container
                    fi
                    // Run the new container with a unique name
                    docker run -d -p 80:80 --name devops-webpage-container-$(date +%s) devops-webpage
                    '''
                }
            }
        }
    }
}
