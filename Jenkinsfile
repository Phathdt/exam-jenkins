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
            steps {
                if (params.PERSON == 'nodejs') {
                    echo '****** Build and tag image docker nodejs******'

                    sh './jenkins/nodejs_build.sh'
                }
            }
        }

        stage('Push NodeJs') {
            steps {
                if (params.PERSON == 'nodejs') {
                    echo '****** Push image nodejs******'

                    sh './jenkins/nodejs_push.sh'
                }
            }
        }

        stage('Build Python') {
            steps {
                if (params.PERSON == 'python') {
                    echo '****** Build and tag image docker python******'

                    sh './jenkins/python_build.sh'
                }
            }
        }

        stage('Push Python') {
            steps {
                if (params.PERSON == 'python') {
                    echo '****** Push image python******'

                    sh './jenkins/python_push.sh'
                }
            }
        }
    }
}
