pipeline {
    agent any

    stages {
        stage('clean workspace') {
            steps {
                cleanWs()
            }
        }

        stage('checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/JibachhhMahto764/jenkins-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t go-app:v1.0 .'
            }
        }

        stage('List docker images') {
            steps {
                sh ' docker images'
            }
        }

        stage('Run container') {
            steps {
                sh ' docker run -d -p 9090:8080 --name my-go-app go-app:v1.0 '
            }
        }

        stage('wait') {
            steps {
                sleep(time: 60, unit: 'SECONDS')
            }
        }
    }

    post {
        always {
            sh '''
                docker stop my-go-app || true
                docker rm my-go-app || true
                docker rmi go-app:v1.0 || true
            '''
        }
    }
}
