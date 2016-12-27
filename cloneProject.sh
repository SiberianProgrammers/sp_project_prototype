#!/bin/bash
dir=$1 # Считываем название директории
projectName=$1

currentOs=$(uname -s)

workDir=$PWD
originDir=$PWD
#TODO - доделать, ведь название может быть кривым
prototypeFolder=${workDir:(-20)} # выдираем название текущей папки с прототипом

dir=${workDir/$prototypeFolder/$dir}
# Работа с папкой
if [[ "$projectName" == "" ]]; then
       # При вводе команды не ввели новое название папки
       echo "Введите название новой папки с проектом. Она будет расположена в ${workDir/$prototypeFolder/}"
       read newFolder
       dir=${workDir/$prototypeFolder/$newFolder}
       projectName=$newFolder
fi # if [[ "$dir" == "" ]]; then

if [ ! -d $dir ]; then
     echo "Создаем новую папку $dir"
    # Создаем новую папку
    mkdir -p $dir
    # копируем всю папку
    cp -R $workDir/* $dir
else
    # Папка оказалась не пустой
    mkdir -p ../old_$projectName
    cp -R ../$projectName/* ../old_$projectName
    rm -r -f $dir

    # Создаем новую папку
    mkdir -p $dir
    # копируем всю папку
    cp -R $workDir/* $dir
    echo "Папка с таким проектом уже существует. Старая папка переименова в old_$projectName"
fi # if [ ! -d "${workDir/$prototypeFolder/$dir}" ]; then

# Теперь рабочая папка та, в которую всё скопировали
cd ../
cd $projectName
workDir=$PWD

# Копируем .gitignore
cat "../sp_project_prototype/.gitignore" > .gitignore

# Удаление лишних файлов из нового каталога
rm -r -f "$workDir/cloneProject.sh"
rm -r -f "$workDir/Readme.txt"
rm -r -f "$workDir/.DS_Store"
rm -r -f "$workDir/.git"
rm -r -f "$workDir/sp_project_prototype.pro.user"

workDir="$workDir"
# Переименовываем .pro файл
mv sp_project_prototype.pro $projectName.pro

echo "Введите имя приложения по-русски"
read applicationName

if [[ "$currentOs" == "Darwin" ]]; then
    sed -i '' "s@Sp Project Prototype@$applicationName@g" $workDir/Source/Main.cpp
    sed -i '' "s@Siberian Programmers@$applicationName@g" $workDir/Android/res/values/strings.xml
else
    sed -i "s@Sp Project Prototype@$applicationName@g" $workDir/Source/Main.cpp
    sed -i "s@Siberian Programmers@$applicationName@g" $workDir/Android/res/values/strings.xml
fi


# Правим Android
# Меняем AndroidManifest
echo "Введите новое имя пакета android. Например"
echo "com.sp.myProject"
read packageName
androidFolder="$workDir/Android"
manifestFile="$androidFolder/AndroidManifest.xml"

if [[ "$currentOs" == "Darwin" ]]; then
    sed -i '' "s@com.sp.projectPrototype@$packageName@g" "$manifestFile"
else
    sed -i "s@com.sp.projectPrototype@$packageName@g" "$manifestFile"
fi

# Меняем иерархию папок в android/src/com/...
IFS='.' read -r -a array <<< "$packageName"
activityFolder="$androidFolder/src"
activityName=""
activityFolderPath=""

rm -r -f "$androidFolder/src/com/"

for element in "${array[@]}"
do
    activityFolder="$activityFolder/$element"

    if [[ "$activityFolderPath" == "" ]]; then
        activityFolderPath="$element"
    else
		#activityFolderPath="$activityFolderPath\/$element"
        activityFolderPath="$activityFolderPath/$element"
    fi

    activityName=$element
    if [ ! -d "$activityFolder" ]; then
        mkdir -p $activityFolder
    fi
done


oldActiviryFolder=com\/sp\/projectPrototype

if [[ "$currentOs" == "Darwin" ]]; then
    sed -i '' "s@$oldActiviryFolder@$activityFolderPath@g" $projectName.pro
    sed -i '' "s@$oldActiviryFolder@$activityFolderPath@g" Include/Consts.h
else
    sed -i "s@$oldActiviryFolder@$activityFolderPath@g" $projectName.pro
    sed -i "s@$oldActiviryFolder@$activityFolderPath@g" Include/Consts.h
fi

cp -R $workDir/../sp_project_prototype/Android/src/com/sp/projectPrototype/* $activityFolder

if [[ "$currentOs" == "Darwin" ]]; then
    sed -i '' "s@com.sp.projectPrototype@$packageName@g" $activityFolder/SpProjectPrototypeActivity.java
else
    sed -i "s@com.sp.projectPrototype@$packageName@g" $activityFolder/SpProjectPrototypeActivity.java
fi

#-------------------------------------------------------------------------------------
# Вырезал смену имени SpProhectPrototypeActivity
#sed -i '' "s@projectPrototype/$activityName/g" "$projectName.pro"
#sed -i '' "s@projectPrototype/$activityName/g"  "Include/Consts.h"

#firstLetter=${activityName:0:1}
#firstLetter=$firstLetter | tr "[:lower:]" "[:upper:]"
#firstLetter=$(tr "[:lower:]" "[:upper:]" <<< $firstLetter)

#activityName="$firstLetter${activityName:1:${#activityName}-1}Activity"
# Добавляем перед Activity Sp
#activityName="Sp$activityName"
#echo "Новое имя anctivity = $activityName"

#sed -i '' "s/sp_project_prototype/$projectName/g" "$projectName.pro"
#
#sed -i '' "s/SpProjectPrototypeActivity/$activityName/g" "$projectName.pro"
#sed -i '' "s/SpProjectPrototypeActivity/$activityName/g" "Include/Consts.h"
#
## Меняем название пакета в SPProjectPrototypeActivity.java и копируем куда нужно
#cp -R "$androidFolder/src/com/sp/projectPrototype/" $activityFolder
#sed -i '' "s/com.sp.projectPrototype/$packageName/g" "$activityFolder/SpProjectPrototypeActivity.java"
#sed -i '' "s/SpProjectPrototypeActivity/$activityName/g" "$activityFolder/SpProjectPrototypeActivity.java"
#sed -i '' "s/SpProjectPrototypeActivity/$activityName/g" "$manifestFile"


# Вырезал смену имени SpProhectPrototypeActivity
# Меняем путь до папок Android в *.pro файле
#sed -i '' "s/sp_project_prototype/$projectName/g" "$projectName.pro"
#
#sed -i '' "s/SpProjectPrototypeActivity/$activityName/g" "$projectName.pro"
#sed -i '' "s/SpProjectPrototypeActivity/$activityName/g" "Include/Consts.h"
#
## Меняем название пакета в SPProjectPrototypeActivity.java и копируем куда нужно
#cp -R "$androidFolder/src/com/sp/projectPrototype/" $activityFolder
#sed -i '' "s/com.sp.projectPrototype/$packageName/g" "$activityFolder/SpProjectPrototypeActivity.java"
#sed -i '' "s/SpProjectPrototypeActivity/$activityName/g" "$activityFolder/SpProjectPrototypeActivity.java"
#sed -i '' "s/SpProjectPrototypeActivity/$activityName/g" "$manifestFile"

#mv "$activityFolder/SpProjectPrototypeActivity.java" "$activityFolder/$activityName.java"

#Удаляем лишние папки
#rm -r -f "$androidFolder/src/com/sp/projectPrototype/"

# конец вырезания
#-------------------------------------------------------------------------------------

#Правим Programmist.pri
echo "Введите вашу директиву логирования, например SP_ALEUS"
read logDefine

if [[ "$currentOs" == "Darwin" ]]; then
    sed -i '' "s/SP_ALEUS/$logDefine/g" Programmer.pri
else
    sed -i "s/SP_ALEUS/$logDefine/g" Programmer.pri
fi



#Инициализируем git
rm -r sp_qt_libs
git init
git add *
git add .gitignore
git commit -m "Заглавный коммит."
git submodule add git@bitbucket.org:siberian_programmers/sp_qt_libs.git
git commit -m "Добавлен модуль sp_qt_libs."
git checkout -b develop

exit 0
