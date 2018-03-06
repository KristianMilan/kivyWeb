# kivyWeb
create web server with bottle and kivy in Android

Requirement: kivy, buildozer

Installation, Documentation and Examples
----------------------------------------
1. run buildozer init in som folder.
2. The files in java folder is for Android source code.
3. add uses-permission, service, and receiver in .buildozer\android\platform\python-for-android\dist\pivotserver\templates\AndroidManifest.tmpl.xml. Please refer AndroidManifest.xml in java folder.
4. put BootReceiver and ServiceWebservice in .buildozer\android\platform\python-for-android\dist\pivotserver\src folder.
5. run buildozer android debug deploy run

