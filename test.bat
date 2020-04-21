SET patchVer=2020-04-??

xcopy /s /y /e /v /i "mmmerge-2019-09-22" "mmmerge-2019-09-22 to check"
xcopy /s /y /e /v /i "mmmerge-2019-10-08" "mmmerge-2019-10-08 to check"
xcopy /s /y /e /v /i "mmmerge-2020-03-17" "mmmerge-2020-03-17 to check"
xcopy /s /y /e /v /i "mmmerge-2020-03-29" "mmmerge-2020-03-29 to check"
xcopy /s /y /e /v /i "mmmerge-2020-04-19-patched" "mmmerge-2020-04-19-patched to check"
xcopy /s /y /e /v /i "mmmerge-2020-04-19-aio" "mmmerge-2020-04-19-aio to check"

copy /Y "nsis_folder\MMMerge_Update_%patchVer%.exe" "mmmerge-2019-09-22 to check\MMMerge_Update_%patchVer%.exe"
"mmmerge-2019-09-22 to check\MMMerge_Update_%patchVer%.exe"

move "mmmerge-2019-09-22 to check\MMMerge_Update_%patchVer%.exe" "mmmerge-2019-10-08 to check"
"mmmerge-2019-10-08 to check\MMMerge_Update_%patchVer%.exe"

move "mmmerge-2019-10-08 to check\MMMerge_Update_%patchVer%.exe" "mmmerge-2020-03-17 to check"
"mmmerge-2020-03-17 to check\MMMerge_Update_%patchVer%.exe"

move "mmmerge-2020-03-17 to check\MMMerge_Update_%patchVer%.exe" "mmmerge-2020-03-29 to check"
"mmmerge-2020-03-29 to check\MMMerge_Update_%patchVer%.exe"

move "mmmerge-2020-03-29 to check\MMMerge_Update_%patchVer%.exe" "mmmerge-2020-04-19-patched to check"
"mmmerge-2020-04-19-patched to check\MMMerge_Update_%patchVer%.exe"

move "mmmerge-2020-04-19-patched to check\MMMerge_Update_%patchVer%.exe" "mmmerge-2020-04-19-aio to check"
"mmmerge-2020-04-19-aio to check\MMMerge_Update_%patchVer%.exe"

del "mmmerge-2020-04-19-aio to check\MMMerge_Update_%patchVer%.exe"

mmarch compare "mmmerge-2019-09-22 to check" "mmmerge-2020-04-??"
mmarch compare "mmmerge-2019-10-08 to check" "mmmerge-2020-04-??"
mmarch compare "mmmerge-2020-03-17 to check" "mmmerge-2020-04-??"
mmarch compare "mmmerge-2020-03-29 to check" "mmmerge-2020-04-??"
mmarch compare "mmmerge-2020-04-19-patched to check" "mmmerge-2020-04-??"
mmarch compare "mmmerge-2020-04-19-aio to check" "mmmerge-2020-04-??"


rmdir /s /q "mmmerge-2019-09-22 to check" "mmmerge-2019-10-08 to check" "mmmerge-2020-03-17 to check" "mmmerge-2020-03-29 to check" "mmmerge-2020-04-19-patched to check" "mmmerge-2020-04-19-aio to check"
