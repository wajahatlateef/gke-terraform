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
        stage('viewing  terraform plan'){
            steps{
                script{
                    sh'''
                        terraform plan  
                    '''
                }
            }
        }
        stage('Applying terraform'){
            steps{
                script{
                    sh'''
                        terraform apply  -auto-approve
                    '''
                }
            }
        }
    }
}