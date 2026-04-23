pipeline {
    agent any
    
        environment {
        IMAGE_NAME = "paresh3292/python-jenkins"
        TAG = "${BUILD_NUMBER}"
    }
    
    stages {
        stage('docker-version'){
            steps{
                sh '''
                   docker version
                   '''
            }
        }
        
         stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('scm checkout') {
            steps {
                // Get some code from a GitHub repository
                // git 'https://github.com/jglick/simple-maven-project-with-tests.git'
                
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Paresh-G/python-flask-app.git']])
            }
        }
        
                stage('Remove Old image (if exists)') {
            steps {
                sh '''
                docker images
                docker system prune -a -f || true
                docker images
                '''
            }
        }
        
        stage('Building-image'){
            steps {
                sh 'docker build -t $IMAGE_NAME:$TAG .'
            }
        }
        stage('verification'){
            steps{
                sh 'docker images'
            }
        }
        
       stage('Push Image') {
            steps {
               withCredentials([usernamePassword(credentialsId: 'registory', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
               sh '''
                 echo $PASS | docker login -u $USER --password-stdin
                 docker push $IMAGE_NAME:$TAG
               '''
             }
          }
       }
    }
}
