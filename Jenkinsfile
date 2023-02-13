pipeline{
    agent any
    stages{
        stage('Initializing terraform'){
            steps{
                script{
                    sh '''
                        terraform init
                    '''
                }
            }
        }
        stage('Applying terraform'){
            steps{
                script{
                    sh'''
                        terraform apply -yes
                    '''
                }
            }
        }
    }
}