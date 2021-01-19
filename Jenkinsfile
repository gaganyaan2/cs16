def git_url = 'https://github.com/koolwithk/cs16.git'
def git_branch = 'master'

pipeline
{
    agent {
        label 'build'
    }
    stages
    {
       /*stage('Git-checkout')
        {
            steps
            {
                git credentialsId: 'github', url: git_url , branch: git_branch
            }
        }*/
       stage('build')
        {
            steps
            {
                sh '''
                docker build -t cs16 .
                docker tag cs16 koolwithk/cs16:latest
                '''
            }
        }
       stage('push')
        {
            steps
            {
                sh 'docker push koolwithk/cs16:latest'
            }
        } 
     }
}     
       
