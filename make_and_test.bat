cd %~dp0



mmarch compare mmmerge-2019-09-22 mmmerge-2019-10-08 filesonly diff_folder
mmarch compare mmmerge-2019-10-08 mmmerge-2020-03-17 filesonly diff_folder
mmarch compare mmmerge-2020-03-17 mmmerge-2020-03-29 filesonly diff_folder

xcopy /s /y /e /v /i "mmmerge-2019-09-22" "mmmerge-2019-09-22 to check"
xcopy /s /y /e /v /i "mmmerge-2019-10-08" "mmmerge-2019-10-08 to check"
xcopy /s /y /e /v /i "mmmerge-2020-03-17" "mmmerge-2020-03-17 to check"



mmarch df2n "diff_folder" "nsis_folder/script.nsi" "files"
mmarch df2n "nsis_folder/files" "nsis_folder0/script.nsi" "files"

copy /Y mmarch.exe "nsis_folder/mmarch.exe"
"C:\Program Files (x86)\NSIS\makensis" "nsis_folder/script.nsi"
move "nsis_folder\patch.exe" "mmmerge-2019-09-22 to check"
"mmmerge-2019-09-22 to check/patch.exe"

move "mmmerge-2019-09-22 to check\patch.exe" "mmmerge-2019-10-08 to check"
"mmmerge-2019-10-08 to check/patch.exe"

move "mmmerge-2019-10-08 to check\patch.exe" "mmmerge-2020-03-17 to check"
"mmmerge-2020-03-17 to check/patch.exe"

del "mmmerge-2020-03-17 to check\patch.exe"

mmarch compare "mmmerge-2019-09-22 to check" "mmmerge-2020-03-29"
mmarch compare "mmmerge-2019-10-08 to check" "mmmerge-2020-03-29"
mmarch compare "mmmerge-2020-03-17 to check" "mmmerge-2020-03-29"



rmdir /s /q "mmmerge-2019-09-22 to check" "mmmerge-2019-10-08 to check" "mmmerge-2020-03-17 to check"
