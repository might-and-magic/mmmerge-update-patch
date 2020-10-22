# Might and Magic 6 7 8 Merge Update Patch Changelog

Changelog since version `2020-05-26`. Posted casually by the original author Rodril in his [original thread of MMMerge](https://www.celestialheavens.com/forum/10/16657) after some of the latest releases. I copied and pasted here for information.

## `2020-08-16fix`
This fix was made exceptionally by me (Tom Chen):
- fixes [automatic quest completion and dialogue displacement bugs](https://www.celestialheavens.com/forum/10/16657?start=5880#p382652) that appear in `2020-08-16`, by replacing the buggy `Scripts/Structs/After/RemoveNPCTablesLimits.lua` file with an older version

## `2020-08-16`

No features, only fixes of major bugs caused by previous update:

- monsters could not attack party in melee range in turn-based mode;
- characters were able to use extra quick spells while game was paused;
- monsters could not walk through passages, previously blocked by invisible walls.

## `2020-07-12`

This update contain mainly bugfixes and quality of life improvements:

- MM6 skill teachers will leave map notes, so you'll be able to easier track them back;
- Pathfinder will disable itself, if game runs in win 95-98 compatibility mode, thus it won't cause lags;
- unique names of mm6 monsters have been restored (Lurch, Agar, etc);
- rare bug from original version of the game have been fixed: melee damage from monsters to already dead monster was redirected to party, - not anymore;
- Lloyd beacon and savegames won't work at MM6-7 arenas anymore, also Verdant will never appear there.
- bunch of minor bugs.

## `2020-05-26`

- Localizations won't give glitches anymore, and quick spells sounds will work properly.
- ...
