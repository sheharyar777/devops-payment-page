pipeline {
    agent any

    environment {
        // Set the Docker image name
        IMAGE_NAME = 'devops-payment-page'
    }

    stages {
        // Stage 1: Checkout code from GitHub
        stage('Checkout') {
            steps {
                // Checkout the latest code from the GitHub repository
                git 'https://github.com/sheharyar777/devops-payment-page.git'
            }
        }

        // Stage 2: Build Docker image
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t devops-payment-page '
                }
            }
        }

        // Stage 3: Run Docker container
        stage('Deploy') {
            steps {
                script {
                    // Run the Docker container and expose it on port 80
                    sh 'docker run -d -p 80:80 ${IMAGE_NAME}'
                }
            }
        }

        // Stage 4: Clean up (Optional)
        stage('Clean Up') {
            steps {
                script {
                    // Stop and remove the Docker container after the deployment
                    sh 'docker stop $(docker ps -q --filter "ancestor=${IMAGE_NAME}") || true'
                    sh 'docker rm $(docker ps -a -q --filter "ancestor=${IMAGE_NAME}") || true'
                }
            }
        }
    }

    post {
        // Notify on success or failure
        success {
            echo 'Webpage successfully deployed!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
