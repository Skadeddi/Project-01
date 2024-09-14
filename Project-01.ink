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
VAR pipe = false
VAR dark = false
VAR light = false

->CastleInTheAir
== CastleInTheAir ==
You wake up on your sailboat in the middle of a vast, blue ocean. You see a crumbling, sunken castle in the distance. You are only a few minutes out.
+ [Start steering towards the castle.]

After a few minutes of sailing, you arrive at the castle and drift through the main gate into a flooded courtyard. Where there was once a field of grass there is now only water and seaweed rising up from the bottom.
-> MainGate

+ [Go back to sleep.]

You decide to go back to sleep and let the boat take you the rest of the way. After once again waking up, you find yourself drifting right outside of one of the side walls of the castle. Seeing a hole large enough to sail through, you enter.

-> InnerCell

== InnerCell ==
{You find yourself in a small prison cell, probably in the top level of a larger dungeon. | You are in the inner cell.} The rusty iron cell door is locked, but there might be something that could help open it in the water.
* [Dive into the water.]

You slide off of your boat and into the water. It's surprisingly clear, but the salt makes it hard to keep your eyes open. Looking around, you spot one of the iron bars has come off of the door and is lying on the ground. You pick it up and surface.
~ pipe = true
-> InnerCell
+ [Try to break the door down.] -> KickDownTheDoor
-> DONE

== KickDownTheDoor ==
What do you use?
+ [The boat]
{not pipe: You can't figure out a way to hit the door with enough force to make it open. -> InnerCell | You use the bar to push off of what's left of the back wall and hit the door with enough force to bust it open.}
-> DungeonEntrance
+ {pipe}  [The pipe]
You try to pry the door open with the iron bar, but it doesn't budge. -> InnerCell

== DungeonEntrance ==
{You and your boat drift into the main room of the prison. You want to go explore the rest of the castle, but you notice a stairway leading down further into the water. From the looks of the stairway, there's a chance that the lower floor still has some air on the ceiling. | You are in the dungeon entrance.}

+ [Leave the prison.] -> MainGate
* [Swim down to the lower level.]
You swim down the stairs and surface in a dim hallway, lit only by holes in the ceiling. You swim down the hallway until it's too dark to see, and then keep swimming. You swim much farther than where you thought the hallway ended, and then swim even further still, until your arm touches a stone wall at the end. You spot a glimmer from under the water, the first light you've seen in about 20 minutes. You dive down and reach your hand out towards it. You grab nothing, but your eyes start taking in light you didn't know was there, and suddenly the pitch black water is well lit. You surface to find yourself at the end of the dungeon hallway, which couldn't be more that 100 feet long. You swim back to the dungeon entrance.
~ dark = true
-> DungeonEntrance

== MainGate ==
You are in the main courtyard, right outside the main gate. You see a large set of double doors leading into the main tower and a building next to it that looks like a prison.
{&The water is shimmering. | The seaweed slithers. | There are fish swimming underneath the boat.}

+ [Go to the prison.] ->DungeonEntrance
+ [Go into the main tower.] -> Tower

== Tower ==
{Inside, you see a cracked and faded spiral staircase leading up to the top of the tower. There is also another set of double doors behind the staircase. It's decorated with an ornate mural, painted using a combination of very light and very dark colors. | You are in the main room of the tower.}
* [Go up the staircase.] -> UpperTower
+ [Look at the mural.] -> Mural

== UpperTower ==
You climb up the spiral staircase and enter a glass dome at the top of the tower. The dome seems to refract light into the tower, as it is unbearably bright. You walk further into the room until you are able to just barely make out a cloak hanging on a chair. You pick up the cloak to try and shield yourself from the light, but it fizzles out as you drape it over yourself. The cloak is gone, but your eyes start adjusting and taking in all the extra light. You get a good look at your surroundings, and the endless ocean is even more dazzling seen through the dome. After finding nothing else, you head back down the staircase.
~ light = true
-> Tower

== Mural ==
{not dark and not light: You look at the mural but can't make out any definite shapes, it just looks like black and white splotches. Maybe you could find something to help you decipher it before you go in.}
{dark and not light: You can see the detail in the dark parts of the mural, but you can't make out any of the light parts. You see depictions of war and bloodshed in what looks like a siege on the castle.}
{light and not dark: You can see the detail in the light parts of the mural, but you can't make out any of the dark parts. You see culture, art, and festivals occurring throughout the castle.}
{light and dark: You see the mural in full detail now. There are depictions of war and bloodshed, but also of art and culture in what looks like a history of the castle.}
+ [Go through the doors.]
-> Searching
+ [Go back.]
-> Tower

== Searching ==
{not dark: You open the doors and are met with a long unlit hallway. As you step in, the doors fall back closed under their own weight. You walk with your arm outstretched for awhile, until you feel another set of double doors. You open them and set foot right back inside the main room of the tower. -> Tower | You open the doors and are met with a long unlit hallway, but your eyes quickly adjust to the brightness. As you step in, the doors fall back closed under their own weight. You walk for awhile until you start to see light at the end. After a few more minutes, you arrive in a dazzlingly bright room.}
-> Tetrachromacy

== Tetrachromacy ==
{not light: The light is blinding, so much so that you can't keep your eyes open. You continue through the light with your hand over your face until you feel a set of wooden doors in front of you. You open them and step into the main room of the tower. ->Tower | Your eyes quickly adjust from the pitch black hallway to the piercing light of the room you stand before. Inside, you see a fountain spraying a grayish water. You see the mural that was on the doors appear again on the wall behind the fountain.}
+ [Place your head under the water.]
-> TheFourthColor

== TheFourthColor ==
You place your head under the fountain and feel the cold water wash over your face and into your eyes. The water that was once gray is now a color you have never seen before, and in its refractions are hundreds more. Turning your head towards the wall, you see that the mural was never black and white, but a hundred different vibrant hues, combining to tell a completely different story than black and white could ever convey. You see every miniscule drop of water splashing from the fountain and the movement of the air itself. You turn around to find the double doors open right behind you, and you step through to the main room and up the spiral stairs. The observatory that had been nothing more than a bright dome of glass now allows you to see for thousands of miles, and you take your place as the new overseer of Polygondwanaland.
-> END