pipeline {
    agent any

    triggers {
        // Kiểm tra thay đổi trên GitHub mỗi phút một lần
        pollSCM '* * * * *' 
    }

    
    environment {
        COMPOSE_PROJECT_NAME = 'cicd-demo-project'
        IMAGE_NAME = 'cicd-app'
        CONTAINER_NAME = 'cicd-app'
        HOST_PORT = '8081'
        CONTAINER_PORT = '80'
        // dont use new buildkit whatever it is
        DOCKER_BUILDKIT = '0'
        COMPOSE_DOCKER_CLI_BUILD = '0'
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
                sh "docker-compose -p ${COMPOSE_PROJECT_NAME} build ${IMAGE_NAME}"
                // used to be sh "docker build -t ${IMAGE_NAME} ."
            }
        }
        
        stage('Stop & Remove Old Container') {
            steps {
                echo 'Stopping and removing old container...'
                sh "docker-compose -p ${COMPOSE_PROJECT_NAME} stop ${CONTAINER_NAME} || true" // drop the -compose -p ....
                sh "docker-compose -p ${COMPOSE_PROJECT_NAME} rm -f ${CONTAINER_NAME} || true"
                // sh "docker stop ${CONTAINER_NAME} || true"
                // sh "docker rm ${CONTAINER_NAME} || true"
            }
        }
        
        stage('Deploy New Container') {
            steps {
                echo 'Deploying new container...'
                // sh "docker run -d --name ${CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} ${IMAGE_NAME}"
                sh "docker-compose -p ${COMPOSE_PROJECT_NAME} up -d --no-deps --build ${IMAGE_NAME}"
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
