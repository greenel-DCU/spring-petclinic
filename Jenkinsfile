#!groovy

pipeline {
  agent none
  stages {
    stage('Build') {
            steps{
                echo 'Building project...'
                sh './mvnw clean package'
            }
        }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t lisaitt/spring-petclinic:latest .'
      }
    }
  }
