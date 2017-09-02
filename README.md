# Schneidzekk
The Schneidzekk medic gun for Killing Floor 2

\<KF2Userdir\> = C:\Users\\\<UserName\>\Documents\My Games\KillingFloor2  
\<KF2SDKdir\> = C:\Program Files (x86)\Steam\steamapps\common\killingfloor2

* Clone/UnZip to \<KF2Userdir\>\KFGame\Src\
* Edit \<KF2Userdir\>\KFGame\Confg\KFEditor.ini and add ModPackages=Schneidzekk to the [ModPackages] section.
* Copy the Packages\ subdirectory into \<KF2Userdir\>\KFGame\Published\BrewedPC\
* Open command prompt in \<KF2SDKdir\>\Binaries\Win64\
* Enter: KFEditor.exe make -useunpublished
* Enter: KFEditor.exe" brewcontent -platform=PC SchneidZekk
* Copy the Localization\ subdirectory into \<KF2Userdir\>\KFGame\
* On game console enter: open \<KF-MapName\>?Game=SchneidZekk.SchneidzekkGameInfo_survival
* Better yet: open \<KF-MapName\>?Mutator=SchneidZekk.SchneidzekkMutator

Enjoy my favorite KF1 weapon.
