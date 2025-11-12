pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }

   stage('Checkout') {
    steps {
        echo 'Cloning repository...'
        git branch: 'main', url: 'https://github.com/vijayarajvira/devops-learning.git'
    }
}

        stage('Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t vijayarajvira/hello-docker:v2 .'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                echo 'Logging into Docker Hub...'
                sh '''
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                '''
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing image to Docker Hub...'
                sh 'docker push vijayarajvira/hello-docker:v2'
            }
        }

        stage('Deploy using Docker Compose') {
            steps {
                echo 'Deploying with Docker Compose...'
                sh '''
                    docker compose down || true
                    docker compose up -d
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Deployment successful via Docker Compose!'
        }
        failure {
            echo '❌ Deployment failed, check logs.'
        }
    }

