pipeline {
      agent any
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
                      echo 'Starting Jira'
              }
          }


          stage ("Stop Jira") {
              when {
                  expression {
                      params.ACTION == 'Stop Jira'
              }
          }
              steps {
                echo 'Stopping Jira'
              }
          }

      }
}
