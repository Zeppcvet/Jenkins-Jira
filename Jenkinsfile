pipeline {
  agent {
    kubernetes {
      label 'ubuntu-git-jira-remote'
      idleMinutes 5
      yamlFile 'jira-start-stop.yaml'
      defaultContainer 'ceregousa/ubuntu-git'
    }
  }
  parameters {
    choice(name: 'ACTION', choices: ['Start Jira', 'Stop Jira'],description: '')

      }
  stages {
    stage ("Checkout") {
      steps {
        container('ceregousa/ubuntu-git') {
          checkout([
            $class: 'GitSCM',
            doGenerateSubmoduleConfigurations: false,
            branches: [[name: '*/main']],
            extensions: [],
            userRemoteConfigs: [[
              credentialsId: 'e8e8080e-3157-4b8c-8345-e5442c710163',
              url: 'https://github.com/Zeppcvet/Jenkins-Jira']]
            ])
      }
      success {
        echo ('//////////////////////////////Checkout Success//////////////////////////////////')
      }
      failure {
        echo ('//////////////////////////////Checkout Failure//////////////////////////////////')

      }  
      
      
      }
    }
  
    stage ("Start Jira") {
      when {
        expression {
          params.ACTION == 'Start Jira'
        }
      }
      steps {
        container('ceregousa/ubuntu-git') {
          sshagent (credentials : ['46c88c19-2b36-4f86-90b0-024e702cebe0'])
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@ec2-3-68-183-70.eu-central-1.compute.amazonaws.com'
            sh 'ssh -v ubuntu@ec2-3-68-183-70.eu-central-1.compute.amazonaws.com'
            sh 'echo "starttest1" > starttestfile.txt'
        }
      }
    }


    stage ("Stop Jira") {
      when {
        expression {
          params.ACTION == 'Stop Jira'
        }
      }
      steps {
        container('ceregousa/ubuntu-git') {
          sshagent (credentials : ['46c88c19-2b36-4f86-90b0-024e702cebe0'])
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@ec2-3-68-183-70.eu-central-1.compute.amazonaws.com'
            sh 'ssh -v ubuntu@ec2-3-68-183-70.eu-central-1.compute.amazonaws.com'
            sh 'echo "stopttest1" > stoptestfile.txt'
        }
      }
    }
  }
}
