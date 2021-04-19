pipeline {
    agent any
    triggers {pollSCM('* * * * *')}
    stages{    
        stage('Checkout') { 
            steps{
                echo 'Checking out project...'
                git branch: 'main', url: 'https://github.com/greenel-DCU/spring-petclinic.git'
            }
        }

        stage('Build') {
            steps{
                echo 'Building project...'
                sh './mvnw clean package'
            }
        }
        
     
        stage('Docker Build') {
            steps {
              sh 'docker build . -t lisaitt/spring-petclinic:latest'
              //sh 'docker build . --tag petclinic'//works
            }
        }
    
        stage('Docker Push') {

          steps {
              withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                sh 'docker push lisaitt/spring-petclinic:latest'
            }    
        }
      }
  }     

    post {
            always {
                emailext body: 'Please go to ${BUILD_URL} and verify the build', to:"lisa.greene@students.ittralee.ie", 
                recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], 
                subject: "Jenkins: ${JOB_NAME} (${BUILD_NUMBER}): Build status: ${currentBuild.currentResult}"
                }
            
        }
}


