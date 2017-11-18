pipeline {
  agent {
    docker {
      image 'alpine'
    }
    
  }
  stages {
    stage('test') {
      steps {
        sh 'echo "yay"'
      }
    }
  }
}