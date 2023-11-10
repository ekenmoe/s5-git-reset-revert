pipeline {
       agent   any // {
                    //  label 'development'
                  //  }
        environment {
            ENV = "production"
            APP_name = "s5"
		DOCKERHUB_CREDENTIALS = "credentials" //('dockerhub')
	      }

        options {
              buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '15', numToKeepStr: '10')
              disableConcurrentBuilds()
              timestamps()
           }

        triggers {
              pollSCM 'H/15 * * * *'
           }

       stages {

        stage('Setup parameters') {
            steps {
                script {
                    properties([
                        parameters([
                        
                        choice(
                            choices: ['Dev', 'QA', 'Preprod', 'Prod'], 
                            name: 'Environment'
                                 
                                ),


                          string(
                            defaultValue: 'develop',
                            name: 'Area',
			    description: 'Enter the image Tag to deploy',
                            trim: true
                            ),
                        ])
                    ])
                }
            }
        }


        stage('SCM checkout') {
            environment { 
                AN_ACCESS_KEY = "my-predefined-secret-text"
            }
            steps {
                sh '''
                touch s5emilson.sh
                echo "nice try" > s5emilson.sh
                sleep 1

                '''
            }
        }

        stage('Sonaqube Scan') {
            environment { 
                
                AN_ACCESS_KEY = "my-predefined-secret-text"
            }
            steps {
                sh '''
                ls
                pwd
                free -m
                sleep 1

                '''
            }
        }
                stage('Quality Gate') {
                    environment { 
                AN_ACCESS_KEY = "my-predefined-secret-text"
            }
            steps {
                sh '''
                ls
                pwd
                free -m
                sleep 1

                '''
            }
        }
        stage('Built Binaries') {
            environment { 
                AN_ACCESS_KEY = "my-predefined-secret-text"
            }
            steps {
                sh '''
                cat /etc/*release
                w
                whoami
                sleep 1

                '''
            }
        }
        stage('E2E - Test') {
            environment { 
                AN_ACCESS_KEY = "my-predefined-secret-text"
            }
            steps {
                sh '''
                id
                df -h
                du
                sleep 1

                '''
            }
        }
                stage('Built Image') {
                    environment { 
                AN_ACCESS_KEY = "my-predefined-secret-text"
            }
            steps {
                sh '''
                nproc
                lsblk
                uname
                sleep 1

                '''
            }
        }
        
        stage('Push Image') {
            environment { 
                AN_ACCESS_KEY = "my-predefined-secret-text"
            }
            steps {
                sh '''
                uname -a
                uname -r
                sleep 1

                '''
            }
        }

        stage('update Helm Chart') {
            environment { 
                AN_ACCESS_KEY = "my-predefined-secret-text"
            }
            steps {
                sh '''
                ls
                pwd
                free -m
                sleep 1

                '''
            }
        }
        stage('Waiting for ArgoCD to Deploy') {
            environment { 
                AN_ACCESS_KEY = "my-predefined-secret-text"
            }
            steps {
                sh '''
                ls
                pwd
                free -m
                sleep 2

                '''
            }
        }

    }

     

post {
   
   success {
      slackSend (channel: '#development-alerts', color: 'good', message: "SUCCESSFUL: Application s5-EKTSS  Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
    }

 
    unstable {
      slackSend (channel: '#development-alerts', color: 'warning', message: "UNSTABLE: Application s5-EKTSS  Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
    }

    failure {
      slackSend (channel: '#development-alerts', color: '#FF0000', message: "FAILURE: Application s5-EKTSS Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
    }
   
    cleanup {
      deleteDir()
    }
}




}
