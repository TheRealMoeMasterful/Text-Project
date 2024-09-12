/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

You are in your restaurant, a cheap diner downtown. The diner is empty. The sun is just now rising. You are sitting in one of the booths. You have been doing so for hours now. You are looking down at the table. There, written on a napkin is your masterwork: "1 pound of ground beef, 1 pound of melted cheese, 1 pound of mayonnaise, 1 pound of ketchup, 1 diced onion, 1 diced pickle, stir it all together, then pour it out." Beneath these instructions, one last note is written, doubly underlined, its importance apparant. "CREATE THE VILE GLOP" it reads. You stand, and set off on your quest.
-> Diner

== Diner ==
You are in your diner. The restaurant is closed and your staff have yet to arrive. The rising sun shines through the windows. All is quiet. On a table lies a napkin, with your instructions written clear as day upon it.

+Go out the front
-> Street

+Go to the kitchen
-> Kitchen


+Examine the menu
Burgers, omelettes, soups, salads... nothing's special, none of it matters. The Vile Glop will soon render them all worthless.
-> Diner

+Review the napkin
"1 pound of ground beef, 1 pound of melted cheese, 1 pound of mayonnaise, 1 pound of ketchup, 1 diced onion, 1 diced pickle, stir it all together, then pour it out." Beneath these instructions, one last note is written, doubly underlined, its importance apparant. "CREATE THE VILE GLOP" it reads.
-> Diner

==Kitchen==
The kitchen. So strange that this dimly lit room with its yellowing plaster will soon be the site of the creation of your magnum opus.

+Go out the back
-> Alley

+Go to diner
-> Diner