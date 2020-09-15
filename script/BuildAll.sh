VarUp (){
global_var=104.6920
run_var=0

}
BuildUp (){
echo "------------Begin Operation------------"
echo "version is  = $global_var"
echo "------------Begin Building------------"
./gradlew desktop:dist -Pbuildversion=$global_var
./gradlew server:dist -Pbuildversion=$global_var
./gradlew android:assembleRelease -Pbuildversion=$global_var
}
CleanUp (){
echo "------------Begin Cleaning------------"
echo "Begin clean up"
r
rm -r deploy/Cilent
rm mindustry-windows-32-bit-o7-$global_var.zip
rm mindustry-windows-64-bit-o7-$global_var.zip
rm deploy/gdrive/mindustry-windows-32-bit-o7-$global_var.zip
rm deploy/gdrive/mindustry-windows-64-bit-o7-$global_var.zip
rm -r deploy/gdrive/deploy
rm local.properties
}
PrepareUp (){
echo "------------Begin Preparing------------"
echo "Preparing"
mkdir "deploy"
echo "sdk.dir=/home/itz/Android/Sdk" > local.properties
cd deploy
mkdir "Cilent"
mkdir "gdrive"
cd gdrive
gdrive
cd ../
cd Cilent
mkdir "mindustry-windows-32-bit-o7-$global_var"
mkdir "mindustry-windows-64-bit-o7-$global_var"
cd ../
cd ../
}
MoveUp (){
echo "------------Begin Moving------------"
mv -f desktop/build/libs/Mindustry.jar deploy/Cilent/Mindustry-o7-Desktop-$global_var.jar
mv -f server/build/libs/server-release.jar deploy/Cilent/Mindustry-o7-Server-$global_var.jar
mv -f android/build/outputs/apk/release/android-release-unsigned.apk deploy/Cilent/Mindustry-o7-Android-UNSIGNED-$global_var.apk
}
CopyUp (){
echo "------------Begin Copying------------"
cp -f deploy/Cilent/Mindustry-o7-Server-$global_var.jar script/server.jar
cp -f -r deploy/32bit deploy/Cilent/mindustry-windows-32-bit-o7-$global_var
cp -f -r deploy/64bit deploy/Cilent/mindustry-windows-64-bit-o7-$global_var
cp -f deploy/Cilent/Mindustry-o7-Desktop-$global_var.jar deploy/Cilent/mindustry-windows-32-bit-o7-$global_var/32bit/jre/desktop.jar
cp -f deploy/Cilent/Mindustry-o7-Desktop-$global_var.jar deploy/Cilent/mindustry-windows-64-bit-o7-$global_var/64bit/jre/desktop.jar
}
TestUp (){
echo "------------Begin Testing------------"
echo "$now"
echo "Current date: $now"
}
ZipUp (){
echo "------------Begin Zipping------------"
zip -r deploy/Cilent/mindustry-windows-64-bit-o7-$global_var.zip deploy/Cilent/mindustry-windows-64-bit-o7-$global_var
zip -r deploy/Cilent/mindustry-windows-32-bit-o7-$global_var.zip deploy/Cilent/mindustry-windows-32-bit-o7-$global_var
rm -r deploy/Cilent/mindustry-windows-64-bit-o7-$global_var/
rm -r deploy/Cilent/mindustry-windows-32-bit-o7-$global_var/
}
UploadUp (){
echo "------------Begin Upload------------"
cp -r -f deploy/Cilent/ deploy/gdrive/o7_Projects/
cd deploy/gdrive/
grive
cd ../
cd ../
}
FinishUp (){
echo "------------Operation Done------------"
echo " "
echo " "
echo " "
echo " "
echo "Result:"
echo " "
echo " "
echo "----------------------------------------"
echo "Mindustry o7 "$global_var
echo " "
echo "Changelog: "
echo "+ Mindustry Tag: 104.6"
echo "+ "$global_var Tag
echo "+ NSDAP Supported"
echo "+ Android Supported"
echo " "
echo "Module: "
echo "+ Spy   2.2 "
echo "+ Grief 1.2 "
echo "+ Anti Grief 2.3 "
echo "+ NSDAP 1.5"
echo "+ A.I 0.5"
echo " "
echo "Multi Platform Link:"
echo "https://drive.google.com/drive/folders/1Hebjkd0Ipq_mOKwzhSjFFh76juRdBkm-?usp=sharing"
echo " "
echo "Note: Permission request is needed"
echo "----------------------------------------"
}

Main (){
a=0
if [ $a != 0 ]
then
    return
else
a=1
cd ../
VarUp
BuildUp
CleanUp
PrepareUp
MoveUp
CopyUp
ZipUp
UploadUp
FinishUp

fi
}

Main
