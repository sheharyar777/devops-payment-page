pipeline {
    agent any
    stages {
        stage('Delete Old Container') {
            steps {
                script {
                    // Stop and remove the old container
                    sh '''
                    container_id=$(docker ps -q -f ancestor=devops-webpage)
                    if [ -n "$container_id" ]; then
                        docker rm -f $container_id
                    fi
                    '''
                }
            }
        }
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
                    sh 'docker run -d -p 80:80 devops-webpage'
                }
            }
        }
    }
}
