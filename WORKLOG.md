# Work Log

working features:
(the final version of this game should provide a smoothing experience for the player with no huge bug)
-main menu to select two different mode
-swapping of two neighbor candy(only allow when it can eliminate)
-eliminate when meet the requirement of at least three same candies
-drop the pre-existing candy from top to bottom after eliminate
-fill the empty space with newly generated candies
-generate special candy when meet specific requirement
-special candy perform power when swapped
-eliminating candy that's the same as the objective will be recorded
-when the objective is met, a winning menu will show up and play music after 2 seconds.
-sound effect when eliminate
-add the number of candies eliminated to the score if the candies type matches.

broken features:
-sometimes the special candy's color might not be the expected color(it won't affect the power of the candy)
-sometimes the audio of the game might lag when the player perform too many swapping in a short time.
-pressing 'r' will also automatically choose the easier level.
-can swap all special candies with any candy (even if they're not the same type).
-special candies don't automatically eliminate even if they are able to (four of same candies in a row, but the special candy is the 2nd one, doesn't eliminate).
-when connecting four or more in a row, the special candy formed is always the leftmost, topmost of the eliminated candies.

content that's helpful:
Sound library and Processing reference

## Lisa Li

### May 22nd

Created the Panel Class with constructor.

### May 23rd

Completed the fillPanel() method and get() methods, added instance variables.

### May 24th

Made sure that the fillPanel() cannot create a board with three or more in a row. Started working on the eliminate() method.

### May 25th

Created eliminate4,5() methods that are called in eliminate(). Started on the Level class.

### May 26th

Implemented level in Panel and crushPanel. Created a addScore() method in Level.

### May 29th

Merge conflict fixes. Worked on checking if the player passed the level + victory screen.

### May 30th

Displayed the goal and score. Made a keyPressed() method for when there are no possible candies to swap.

### May 31st

RandomizeD levels with different number of candies and type of candy. Created a play again button after victory screen.

### June 1st

Fixed the wording of the victory screen. Created the demo branch.

### June 5th

Created the SpecialCandy Class with constructors.

### June 6th

Combined the SpecialCandy class and the Candy class due to typecasting issues in crushP.

### June 7th

Started working on the colourBomb candy (remove all candies of the same type). Images for the vertical and horizontal striped candies.

### June 8th

Checked for colourBomb in eliminate() and activates colourBomb (addScore()).

### June 9th

Due to stack overflow, moved colourBomb checking to swap() method.


## Juntao Teng

### May 22nd

Candy Class with constructors and some methods:

### May 23rd

Panel toString(): print out the panel with all the candies' color;
draw() Panel : draw all candies on the screen by showing respective colored rectangle

### May 24th

Candy swap() method: swap candy with its neighbor by pressing and dragging the mouse
moveDown() in progress

### May 25th

moveDown(): move the pre-existing candy from the top to bottom to replace the empty spaces
dropNew() : randomly generate candy to fill up the empty spaces in the grid

### May 26th

solving merge conflict;
swap back build in(when two candy being swapped do not trigger any elimination);

### May 29th

images added to replace the colored rectangle for better graphic

### May 30th

work log file updates; making plan together for future development

### May 31st

debugging code;
elimination sound effect added(took some reference from Processing website and Sound Library)

### June 1st

sound effects when swap occurs but does not eliminate(do not work as expected, the sound would often lag)
readme file updates

### June 4th

trying to blend the candy image: finding image with transparent background

### June 6th

background with transparent candy background

### June 7th

starting menu with instruction and mode to choose.
game menu, wining menu, and BGM

### June 8th

special candy images added

### June 9th

level win sound effect: to be played after 2 second after play achieve his/her level
different level difficulties: New mode added---venti (smaller candy size so the screen can display more candies, higher objective therefore longer playtime)
special candies method finished: vertical stripe eliminate a column, horizontal stripe eliminate a row, candy bomb clear a specific color of candy on the panel.
polished graphic with better font

### June 10th

fix the bug that special candy elimination will not add the to the score.

### June 11th

fix the bug that special candy is generated based on the objective; finalizing README.
