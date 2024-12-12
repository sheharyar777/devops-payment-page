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
                    // Stop and remove the old container if it exists
                    sh '''
                    docker ps -q -f "ancestor=devops-webpage" | xargs --no-run-if-empty docker rm -f
                    docker run -d -p 80:80 devops-webpage
                    '''
                }
            }
        }
    }
}
