pipeline {
  agent {
    kubernetes {
      label 'jira-start-stop'
      idleMinutes 5
      yamlFile 'jenkins-jobs/pod-templates/jira-start-stop.yaml'
      defaultContainer 'ubuntu:latest'
    }
  }
  parameters {
    choice(name: 'ACTION', choices: ['Start Jira', 'Stop Jira'],description: '')

      }
  stages {
    stage ("Start Jira") {
      when {
        expression {
          params.ACTION == 'Start Jira'
        }
      }
      steps {
        container('ubuntu:latest') {
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
        container('ubuntu:latest') {
          sshagent (credentials : ['46c88c19-2b36-4f86-90b0-024e702cebe0'])
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@ec2-3-68-183-70.eu-central-1.compute.amazonaws.com'
            sh 'ssh -v ubuntu@ec2-3-68-183-70.eu-central-1.compute.amazonaws.com'
            sh 'echo "stopttest1" > stoptestfile.txt'
        }
      }
    }
  }
}
