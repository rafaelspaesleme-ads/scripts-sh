# REALIZANDO IMPLANTACAO DO AMBIENTE EM UM SERVIDOR

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

```wget https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-server/remote-access-ssh.sh``` 

para realizar o download.


- Execute o script da seguinte forma: 

```./remote-access-ssh.sh``` 

ou 

```./remote-access-ssh.sh | bash```


- Siga os passos que sera apresentado no terminal.

>Provavelmente voce tera que informar o ```IP``` do seu servidor. Para saber o atual ```IP``` do seu servidor, execute o seguinte comando (no linux): ```ifconfig -a``` (no Windows): ```ipconfig /all```


[Git Bash]: https://gitforwindows.org/
[acesso remoto via]: vhttps://github.com/rafaelspaesleme-ads/scripts-sh/blob/master/instalador_env/env-server/remote-access-ssh.sh