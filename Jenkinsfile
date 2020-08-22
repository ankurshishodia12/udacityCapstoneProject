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
                  sh 'docker build -t udacity-capstone-devops-project .'
              }
        }
    stage('Push Docker Image') {
              steps {
                  withDockerRegistry([url: '', credentialsId: 'dockerHub']) {
                      sh 'docker tag udacity-capstone-devops-project ankurshishodia12/udacity-capstone-devops-project'
                      sh 'docker push ankurshishodia12/udacity-capstone-devops-project'
                  }
              }
         }    


    }
}