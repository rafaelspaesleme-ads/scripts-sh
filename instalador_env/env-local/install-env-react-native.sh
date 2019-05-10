#!bin/bash
# Run of root!

# update package's
apt-get update
apt-get upgrade

# install node
apt-get install nodejs
apt install npm


resposta=$( dialog --title 'INSTALL ENV REACT' --stdout --menu 'Escolha uma das opções:' 0 0 0   1 'NATIVE' 2 'EXPO' 3 'Cancelar' )
case "$resposta" in
    1)
        
        ################# ---------------------- install for necessity of xCode and Android Studio
        
        # install react native-cli
        npm install -g react-native-cli

        # init of project
        nameProjectNative=$( dialog --title 'STRUCTURE DEVOPS-CI' --stdout --inputbox 'Digite o nome do projeto: ' 0 0 )
        react-native init $nameProjectNative

        cd $nameProjectNative

        # Runner of iOS
        react-native run-ios

        # Runner of Android
        react-native run-android

    ;;
    2)

        ################# ---------------------- install user Expo

        npm install -g create-react-native-app

        nameProjectExpo=$( dialog --title 'STRUCTURE DEVOPS-CI' --stdout --inputbox 'Digite o nome do projeto: ' 0 0 )
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



