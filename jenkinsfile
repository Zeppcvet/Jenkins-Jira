pipeline {
      agent any
      parameters {
          string(name: 'Action', defaultValue: '', description: 'Choose action to perform')
          choice(name: 'Action', choices: ['Start Jira', 'Stop Jira'],description: '')

      }
      stages {

          stage ("Start Jira"){
              when {
                  expression{
                      params.Action = 'Start Jira'
                  }
              }
              steps {
                  echo "Start Jira"
              }
          }
          stage ("Stop Jira"){
          when {
              expression{
                  params.Action = 'Stop Jira'
              }
          }
              steps {
                echo "Stop Jira"
              }
          }

      }
}
