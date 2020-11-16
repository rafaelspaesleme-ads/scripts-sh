#!/bin/bash

#criando app react
echo "Digite o nome da sua aplicação: "
read nameApp
npx create-react-app ${nameApp}

echo "Criando pastas estruturais..."
mkdir ${nameApp} + "/src/assets"
mkdir ${nameApp} + "/src/assets/images"
mkdir ${nameApp} + "/src/assets/icons"
mkdir ${nameApp} + "/src/assets/fonts"
mkdir ${nameApp} + "/src/assets/files"
mkdir ${nameApp} + "/src/assets/docs"
mkdir ${nameApp} + "/src/services"
mkdir ${nameApp} + "/src/services/apis"
mkdir ${nameApp} + "/src/services/securities"
mkdir ${nameApp} + "/src/services/configs"
mkdir ${nameApp} + "/src/components"
mkdir ${nameApp} + "/src/containers"
mkdir ${nameApp} + "/src/documentations"
mkdir ${nameApp} + "/src/pages"
mkdir ${nameApp} + "/src/pages/privates"
mkdir ${nameApp} + "/src/pages/publics"
mkdir ${nameApp} + "/src/routes"
mkdir ${nameApp} + "/src/utils"
mkdir ${nameApp} + "/src/utils/validations"
mkdir ${nameApp} + "/src/utils/functions"
mkdir ${nameApp} + "/src/utils/constants"
mkdir ${nameApp} + "/src/utils/formatters"
mkdir ${nameApp} + "/src/utils/trashs"

echo "Removendo arquivos inutilizaveis, neste inicio de projeto..."
rm ${nameApp} + "/src/App.css"
rm ${nameApp} + "/src/App.js"
rm ${nameApp} + "/src/App.test.js"
rm ${nameApp} + "/src/index.css"
rm ${nameApp} + "/src/index.js"
rm ${nameApp} + "/src/logo.svg"
rm ${nameApp} + "/src/reportWebVitals.js"
rm ${nameApp} + "/src/setupTests.js"

echo "Você vai usar SASS? (Escolha S ou N)"
read useSass

echo "Vai usar JSX? (Escolha S ou N)"
read useJsx

echo "Criando arquivos iniciais..."
touch ${nameApp} + "/src/services/apis/api.js"
touch ${nameApp} + "/src/services/apis/endpoints.js"

if [ ${useSass} = "S" ];
then
  yarn add node-sass
  touch ${nameApp} + "/src/styles.scss"
else
  touch ${nameApp} + "/src/styles.css"
fi  

if [ ${useJsx} = "S" ];
then
  touch ${nameApp} + "/src/App.jsx"
  touch ${nameApp} + "/src/index.jsx"
  echo "import React from 'react';\nimport {TaskPage} from './pages/TaskPage';\n\nexport const App = () => (<div/>);" >> ${nameApp} + "/src/App.jsx"
    if [ ${useSass} = "S" ];
    then
        echo "import React from 'react';\nimport ReactDOM from 'react-dom';\nimport './styles.scss';\nimport {App} from "./App";\n\nconst rootElement = document.getElementById('root');\nReactDOM.render(<App />, rootElement);" >> ${nameApp} + "/src/index.jsx"
    else
        echo "import React from 'react';\nimport ReactDOM from 'react-dom';\nimport './styles.css';\nimport {App} from "./App";\n\nconst rootElement = document.getElementById('root');\nReactDOM.render(<App />, rootElement);" >> ${nameApp} + "/src/index.jsx"
    fi  
else
  touch ${nameApp} + "/src/App.js"
  touch ${nameApp} + "/src/index.js"
  echo "import React from 'react';\nimport {TaskPage} from './pages/TaskPage';\n\nexport const App = () => (<div/>);" >> ${nameApp} + "/src/App.js"
    if [ ${useSass} = "S" ];
    then
        echo "import React from 'react';\nimport ReactDOM from 'react-dom';\nimport './styles.scss';\nimport {App} from "./App";\n\nconst rootElement = document.getElementById('root');\nReactDOM.render(<App />, rootElement);" >> ${nameApp} + "/src/index.js"
    else
        echo "import React from 'react';\nimport ReactDOM from 'react-dom';\nimport './styles.css';\nimport {App} from "./App";\n\nconst rootElement = document.getElementById('root');\nReactDOM.render(<App />, rootElement);" >> ${nameApp} + "/src/index.js"
    fi  
fi

exit
