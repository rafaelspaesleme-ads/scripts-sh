#!bin/bash
# Run of root!

# update package's
apt-get update
apt-get upgrade

# removendo versões do node/npm pré-instaladas no ubuntu
apt-get --purge remove nvm
apt-get --purge remove npm
apt-get --purge remove nodejs

# update package's
apt-get update
apt-get upgrade

# Instalando pacote nvm e seus derivados (node e npm)
versionNvm=$( dialog --title 'INSTALL ENV REACT' --stdout --inputbox 'Digite o numero da versão do nvm\nEx.: (0.34.0): ' 0 0 )
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v${versionNvm}/install.sh | bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v${versionNvm}/install.sh | zsh

versionNode=$( dialog --title 'INSTALL ENV REACT' --stdout --inputbox 'Digite o numero da versão do node\nEx.: (10.15.3): ' 0 0 )
nvm install v${versionNode}


resposta=$( dialog --title 'INSTALL ENV REACT' --stdout --menu 'Escolha uma das opções:' 0 0 0   1 'COM ANDROID STUDIO' 2 'EXPO' 3 'Cancelar' )
case "$resposta" in
    1)
        
        ################# ---------------------- install for necessity of xCode and Android Studio

        # update package's
        apt-get update
        apt-get upgrade
        
        # install package java
        add-apt-repository ppa:openjdk-r/ppa
        apt update
        apt install openjdk-8-jdk

        # uninstall version old of Android Studio
        apt-get --purge remove android*
        apt-get --purge remove Android*

        # install new Android Studio
        sudo snap install android-studio --classic

        # Configurando variaveis de ambiente ANDROID_HOME
        echo "# VARIÁVEL DE AMBIENTE DO ANDROID SDK" >> $HOME/.bashrc
        echo "export ANDROID_HOME=$HOME/Android/Sdk" >> $HOME/.bashrc
        echo "export PATH=$PATH:$ANDROID_HOME/tools" >> $HOME/.bashrc
        echo "export PATH=$PATH:$ANDROID_HOME/platform-tools" >> $HOME/.bashrc

        echo "# VARIÁVEL DE AMBIENTE DO ANDROID SDK" >> $HOME/.zshrc
        echo "export ANDROID_HOME=$HOME/Android/Sdk" >> $HOME/.zshrc
        echo "export PATH=$PATH:$ANDROID_HOME/tools" >> $HOME/.zshrc
        echo "export PATH=$PATH:$ANDROID_HOME/platform-tools" >> $HOME/.zshrc

        # install dependency
        apt install -y autoconf automake build-essential libtool pkg-config libssl-dev python-dev

        # install Watchman
        cd

        git clone https://github.com/facebook/watchman.git
        cd watchman
        git checkout v4.9.0
        ./autogen.sh
        ./configure --enable-lenient
        make
        make install


        # install react native-cli
        npm install -g react-native-cli

        # init of project
        nameProjectNative=$( dialog --title 'INSTALL ENV REACT' --stdout --inputbox 'Digite o nome do projeto: ' 0 0 )
        react-native init $nameProjectNative

        execAndroidIos=$( dialog --title 'INSTALL ENV REACT' --stdout --menu 'Escolha uma das opções:' 0 0 0   1 'iOS' 2 'Android' 3 'Cancelar' )
        case "$execAndroidIos" in
            1)
                # Runner of iOS
                react-native run-ios
            ;;
            2)
                # Runner of Android
                react-native run-android
            ;;
            3)
                echo "Cancelado."
            ;;
        esac

        code $nameProjectNative

    ;;
    2)

        ################# ---------------------- install user Expo

        npm i -g create-react-native-app

        nameProjectExpo=$( dialog --title 'INSTALL ENV REACT' --stdout --inputbox 'Digite o nome do projeto: ' 0 0 )
        create-react-native-app $nameProjectExpo

        cd $nameProjectExpo

        # starting
        npm start

        # ejecting
        npm eject

    ;;
    3)
        dialog                                            \
        --title 'INSTALL ENV REACT'                             \
        --msgbox 'Cancelado.'  \
        6 40    
    ;;
esac



