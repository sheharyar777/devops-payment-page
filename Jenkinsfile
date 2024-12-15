pipeline {
    agent any

    environment {
        // Define any environment variables if needed
        DOCKER_IMAGE = 'devops-payment-page'
    }

    stages {
        // Stage for checking out the code from the GitHub repository
        stage('Checkout SCM') {
            steps {
                git 'https://github.com/sheharyar777/devops-payment-page.git'
            }
        }

        // Stage for building the Docker image
        stage('Build Docker Image') {
            steps {
                script {
                    // Navigate to the directory where Dockerfile is located
                    dir('devops-payment-page') {
                        // Build the Docker image
                        sh 'docker build -t $DOCKER_IMAGE .'
                    }
                }
            }
        }

        // Stage for testing the Docker image (optional, depending on your project needs)
        stage('Test Docker Image') {
            steps {
                script {
                    // Run some tests on the Docker image (you can replace this with your specific tests)
                    sh 'docker run --rm $DOCKER_IMAGE test-command'
                }
            }
        }

        // Stage for deploying the Docker image (optional, replace with your deployment steps)
        stage('Deploy') {
            steps {
                script {
                    // Example deploy step, replace with your actual deployment logic
                    sh 'docker run -d -p 8080:80 $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        // Actions to perform after the pipeline runs, regardless of success or failure
        always {
            cleanWs()  // Clean workspace after build
        }

        success {
            echo 'Build and deployment succeeded!'
        }

        failure {
            echo 'Build or deployment failed.'
        }
    }
}
