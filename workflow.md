# Update Instruction

When updating, do one of the following:
* Regenerate nsis_folder/files with all versions (from mmmerge-2019-09-22) using make0.bat
* Copy old nsis_folder/files to diff_folder, then generate diff_folder from newly updated versions instead of all versions using make0.bat (see comments in make0.bat)

Then manually do the following things:

Do not include

* MMExtension.txt(.todelete)
* MMEditor Readme.txt(.todelete)
* MM8Patch ReadMe_rus.TXT
* mm8.ini
* Scripts/Localization/
* Data/Text localization/

Add

* Scripts/General/Obsolete.todelete/
* Scripts/General/Misc.todelete/

Delete

* DataFiles/ (delete DataFiles/ and add DataFiles.todelete/)

Optionally, compare old files/ folder with the new one.

Delete old files/, move new files/ to nsis_folder/.

Generate script.nsi using make.bat.

Manually update MMMerge_Update.nsi (copy FILE COPYING block and update VERSION).

Compile MMMerge_Update.nsi to MMMerge_Update_%patchVer%.exe with GUI NSIS and Best Compressor (usually /SOLID lzma is the best).
