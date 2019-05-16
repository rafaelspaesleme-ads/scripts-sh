pipeline {
    agent any
    stages {
        stage('Removendo pacotes antigos') {
            steps {
                sh 'curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/manager/delete-last-devops.sh | bash'
            }
        }
        stage('Gerando acesso via SCP/SSH') {
            steps {
                timeout(time: 20, unit: 'SECONDS') {
                    sh 'curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/manager/ssh-key-generate.sh | sh'
                }
            }
        }        
        stage('Criando ambiente DevOps') {
            steps {
                sh 'curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/manager/create-env-devops.sh | bash'
            }
        }        
        stage('Transferindo dados para servidor') {
            steps {
                sh 'curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/manager/data-scp.sh | sh'
            }
        }
        stage('Removendo restos') {
            steps {
                sh 'curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/manager/delete-last-devops.sh | bash'
            }
        }
    }
    post {
        always {
            echo 'Executando retornos do job.'
        }
        success {
            echo 'Ambiente criado com sucesso!'
        }
        failure {
            echo 'Erro ao criar ambiente. Consulte o log da console.'
        }
        unstable {
            echo 'Este build demonstra instabilidade'
        }
        changed {
            echo 'Comandos alterados no pipeline... a verificar.'
            echo 'Builder em falha recuperado com sucesso!'
        }
    }
}
