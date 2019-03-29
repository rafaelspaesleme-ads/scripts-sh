# REALIZANDO IMPLANTACAO DE UM AMBIENTE 100% DOCKERIZADO EM UM SERVIDOR LINUX

![![alt](https://link)](https://i2.wp.com/itsfoss.com/wp-content/uploads/2016/11/cloud-centric-Linux-distributions.jpg)

### PASSO #1

#### Iniciando a instalacao em um ambiente local linux:
- Abra o terminal linux local (Comando atalho default: CTRL + ALT + T)

#### Iniciando a instalacao em um ambiente local windows:
- Abra o PowerShell ou baixe o **[Git Bash]**: 

### PASSO #2

#### Realizando acesso remoto ao servidor:
>Para realizar o acesso ao servidor, iremos utilizar a conexao via ```ssh``` da seguinte forma:

- Baixe o script de **[acesso remoto]**  via ssh:

- Utilize o seguinte comando: 

~/ ```wget https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-server/remote-access-ssh.sh``` 

para realizar o download.


- Execute o script da seguinte forma: 

~/ ```./remote-access-ssh.sh``` 

ou 

~/ ```./remote-access-ssh.sh | bash```


- Siga os passos que sera apresentado no terminal.

>Provavelmente voce tera que informar o ```IP``` do seu servidor. Para saber o atual ```IP``` do seu servidor, execute o seguinte comando (no linux): ```ifconfig -a``` (no Windows): ```ipconfig /all```

### PASSO #3

#### Acessando remotamente o servidor e fazendo instalação do ambiente:
>Após realizar o acesso remoto via ```ssh``` acesse seu usuário root através do seguinte comando:

~/ ```sudo su```


- Digite a senha root do seu servidor e execute o comando abaixo: 

~/ ```./install-docker-env-dev-server-full.sh | sh``` 

ou

~/ ```./install-docker-env-dev-server-full.sh```


- Após este procedimento, a instalação do seu ambiente começará automaticamente. Fique atento as informações que serão solicitadas a você no decorrer da instalação.

### PASSO #4

#### Acessando os serviços(containers) instalados.
>Ao termino da instalação, seu ambiente server estará pronto para uso.

- Para saber informações para acesso aos serviços instalados, basta executar o comando abaixo:

~/ ```docker ps```


- E escolha o serviço que deseja utilziar!

- Caso o serviço desejado não esteja em execução, execute os seguintes comandos para startar o serviço desejavel:

~/ ```docker ps -a``` 


~/ ```docker start <id_container>```


- Após inicializar o serviço (container) desejado, acesse o seu navegador local e digite o host do serviço ```http://<ip_server>:<port_service>``` para comece a trabalhar!


[Git Bash]: https://gitforwindows.org/
[acesso remoto via]: vhttps://github.com/rafaelspaesleme-ads/scripts-sh/blob/master/instalador_env/env-server/remote-access-ssh.sh