def git_url = 'https://github.com/koolwithk/cs16.git'
def git_branch = 'master'

pipeline
{
    agent {
        label 'master'
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
        
        stage('docker build')
        {
            when {
                expression { false }
            }
            steps
            {
                    sh '''
                    echo "docker build"
                    '''
            }
        }        
        stage('deploy')
        {
            agent {
                label 'lp-kmaster-01'
            }
            
            steps
            {
                git credentialsId: 'github', url: git_url , branch: git_branch

                sh '''
                kubectl delete -f kubernetes/cs16-nfs-deployment.yml  && true
                kubectl apply -f kubernetes/cs16-nfs-deployment.yml
                '''
            }
        }
    }
}
