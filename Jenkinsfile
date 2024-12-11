pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/sheharyar777/devops-payment-page.git'
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
                    sh 'docker run -d -p 80:80 devops-webpage'
                }
            }
        }
    }
}
