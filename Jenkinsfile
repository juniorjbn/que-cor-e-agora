
node('docker-slave') {
    ansiColor('xterm') {
        timestamps {
            stage('Build Docker Image') {
                checkout scm
                sh """
                   make image tag
                """

            }

            stage('Push Image') {

              withCredentials([usernamePassword(credentialsId: 'quay', passwordVariable: 'rpass', usernameVariable: 'ruser')]) {
                 sh """
                   docker login -u=${ruser} -p=${rpass} quay.io && make push 
                 """
              }
            }
        }
    }
}
