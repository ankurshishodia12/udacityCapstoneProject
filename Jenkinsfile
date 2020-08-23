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
                  sh 'docker build -t udacity-capstone-project .'
              }
        }
    stage('Push Docker Image') {
              steps {
                  withDockerRegistry([url: '', credentialsId: 'dockerHub']) {
                      sh 'docker tag udacity-capstone-project ankurshishodia12/udacity-capstone-project'
                      sh 'docker push ankurshishodia12/udacity-capstone-project'
                  }
              }
         } 
    stage('Deploying') {
              steps{
                  echo 'Deploying to AWS...'
                  withAWS(credentials: 'aws-static', region: 'us-west-2') {
                      sh "aws eks --region us-west-2 update-kubeconfig --name udacityCapstoneCluster"
                      sh "kubectl config use-context arn:aws:eks:us-west-2:791183251136:cluster/udacityCapstoneCluster"
                      sh "kubectl apply -f deployment/deployment.yml"
                      sh "kubectl get nodes"
                      sh "kubectl get deployment"
                      sh "kubectl get pod -o wide"
                      sh "kubectl get service/udacity-capstone-project"
                  }
              }
        }     



    }
}