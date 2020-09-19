pipeline {
    agent any

    parameters {
        choice(name: 'BUILD_APP', choices: ['all', 'nodejs', 'python'], description: 'Build app')
    }

    environment {
        PASS = credentials('DOCKER_HUB_PASS')

        DOCKER_NODEJS_IMAGE = 'phathdt379/nodejs-exam'
        DOCKER_PYTHON_IMAGE = 'phathdt379/python-exam'
    }

    stages {
        stage('Build NodeJs') {
            when {
                expression { params.BUILD_APP == 'nodejs' }
            }

            steps {
                echo '****** Build and tag image docker nodejs******'

                sh './jenkins/nodejs_build.sh'
            }
        }

        stage('Push NodeJs') {
            when {
                expression { params.BUILD_APP == 'nodejs' }
            }

            steps {
                echo '****** Push image nodejs******'

                sh './jenkins/nodejs_push.sh'
            }
        }

        stage('Build Python') {
            when {
                expression { params.BUILD_APP == 'python' }
            }

            steps {
                echo '****** Build and tag image docker python******'

                sh './jenkins/python_build.sh'
            }
        }

        stage('Push Python') {
            when {
                expression { params.BUILD_APP == 'python' }
            }

            steps {
                echo '****** Push image python******'

                sh './jenkins/python_push.sh'
            }
        }
    }
}
