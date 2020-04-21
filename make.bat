REM regenerate after nsis_folder\files modification

mmarch df2n "nsis_folder/files" "nsis_folder/script.nsi" "files"

REM then update MMMerge_Update.nsi manually and compile to MMMerge_Update_%patchVer%.exe
