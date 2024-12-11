pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/sheharyar777/devops-payment-page.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using the Dockerfile in the repository
                    sh 'docker build -t devops-webpage .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container from the built image
                    sh 'docker run -d -p 8080:80 devops-webpage'
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Clean the workspace after build completion
        }
    }
}
