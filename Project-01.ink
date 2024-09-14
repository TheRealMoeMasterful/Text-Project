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
VAR time = 1 // 0 = Dawn, 1 = Morning, 2 = Afternoon, 3 = Evening, 4 = Night

->Seashore

//DIALOGUE

==Sleep==
You lay back on the soft sand and your eyes begin to close. You are fast asleep. When do you wake up?
    * [Afternoon]
    By the time you wake up, the sun is high in the sky.
    ~time = 2
    -> Seashore
    * [Evening]
    By the time you wake up, the sky is beginning to darken as the sun dips below the ocean horizon.
    ~time = 3
    -> Seashore
    * [Night]
     By the time you wake up, it is dark outside. The stars wheel above you.
     ~time = 4
     -> Seashore
    * [The next morning]
      By the time you wake up, the sun is... peeking over the horizon again? It must be the next morning.
      ~time = 0
        -> Seashore

==Woman_1==
"Hello. Aplogies for my intrusion."

*[Explain that this is your cabin]
-> Woman_2

*[Demand the woman leave]
-> Woman_3

*[Shoot the woman]
-> Woman_4

==Woman_2==
"I apologize. I will leave now." She stands and walks into the woods. The forest consumes her.
-> Clearing

==Woman_3==
"I apologize sir. I only mean to stay a little while."

*[Drive her away]
-> Woman_5

*[Allow her to stay]
-> Woman_6

==Woman_4==
You fire a single bullet into the woman. She shrieks and runs into the forest. She leaves a trail of blood.
-> Clearing

==Woman_5==
"You refuse me? You dare turn me away?" She slowly stands from the rocking chair. She turns into a raven. She flies into the forest. A single black feather falls to the ground.
-> Clearing

==Woman_6==
"Thank you. Could you bring me some water from under the arch?" She hands you a bowl.
-> Clearing

==Woman_7==
"Good." She stands from the chair and walks into the cabin.
->Clearing

==Drink_1==
You sip the brew. It sears your mouth as it pours down your throat. The searing is agonizing. I spreads through your whole body. You collapse. You die. Idiot.
        -> END

==Drink_2==
You drink the brew. You begin to feel lighter. Your bones hollow out. You shrink. You grow a coat of feathers. You are now a bird.
-> END

==Death==
As you fall into slumber, you feel your body begin to grow cold. You hear the cry of a raven. Then another. The fluttering of wings fills the air and you feel the peck of a dozen beaks. As you fall into slumber, your flesh is ripped apart.
-> END

//Pickups

==Flashlight==
You pick up the flashlight.
->Boat

==Water==
You collect some water in the bowl.
-> Arch

==Feather==
You pick up the black feather. A crow caws in the distance. It startles you. You begin to feel weary.
-> Clearing

//LOCATIONS

==Seashore==
[Seashore]
{You are on a sandy beach. The ocean waves are softly lapping at the shore. No one else is around.| }

    +[Look]
    You are on a sandy beach. The ocean waves are softly lapping at the shore. No one else is around.
    ->Seashore

    *[Go to sleep]
    {not Feather: -> Sleep}
    {Feather: -> Death}

    +[Walk down the beach]
    -> Rocky_Beach

    +[Wade into the water]
    -> Shallows

==Rocky_Beach==
[Rocky Beach]
{The sand dusts upon the jutting rocks here. Further down the beach, you see a cove. A little ways out towards sea, a rocky arch rises from the shallow water.| }

    +[Look]
     The sand dusts upon the jutting rocks here. Further down the beach, you see a cove. A little ways out towards sea, a rocky arch rises from the shallow water.
     -> Rocky_Beach

    +[Wade to the arch]
    -> Arch

    +[Walk to the cove]
    -> Cove
    
    +[Walk back down the beach]
    -> Seashore

==Shallows==
[Shallows]
{You are wading out a ways into the water. It is only a couple feet deep here. You don't want to go any farther. Down the shoreline, you see a rocky arch rising out of the water.| }

    +[Look]
    You are wading out a ways into the water. It is only a couple feet deep here. You don't want to go any farther. Down the shoreline, you see a rocky arch rising out of the water.
    -> Shallows

    +[Wade to the arch]
    -> Arch

    +[Wade back to shore]
    -> Seashore
    
==Arch==
[Arch]
{You are standing in the water, beneath a rocky arch that rises out of the water.| }

    +[Look]
    You are standing in the water, beneath a rocky arch that rises out of the water.
    -> Arch
    
    + [Wade down the shoreline]
    -> Shallows
    
    + [Wade back to shore]
    -> Rocky_Beach
    
    *{Woman_6 && not Water} [Collect Water]
    -> Water
    
==Cove==
[Cove]
{You are in a sheltered cove enclosed by tall cliffs and rocky crags. Trees grow at the top of the cliffs. A crack in the clifface leads into darkness, and a gap in the rocks leads back to the main beach.| }
    {time == 1 || time == 2: A boat has been dragged up onto the beach.}
    
    + [Look]
        You are in a sheltered cove enclosed by tall cliffs and rocky crags. Trees grow at the top of the cliffs. A crack in the clifface leads into darkness, and a gap in the rocks leads back to the main beach.
        -> Cove

    + [Enter the cave]
        {Flashlight: -> Tunnel}
        {not Flashlight: -> Darkness}

    + {time == 1 || time == 2}[Take boat onto the water]
        You push the boat out into the water, and begin to sail from shore.
        -> Boat

    + [Walk back down the beach]
        -> Rocky_Beach
        
==Tunnel==
[Tunnel]
{You are in a narrow rocky tunnel. Carved into the wall of the tunnel is a set of smooth stone stairs leading up.| }

    +[Look]
    You are in a narrow rocky tunnel. Carved into the wall of the tunnel is a set of smooth stone stairs leading up.
    -> Tunnel

    + [Continue through tunnel]
    -> Dead_End
    
    + [Go up stairs]
    -> Forest

    + [Leave tunnel]
    -> Cove

==Forest==
[Forest]
{Several beech trees are perched on the cliff here. The breeze rustles through the leaves. A set of stone steps lead down into the earth. The path leads towards your cabin.| }

    +[Look]
    Several beech trees are perched on the cliff here. The breeze rustles through the leaves. A set of stone steps lead down into the earth. The path leads towards your cabin.
    -> Forest

    + [Walk towards your cabin]
    -> Clearing

    + [Walk down stairs]
    -> Tunnel

==Clearing==
[Clearing]
{Your cabin stands in the middle of this small clearing. Nearby, you see a pile of firewood. On your porch is the rocking chair. Two paths lead away, one towards the forest, one towards the beach.| }
    {time == 1: A woman is sitting in the rocking chair, swaying back and forth}

    +[Look]
    Your cabin stands in the middle of this small clearing. Nearby, you see a pile of firewood. On your porch is the rocking chair. Two paths lead away, one towards the forest, one towards the beach.
    -> Clearing

    + [Enter cabin]
    -> Cabin
    
    *{time == 1}[Talk to the woman]
    -> Woman_1
    
    *{Woman_4} [Follow the blood trail into the forest]
    -> Deep_Forest
    
    *{Woman_5} [Pick up the black feather]
    -> Feather
    
    *{Water} [Give the woman the water]
    -> Woman_7
    
    + [Walk towards the beach]
    -> Plateau
    
    + [Walk towards the forest]
    -> Forest

==Deep_Forest==
The forest draws about you. Everything is dark. You follow the trail of dark stains along the dark path between the dark trees. Eventually, you reach a clearing. You see a mangled raven bleeding onto the grass. A number of other dark birds circle above.

*[Pick up the raven]
As you reach down to pick up the raven, you feel a pinch on the back of your neck. Another raven has just swooped down to peck you. Another does the same. And another. And another. You find yourself swarmed by ravens. Your flesh is ripped apart.
-> END

*[Shoot the raven]
As you aim your gun towards the injured bird, you feel a pinch on the back of your neck. Another raven has just swooped down to peck you. Another does the same. And another. And another. You find yourself swarmed by ravens. Your flesh is ripped apart.
-> END

==Plateau==
[Plateau]
{You are on a grassy plateau overlooking the beach. A path leads to your cabin.| }

    +[Look]
    You are on a grassy plateau overlooking the beach. A path leads to your cabin.
    -> Plateau

    + [Slide down to the beach]
    -> Seashore
    
    + [Walk back to your cabin]
    -> Clearing

==Cabin==
[Cabin]
{You are standing in your cabin.| }
{Woman_1: Something is bubbling in the pot on the stove.}

    +[Look]
    You are standing in your cabin.
    -> Cabin

    *{Woman_1} [Drink the brew]
    {not Woman_7: -> Drink_1}
    {Woman_7: -> Drink_2}

    + [Leave]
    -> Clearing

==Dead_End==
[Dead End]
{The tunnel ends in a smooth stone wall.| }

    +[Look]
    The tunnel ends in a smooth stone wall.
    -> Dead_End

    + [Go back]
    -> Tunnel

==Darkness==
[Darkness]
{It is pitch black. You cannot see anything.| }

    +[Look]
    It is pitch black. You cannot see anything.
    -> Darkness

    +[Return]
    -> Cove

==Boat==
[Boat]
{You are on a motorboat in the ocean. The shore is nothing but a blurry vision on the horizon.| }
{not Flashlight: You see a flashlight in the bottom of the boat.}

    *{not Flashlight}[Take flashlight]
    -> Flashlight

    + [Sail back to shore]
    -> Cove