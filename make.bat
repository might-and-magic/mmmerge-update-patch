REM regenerate after nsis_folder\files modification

mmarch df2n "nsis_folder/files" "nsis_folder/script.nsi" "files"

REM then update MMMerge_Update.nsi manually and compile to MMMerge_Update_%patchVer%.exe (usually /SOLID lzma is the best)

"C:\Program Files (x86)\NSIS\makensis" /X"SetCompressor /SOLID lzma" "nsis_folder/MMMerge_Update.nsi"
