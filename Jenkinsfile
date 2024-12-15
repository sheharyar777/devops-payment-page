pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'devops-webpage'
        CONTAINER_NAME = 'devops-webpage-container'
        PORT = '8090' // Desired port
        UNIQUE_CONTAINER_NAME = "${CONTAINER_NAME}-${BUILD_ID}" // Unique container name
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
                    // Ensure port availability and clean up old containers
                    sh '''
                        echo "Checking if port $PORT is free..."
                        if lsof -i:$PORT; then
                            echo "Port $PORT is in use. Stopping and removing any containers using it..."
                            CONTAINER_ID=$(docker ps -q --filter "publish=$PORT")
                            if [ "$CONTAINER_ID" ]; then
                                docker stop $CONTAINER_ID
                                docker rm $CONTAINER_ID
                            fi
                        else
                            echo "Port $PORT is free."
                        fi

                        echo "Checking for existing container..."
                        if [ "$(docker ps -aq -f name=$UNIQUE_CONTAINER_NAME)" ]; then
                            echo "Stopping and removing old container..."
                            docker stop $UNIQUE_CONTAINER_NAME || echo "Container already stopped."
                            docker rm $UNIQUE_CONTAINER_NAME || echo "Container already removed."
                        else
                            echo "No old container found."
                        fi

                        echo "Starting new container with unique name..."
                        docker run -d --name $UNIQUE_CONTAINER_NAME -p $PORT:80 $DOCKER_IMAGE
                    '''
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            // Prune unused resources
            sh '''
                echo "Pruning unused Docker resources..."
                docker image prune -f || echo "No unused images to prune."
                docker container prune -f || echo "No unused containers to prune."
            '''
        }
    }
}
