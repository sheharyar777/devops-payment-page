pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/sheharyar777/devops-payment-page.git'
            }
        }

        stage('Cleanup Old Containers') {
            steps {
                script {
                    // Stop and remove old containers, and prune unused images
                    sh '''
                    docker ps -q --filter "name=payment-page" | xargs -r docker stop
                    docker ps -a -q --filter "name=payment-page" | xargs -r docker rm
                    docker image prune -f
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t payment-page .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container with the new image
                    sh 'docker run -d --name payment-page -p 80:80 payment-page'
                }
            }
        }
    }
}
