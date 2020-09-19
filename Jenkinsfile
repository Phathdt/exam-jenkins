pipeline {
    agent any

    environment {
        PASS = credentials('DOCKER_HUB_PASS')

        DOCKER_NODEJS_IMAGE = 'phathdt379/nodejs-exam'
    }

    stages {
        stage('Build Nodejs') {
            steps {
                echo '****** Build and tag image docker nodejs******'

                sh './jenkins/nodejs_build.sh'
            }
        }
    }
}
