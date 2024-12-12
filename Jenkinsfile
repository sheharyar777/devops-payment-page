pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t devops-webpage .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Check if the container is already running
                    def containerId = sh(script: 'docker ps -q -f name=devops-webpage-container', returnStdout: true).trim()
                    
                    // If the container is running, stop and remove it
                    if (containerId) {
                        echo 'Stopping and removing old container...'
                        sh "docker stop devops-webpage-container"
                        sh "docker rm devops-webpage-container"
                    } else {
                        echo 'No running container found with the name devops-webpage-container.'
                    }

                    // Run the new container
                    echo 'Starting new container...'
                    sh 'docker run -d --name devops-webpage-container -p 8080:80 devops-webpage'
                }
            }
        }
    }
}
