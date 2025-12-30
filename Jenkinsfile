pipeline {
    agent any
    
    environment {
        IMAGE_NAME = 'cicd-app'
        CONTAINER_NAME = 'cicd-app'
        HOST_PORT = '8081'
        CONTAINER_PORT = '80'
    }
    
    stages {
        stage('Clone') {
            steps {
                echo 'Cloning repository...'
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }
        
        stage('Stop & Remove Old Container') {
            steps {
                echo 'Stopping and removing old container...'
                sh "docker stop ${CONTAINER_NAME} || true"
                sh "docker rm ${CONTAINER_NAME} || true"
            }
        }
        
        stage('Deploy New Container') {
            steps {
                echo 'Deploying new container...'
                sh "docker run -d --name ${CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} ${IMAGE_NAME}"
            }
        }
        
        stage('Verify Deployment') {
            steps {
                echo 'Verifying deployment...'
                sh "docker ps | grep ${CONTAINER_NAME}"
                echo "Application is running at http://localhost:${HOST_PORT}"
            }
        }
    }
    
    post {
        success {
            echo 'CI/CD Pipeline completed successfully!'
        }
        failure {
            echo 'CI/CD Pipeline failed!'
        }
    }
}
