pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t devops-webpage .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Run the container with a unique name
                    sh '''
                    docker run -d -p 80:80 --name devops-webpage-container-$(date +%s) devops-webpage
                    '''
                }
            }
        }
    }
}
