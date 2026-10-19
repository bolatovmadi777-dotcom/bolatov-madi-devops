pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Madi'
        STUDENT_SURNAME = 'Bolatov'
        STUDENT_GROUP   = 'IT2-2308'
        STUDENT_ID      = '41511'
        IMAGE_NAME      = 'bolatov-madi-devops'
        CONTAINER_NAME  = 'bolatov-madi-container'
        // Jenkins on macOS does not see Docker by default - add it to PATH
        PATH = "/usr/local/bin:/opt/homebrew/bin:/Applications/Docker.app/Contents/Resources/bin:${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                echo "Group: ${STUDENT_GROUP}"
                echo "Student ID: ${STUDENT_ID}"
                sh 'git log -1 --oneline'
            }
        }

        stage('Build') {
            steps {
                echo 'Checking the application script syntax...'
                sh 'sh -n app/app.sh'
                sh 'chmod +x app/app.sh'
            }
        }

        stage('Test') {
            steps {
                echo 'Running the application and checking its output...'
                sh '''
                    OUTPUT=$(sh app/app.sh)
                    echo "$OUTPUT"
                    echo "$OUTPUT" | grep "Name: ${STUDENT_NAME}"
                    echo "$OUTPUT" | grep "Surname: ${STUDENT_SURNAME}"
                    echo "$OUTPUT" | grep "Student ID: ${STUDENT_ID}"
                '''
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker --version'
                sh 'docker build -t ${IMAGE_NAME} .'
                sh 'docker images ${IMAGE_NAME}'
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker rm -f ${CONTAINER_NAME} || true'
                sh '''
                    docker run --name ${CONTAINER_NAME} \
                      -e STUDENT_NAME=${STUDENT_NAME} \
                      -e STUDENT_SURNAME=${STUDENT_SURNAME} \
                      -e STUDENT_GROUP=${STUDENT_GROUP} \
                      -e STUDENT_ID=${STUDENT_ID} \
                      ${IMAGE_NAME}
                '''
                sh 'docker ps -a --filter name=${CONTAINER_NAME}'
            }
        }
    }

    post {
        success { echo 'Pipeline finished successfully!' }
        failure { echo 'Pipeline failed. Check the stage that turned red.' }
    }
}
