pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'devops-webpage'
        CONTAINER_NAME = 'devops-webpage-container'
        PORT = '8090'
        UNIQUE_CONTAINER_NAME = "${CONTAINER_NAME}-${BUILD_ID}" // Adding build ID to make the container name unique
    }

    stages {
        stage('Checkout SCM') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove the old container if it exists
                    sh '''
                        if docker ps -q -f name=${UNIQUE_CONTAINER_NAME}; then
                            echo "Stopping and removing old container..."
                            docker stop ${UNIQUE_CONTAINER_NAME}
                            docker rm ${UNIQUE_CONTAINER_NAME}
                        else
                            echo "No old container to remove."
                        fi
                    '''
                    
                    // Start the new container with a unique name
                    echo "Starting new container..."
                    sh "docker run -d --name ${UNIQUE_CONTAINER_NAME} -p ${PORT}:80 ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            // Optionally, you can add cleanup steps here to remove unused images or containers
        }
    }
}
