#!/bin/bash
dir=$1 # Считываем название директории
projectName=$dir

workDir=$PWD
#TODO - доделать, ведь название может быть кривым
prototypeFolder=${workDir:(-20)} # выдираем название текущей папки с прототипом

# Работа с папкой
if [[ "$dir" == "" ]]; then
	# При вводе команды не ввели новое название папки
	echo "Введите название новой папки с проектом. Она будет расположена в ${workDir/$prototypeFolder/}"
	read newFolder
	dir=${workDir/$prototypeFolder/$newFolder}
	projectName=$newFolder

	# Создаем новую папку
	mkdir $dir
	# копируем всю папку 
	cp -R "$workDir/" $dir
else
	# Проверяем наличие папки
    dir=${workDir/$prototypeFolder/$dir}

	if [ ! -d "$dir" ]; then
    	# Создаем новую папку
		mkdir $dir
		# копируем всю папку 
		cp -R "$workDir/" $dir
	else
		#Папка оказалась не пустой
        echo "Папка с таким проектом уже существует, удалить папку? (y/n)"
		read answer

		while [[ "$answer" != "y" || "$answer" != "n" ]]
		do
			case "$answer" in
  				"y") 
					rm -r -f $dir
					# Создаем новую папку
					mkdir $dir
					# копируем всю папку 
					cp -R "$workDir/" $dir
					break
					;;
	
  				"n" ) # ответ no 
					echo "Пожалуйста, удалите папку сами"
					exit -1
					;;
	
  				*    ) # ждем ответ yse или no
					echo "Пожалуйста введите y или n"
					read answer
					;;
			esac  
		done # while [[ "$answer" != "yes" || "$answer" != "no" ]]
	fi # if [ ! -d "${workDir/$prototypeFolder/$dir}" ]; then
fi # if [[ "$dir" == "" ]]; then

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
#rm -r -f "$workDir/.gitignore"
rm -r -f "$workDir/sp_project_prototype.pro.user"

workDir="$workDir"
# Переименовываем .pro файл
mv sp_project_prototype.pro $projectName.pro

# Правим Android
# Меняем AndroidManifest
echo "Введите новое имя пакета android. Например"
echo "com.sp.myProject"
read packageName
androidFolder="$workDir/Android"
manifestFile="$androidFolder/AndroidManifest.xml"
sed -i '' "s/com.sp.projectPrototype/$packageName/g" "$manifestFile"

# Меняем иерархию папок в android/src/com/...
IFS='.' read -r -a array <<< "$packageName"
activityFolder="$androidFolder/src"
activityName=""

for element in "${array[@]}"
do
    activityFolder="$activityFolder/$element"
    activityName=$element
    if [ ! -d "$activityFolder" ]; then
    	mkdir $activityFolder
	fi
done

sed -i '' "s/projectPrototype/$activityName/g" "$projectName.pro"
sed -i '' "s/projectPrototype/$activityName/g"           "Include/Consts.h"

firstLetter=${activityName:0:1}
firstLetter=$firstLetter | tr "[:lower:]" "[:upper:]"
firstLetter=$(tr "[:lower:]" "[:upper:]" <<< $firstLetter)

activityName="$firstLetter${activityName:1:${#activityName}-1}Activity"
# Добавляем перед Activity Sp
activityName="Sp$activityName"

echo "Новое имя anctivity = $activityName"
# Меняем путь до папок Android в *.pro файле
sed -i '' "s/sp_project_prototype/$projectName/g" "$projectName.pro"
sed -i '' "s/SpProjectPrototypeActivity/$activityName/g" "$projectName.pro"
sed -i '' "s/SpProjectPrototypeActivity/$activityName/g" "Include/Consts.h"

# Меняем название пакета в SPProjectPrototypeActivity.java и копируем куда нужно
cp -R "$androidFolder/src/com/sp/projectPrototype/" $activityFolder
sed -i '' "s/com.sp.projectPrototype/$packageName/g" "$activityFolder/SpProjectPrototypeActivity.java"
sed -i '' "s/SpProjectPrototypeActivity/$activityName/g" "$activityFolder/SpProjectPrototypeActivity.java"
sed -i '' "s/SpProjectPrototypeActivity/$activityName/g" "$manifestFile"

mv "$activityFolder/SpProjectPrototypeActivity.java" "$activityFolder/$activityName.java"

#Удаляем лишние папки
rm -r -f "$androidFolder/src/com/sp/projectPrototype/"

#Правим Programmist.pri
echo "Введите вашу директиву логирования, например SP_ALEUS"
read logDefine
sed -i '' "s/SP_ALEUS/$logDefine/g" Programmer.pri

exit 0
