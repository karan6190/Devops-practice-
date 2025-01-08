pipeline {
    agent any
    stages{
        stage('checkout'){
            steps {
                sh 'git clone https://github.com/karan6190/Devops-practice-.git'
            }
        }
        stage('greetings') {
            steps {
                sh 'echo git cloned successfully'
            }
        }
    }
}