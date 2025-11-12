pipeline {
    agent any

    stages {
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
                // add test steps here later if needed
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin'
                }
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
                echo 'Deploying container...'
                sh '''
                docker rm -f hello-container || true
                docker run -d --name hello-container -p 8081:80 vijayarajvira/hello-docker:v2
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Deployment successful!'
        }
        failure {
            echo '❌ Deployment failed, check logs.'
        }
    }
}

