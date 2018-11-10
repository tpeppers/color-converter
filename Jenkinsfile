pipeline {
  agent any
  environment {
    NODE_PATH = '/usr/local/bin/node'
  }
  stages {
    stage('Build') { 
      steps {
        sh 'npm install'
        sh 'npm install forever -g'
      }
    }
    stage('Test') {
      steps {
        wrap([$class: 'HailstoneBuildWrapper', location: 'agent-server', port: '10010']) {
          sh 'forever start --killSignal SIGTERM --minUptime 1000 --spinSleepTime 1000 -c /bin/sh ./start.sh'
          sh 'while [[ $(curl -s -w "%{http_code}" http://localhost:3000 -o /dev/null) != "200" ]]; do sleep 5 ; done'
          sh 'npm test'
          sh 'forever stop 0'
        }
      }
    }
    stage('Deploy') { 
      steps {
        sh 'echo npm package would run here...'
      }
    }
  }
}
