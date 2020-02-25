# Intellij

echo Qual versão do Intellij você usa? (Ex.: 2019.3)
read versionIdea

echo "Removing evaluation key for Intellij"
rm -rf $HOME/.IntelliJIdea${versionIdea}/config/eval/*.key
rm -rf $HOME/.IntelliJIdea${versionIdea}/config/options/other.xml
rm -rf ~/.java/.userPrefs/jetbrains/idea
sed -i '/evlsprt/d' $HOME/.IntelliJIdea${versionIdea}/config/options/options.xml
sed -i '/evlsprt/d' $HOME/.java/.userPrefs/prefs.xml
find $HOME/.IntelliJIdea${versionIdea}* -type d -exec touch -t $(date +"%Y%m%d%H%M") {} +;
find $HOME/.IntelliJIdea${versionIdea}* -type f -exec touch -t $(date +"%Y%m%d%H%M") {} +;

echo "Finalizado!"
