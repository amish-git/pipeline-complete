pipeline {
    environment {
        repo = "amishtm/pipelinedemo"
    }

agent any
stages {
    stage ('Docker Build') {
        steps {
            sh 'docker build -t $repo:v$BUILD_NUMBER .'
        }
    }
    stage ('Docker Push') {
      steps {
         withCredentials([usernamePassword(credentialsId: 'Docker', usernameVariable: 'dockeruser', passwordVariable: 'dockerpass')]) {
          sh "docker login -u ${env.dockeruser} -p ${env.dockerpass}"
          sh 'docker push $repo:v$BUILD_NUMBER'
         }
      }
    }
    stage('Clean docker image') {
      steps {
        sh 'docker rmi $repo:v$BUILD_NUMBER'
      }
    }
    stage('Install Docker') {
      steps {
        sh 'ansible-playbook demo/Ansible/dockerinstall.yaml'
      }
    }
    stage('Deploy container') {
      steps {
        sh 'ansible-playbook demo/Ansible/deploycontainer.yaml -e "image_name=$repo image_tag=$BUILD_NUMBER"'
      }
    } 
 }
}