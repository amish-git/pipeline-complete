pipeline {
    environment {
        repo = "amishtm/pythonapp-pipeline"
    }

agent any
// demo 2
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
   stage('Deploy container') 
   {
      steps {
        sh 'ansible-playbook Ansible/pipeline.yaml -e "image_name=$repo image_tag=v$BUILD_NUMBER"'
      }
    }
  }   
}  
 