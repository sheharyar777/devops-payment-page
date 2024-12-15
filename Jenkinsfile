pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'devops-webpage'
        CONTAINER_NAME = 'devops-webpage-container'
        PORT = '8090'
        UNIQUE_CONTAINER_NAME = "${CONTAINER_NAME}-${BUILD_ID}" // Unique container name for each build
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
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove old container if it exists
                    sh '''
                        echo "Checking for existing container..."
                        if [ "$(docker ps -aq -f name=$UNIQUE_CONTAINER_NAME)" ]; then
                            echo "Stopping and removing old container..."
                            docker stop $UNIQUE_CONTAINER_NAME || echo "Container already stopped."
                            docker rm $UNIQUE_CONTAINER_NAME || echo "Container already removed."
                        else
                            echo "No old container found."
                        fi
                    '''
                    
                    // Start a new container
                    echo "Starting new container with unique name..."
                    sh '''
                        docker run -d --name $UNIQUE_CONTAINER_NAME -p $PORT:80 $DOCKER_IMAGE
                    '''
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            // Cleanup dangling images or containers if needed
            sh '''
                echo "Pruning unused Docker resources..."
                docker image prune -f || echo "No unused images to prune."
                docker container prune -f || echo "No unused containers to prune."
            '''
        }
    }
}
