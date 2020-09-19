pipeline {
    agent any

    environment {
        PASS = credentials('DOCKER_HUB_PASS')

        DOCKER_NODEJS_IMAGE = 'phathdt379/nodejs-exam'
        DOCKER_PYTHON_IMAGE = 'phathdt379/python-exam'
    }

    stages {
        stage('Build NodeJs') {
            steps {
                echo '****** Build and tag image docker nodejs******'

                sh './jenkins/nodejs_build.sh'
            }
        }

        stage('Push NodeJs') {
            steps {
                echo '****** Push image nodejs******'

                sh './jenkins/nodejs_push.sh'
            }
        }

        stage('Build Python') {
            steps {
                echo '****** Build and tag image docker python******'

                sh './jenkins/python_build.sh'
            }
        }

        stage('Push Python') {
            steps {
                echo '****** Push image python******'

                sh './jenkins/python_push.sh'
            }
        }
    }
}
