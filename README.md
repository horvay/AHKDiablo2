AHKDiablo2
==========

Note, this program will override the following key combinations and they won't work anywhere else until the program is disabled:
* Space
* Alt x
* Alt z
* 5
* Shift 5

=Using the program=

You must run this as administrator. Right click on the diabloII.exe file and select run as administrator. It will take about 20 seconds to start working.

=Stopping the program=

In your systray, right click the Autohotkey icon and select "Exit"

=Modifying the script=

To modify this script, modify the ahk file in a text editor and save it. Then right click on the file, and select "compile script." Then run as normal.

=Item movement=

1. Hover over an item and hit Spacebar - This will move an item from the stash to the inventory or an item from the inventory to the stash. This works best for one square items. Bigger items may have issues.

2. Hover over an item and hit 5 - This will deposit an item into your cube. The cube must be visible and not covered by the hovered item's popup menu.
3. Shift 5 with cube closed - This will open the cube, click transmute, grab the result, close the cube, put the mouse cursor where it started.
4. Shift 5 with cube open - This will click transmute and pick up the result, but not put it anywhere.

Example:
Hover over a chip gem and hit 5. Do this 3 times. Click Shift 5, place the result in your stash.

=Auto loot=

The following is a bit buggy. Alt + z works reliably, but sometimes Alt + x will continue clicking and you have to alt tab to stop it.

Alt + z - Pick up one item (you must hold down alt until the item is picked up.)
Alt + x - Pick up items as long as there are more to pick up (you must keep alt held down.)

Both of the above only pick up particular items: scrolls, elixirs, demon boxes (maybe keys too?), flawless and perfect gems, set items, uniques, and gold. This will pick up some rubbish sometimes. 
If it keeps clicking (bug) alt tab out and back in.



