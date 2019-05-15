pipeline {
    agent any
    stages {
        stage('Removendo pacotes antigos') {
            steps {
                sh 'curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/manager/delete-last-devops.sh | bash'
            }
        }
        stage('Criando ambiente DevOps') {
            steps {
                sh 'curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/manager/creat-env-devops.sh | bash'
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
