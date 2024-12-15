pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'devops-payment-page'
        GIT_REPO = 'https://github.com/sheharyar777/devops-payment-page.git'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git "${GIT_REPO}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image from the Dockerfile
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container from the built image
                    sh 'docker run -d -p 8080:80 $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        always {
            echo 'Build or deployment completed.'
        }

        success {
            echo 'Build and deployment succeeded!'
        }

        failure {
            echo 'Build or deployment failed.'
        }
    }
}
