
node('docker-slave') {
    ansiColor('xterm') {
        timestamps {
            stage('Build Image') {
                checkout scm
                sh """
                   make image tag
                """

            }

            stage('Push Image') {

              withDockerRegistry([credentialsId: 'quay', url: 'quay.io']) {
                 sh """
                   make push 
                 """
              }
            }
        }
    }
}
