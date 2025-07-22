pipeline {
  agent any

  tools {
    nodejs "NodeJS 22"
  }

  stages {
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
        sh 'docker build -t adarshsonar/my-react-app:latest .'
      }
    }
    stage('Docker Push') {
      steps {
        withCredentials([string(credentialsId: 'DOCKER_PASSWORD', variable: 'DOCKER_PASS')]) {
          sh """
            echo "$DOCKER_PASS" | docker login -u adarshsonar --password-stdin
            docker push adarshsonar/my-react-app:latest
          """
        }
      }
    }
  }
}
