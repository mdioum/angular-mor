pipeline {
    agent none
    stages {
        stage('Install & Build App') {
            agent {
              kubernetes {
                label 'docker-npm'
              }
            }
            steps {
                sh "npm install"
                sh "npm run build"
                stash includes: 'dist/**', name: 'dist'
            }
        }


        stage('Build and Push Image') {
            agent {
              kubernetes {
                label 'docker-npm'
              }
            }
            steps {
                unstash 'dist'
                sh "docker build -t beopenit/angular-ci-cd-demo ."
                withCredentials([
                 usernamePassword(credentialsId: 'mody-docker-credentials', passwordVariable: 'password', usernameVariable: 'username')
               ]) {
                   sh 'docker login -u $username -p $password'
                   sh "docker push beopenit/angular-ci-cd-demo"
                }

            }
        }
    }
}
