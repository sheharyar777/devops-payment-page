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
                    // Get the container ID of any running container with the name prefix devops-webpage-container
                    def containerId = sh(script: 'docker ps -q -f name=devops-webpage-container', returnStdout: true).trim()
                    
                    // If any container is found, stop and remove it
                    if (containerId) {
                        echo 'Stopping and removing old container...'
                        sh "docker stop ${containerId}"
                        sh "docker rm ${containerId}"
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
