pipeline{
    agent any
    stages{
        stage('checkout the code from github'){
            steps{
                 git url: 'https://github.com/Balunideepak/healthcare-project.git'
                 echo 'github url checkout'
            }
        }
        stage('codecompile with akshat'){
            steps{
                echo 'starting compiling'
                sh 'mvn compile'
            }
        }
        stage('codetesting with akshat'){
            steps{
                sh 'mvn test'
            }
        }
        stage('qa with akshat'){
            steps{
                sh 'mvn checkstyle:checkstyle'
            }
        }
        stage('package with akshat'){
            steps{
                sh 'mvn package'
            }
        }

         stage('Test Results') {
            steps {
               echo 'This is for generating Test Results'
               publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, icon: '', keepAll: false, reportDir: '/var/lib/jenkins/workspace/healthcareproject/target/surefire-reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
            }
          }

     stage('Docker Image Creation') {
      steps {
           echo 'This is for Docker image build'
           sh 'docker build -t balunideepak/healthcare:latest .'
            }
          }
     stage('Login to Dockerhub') {
      steps {
             withCredentials([usernamePassword(credentialsId: 'dockeruser', passwordVariable: 'password', usernameVariable: 'username')]) {
          // withCredentials([usernameColonPassword(credentialsId: 'docker-id-user', variable: 'docker-all')]) {
          // withCredentials([string(credentialsId: 'dockercode', variable: 'dockervarcode')]) {
           sh 'docker login -u balunideepak -p ${password}'
                         }
                   }
               }        
    
     stage('Push the Docker image') {
      steps {
        sh 'docker push balunideepak/healthcare:latest'
                  }
            }
     stage('Ansible Playbook') {
      steps {
        ansiblePlaybook credentialsId: 'sshkey', disableHostKeyChecking: true, installation: 'ansible', inventory: '/etc/ansible/hosts', playbook: 'ansible-playbook.yml', vaultTmpPath: ''
                                }
            } 
        
    }
}
