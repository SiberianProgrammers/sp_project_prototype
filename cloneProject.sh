#!/bin/bash
dir=$1 # Считываем название директории
projectName=$dir

workDir=$PWD
#TODO - доделать, ведь название может быть кривым
prototypeFolder=${workDir:(-21)} # выдираем название текущей папки с прототипом

#workDir=${workDir/dxsprojectprototype/} # директория, куда будем копировать

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
		echo "Папка с таким проектом уже существует, удалить папку? Введите y или n"
		read answer

		while [[ "$answer" != "y" || "$answer" != "no" ]]
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

# Теперь рабочая папка та, в которую все скопировали
cd ../
cd $projectName

workDir=$PWD

echo "workDir after = $workDir"

# Удаление лишних файлов из нового каталога
rm -r -f "$workDir/cloneProject.sh"
rm -r -f "$workDir/Readme.txt"
rm -r -f "$workDir/.DS_Store"
rm -r -f "$workDir/.git"
rm -r -f "$workDir/.gitignore"
rm -r -f "$workDir/dxs_project_prototype.pro.user"

workDir="$workDir"
# Переименовываем .pro файл
mv dxs_project_prototype.pro $projectName.pro

# Правим Android
# Меняем AndroidManifest
echo "Введите новое имя пакета android"
read packageName
androidFolder="$workDir/Android"
manifestFile="$androidFolder/AndroidManifest.xml"
sed -i '' "s/com.dxs.project.prototype/$packageName/g" "$manifestFile"

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

firstLetter=${activityName:0:1}
firstLetter=$firstLetter | tr "[:lower:]" "[:upper:]"
firstLetter=$(tr "[:lower:]" "[:upper:]" <<< $firstLetter)
activityName="$firstLetter${activityName:1:${#activityName}-1}Activity"

# Меняем название пакета в DxsProjectPrototypeActivity.java и копируем куда нужно
cp -R "$androidFolder/src/com/dxs/project/prototype/" $activityFolder
sed -i '' "s/com.dxs.project.prototype/$packageName/g" "$activityFolder/DxsProjectPrototypeActivity.java"
sed -i '' "s/DxsProjectPrototypeActivity/$activityName/g" "$manifestFile"
mv "$activityFolder/DxsProjectPrototypeActivity.java" "$activityFolder/$activityName.java"

#Удаляем лишние папки
rm -r -f "$androidFolder/src/com/dxs/project/prototype/"
#TODO удалить, если не пусты
#rmdir "$androidFolder/src/com/dxs/project/"
#rmdir "$androidFolder/src/com/dxs/"

exit 0