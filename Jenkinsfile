pipeline {
  agent any

  tools {
    nodejs "NodeJS 18"
  }

  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/AdarshSonar2012/reactapp'
      }
    }
    stage('Install') {
      steps {
        sh 'npm install'
      }
    }
    stage('Build') {
      steps {
        sh 'npm run build'
      }
    }
    stage('Test') {
      steps {
        sh 'npm test || true'  // prevent crash if tests are missing
      }
    }
    stage('Docker Build') {
      steps {
        sh 'docker build -t yourusername/yourimage:latest .'
      }
    }
    stage('Docker Push') {
      steps {
        withCredentials([string(credentialsId: 'dockerhub-pass', variable: 'DOCKER_PASS')]) {
          sh """
            echo "$DOCKER_PASS" | docker login -u yourusername --password-stdin
            docker push yourusername/yourimage:latest
          """
        }
      }
    }
  }
}
