pipeline {
    agent any

    environment {
        PASS = credentials('DOCKER_HUB_PASS')

        DOCKER_NODEJS_IMAGE = 'phathdt379/nodejs-exam'
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
    }
}
