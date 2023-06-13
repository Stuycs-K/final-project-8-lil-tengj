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

broken features:
-sometimes the special candy's color might not be the expected color(it won't affect the power of the candy)
-sometimes the audio of the game might lag when the player perform too many swapping in a short time.

content that's helpful:
Sound library and Processing reference

## Lisa Li

### May 22nd

Panel Class with constructors and some methods

### May 23rd

fillPanel() method and get() method

### May 24th

eliminate() method

### May 25th

eliminate4,5() method; Level Class

### May 26th

instantiated level in Panel; add score() method

### May 29th

displaying score and goal

### May 30th

display goal and score; help button

### May 31st

randomize levels; play again button

### June 1st

fix wording; work log; demo branch

### June 5th

created the SpecialCandy Class

### June 6th

moved SpecialCandy class properties to Candy class to not typecast

### June 7th

started working on colourBomb

### June 8th

bomb method - activates colourBomb

### June 9th

added colourBomb to swap; work log


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
