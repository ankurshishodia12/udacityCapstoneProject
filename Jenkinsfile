pipeline {
    agent any
    stages {
         stage('Build') {
              steps {
                  sh 'echo Building...'
              }
         }
    stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
    stage('Build Docker Image') {
              steps {
                  sh 'docker build -t udacityCapstoneProject .'
              }
        }
    stage('Push Docker Image') {
              steps {
                  withDockerRegistry([url: '', credentialsId: 'dockerHub']) {
                      sh 'docker tag udacityCapstoneProject ankurshishodia12/udacityCapstoneProject'
                      sh 'docker push ankurshishodia12/udacityCapstoneProject'
                  }
              }
         }    


    }
}