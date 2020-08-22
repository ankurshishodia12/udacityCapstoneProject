pipeline {
  agent any 
  stages {
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
  }
}
}
