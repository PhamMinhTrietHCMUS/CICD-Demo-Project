pipeline {
    agent any
    
    stages {
        stage('Clone') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                sh 'docker build -t cicd-app .'
            }
        }
        
        stage('Deploy') {
            steps {
                sh 'docker stop cicd-app || true'
                sh 'docker rm cicd-app || true'
                sh 'docker run -d --name cicd-app -p 8080:80 cicd-app'
            }
        }
    }
}
