; Might and Magic 678 Merge Update Patch Installer
; Written by Tom CHEN
; https://github.com/might-and-magic/mmmerge-update-patch
; MIT License

;--------------------------------
;Include Modern UI
!include "MUI2.nsh"

;--------------------------------
;Variables and constants

!define OUTFILE "MMMerge_Update"
!define VERSION "2020-08-16fix"

!define VERSIONDOT "4.0.0.0"

;--------------------------------
;General

;Name and file
Name "Might and Magic 678 Merge Update Patch ${VERSION}"
OutFile "${OUTFILE}_${VERSION}.exe"
Unicode True
; AutoCloseWindow true

VIProductVersion "${VERSIONDOT}"
VIAddVersionKey "ProductName" "Might and Magic 678 Merge ${VERSION} Update Patch"
VIAddVersionKey "FileDescription" "Might and Magic 678 Merge ${VERSION} Update Patch"
VIAddVersionKey "LegalTrademarks" "Might and Magic is a trademark of Ubisoft Entertainment SA"
VIAddVersionKey "LegalCopyright" "NWC/3DO; Ubisoft; MMMerge Team"
VIAddVersionKey "FileVersion" "${VERSIONDOT}"
VIAddVersionKey "ProductVersion" "${VERSIONDOT}"

BrandingText "NWC/3DO; Ubisoft; MMMerge Team"

!define MUI_ICON "icon.ico"

;--------------------------------
;Default installation folder
InstallDir $EXEDIR

;Request application privileges for Windows Vista
RequestExecutionLevel user

;--------------------------------
;Pages

!insertmacro MUI_PAGE_INSTFILES

;--------------------------------
;Languages

!insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section
; if $EXEDIR\Scripts\General\1_TownPortalSwitch.lua exists,
; it will be safe to assume $EXEDIR is MMMerge folder
	IfFileExists "$EXEDIR\Scripts\General\1_TownPortalSwitch.lua" is_mmmerge_folder is_not_mmmerge_folder

	is_mmmerge_folder:

;-----FILE COPYING (MODIFYING, DELETING) STARTS HERE-----

		SetOutPath $INSTDIR
		File mmarch.exe

		RMDir /r /REBOOTOK "$INSTDIR\DataFiles"
		RMDir /r /REBOOTOK "$INSTDIR\Scripts\General\Misc"
		RMDir /r /REBOOTOK "$INSTDIR\Scripts\General\Obsolete"

		File /r /x *.todelete /x *.mmarchkeep files\*.*

		Delete "Data\breach.sprites.lod"
		Delete "Data\gaunt.icons.lod"
		Delete "Data\LocalizeTables.txt"
		Delete "Data\new.lod"
		Delete "Data\weather.icons.lod"
		Delete "Scripts\General\ExtraQucikSpells.lua"
		Delete "Scripts\Modules\PathfinderAsmBroken.lua"
		Delete "Scripts\Modules\PathfinderAsmOld.lua"

		nsExec::Exec 'mmarch delete "Data\icons.lod" "cd1.evt"'
		nsExec::Exec 'mmarch delete "Data\icons.lod" "cd2.evt"'
		nsExec::Exec 'mmarch delete "Data\icons.lod" "cd3.evt"'
		nsExec::Exec 'mmarch delete "Data\icons.lod" "lwspiral.evt"'

		nsExec::Exec 'mmarch add "Data\EnglishT.lod" "Data\EnglishT.lod.mmarchive\*.*"'
		RMDir /r /REBOOTOK "$INSTDIR\Data\EnglishT.lod.mmarchive"
		nsExec::Exec 'mmarch add "Data\icons.lod" "Data\icons.lod.mmarchive\*.*"'
		RMDir /r /REBOOTOK "$INSTDIR\Data\icons.lod.mmarchive"
		nsExec::Exec 'mmarch add "Data\mm6.EnglishT.lod" "Data\mm6.EnglishT.lod.mmarchive\*.*"'
		RMDir /r /REBOOTOK "$INSTDIR\Data\mm6.EnglishT.lod.mmarchive"
		nsExec::Exec 'mmarch add "Data\mm6.games.lod" "Data\mm6.games.lod.mmarchive\*.*"'
		RMDir /r /REBOOTOK "$INSTDIR\Data\mm6.games.lod.mmarchive"
		nsExec::Exec 'mmarch add "Data\mm7.games.lod" "Data\mm7.games.lod.mmarchive\*.*"'
		RMDir /r /REBOOTOK "$INSTDIR\Data\mm7.games.lod.mmarchive"
		nsExec::Exec 'mmarch add "Data\patch.icons.lod" "Data\patch.icons.lod.mmarchive\*.*"'
		RMDir /r /REBOOTOK "$INSTDIR\Data\patch.icons.lod.mmarchive"
		nsExec::Exec 'mmarch add "Data\select.icons.lod" "Data\select.icons.lod.mmarchive\*.*"'
		RMDir /r /REBOOTOK "$INSTDIR\Data\select.icons.lod.mmarchive"

		Delete "mmarch.exe"

;-----FILE COPYING (MODIFYING, DELETING) ENDS HERE-----

		goto end_of_condition

	is_not_mmmerge_folder:

		MessageBox MB_OK "Error: can't find the game folder. Please move ${OUTFILE}_${VERSION}.exe to your game folder before executing it."

		Quit

	end_of_condition:

SectionEnd
