ex45clue
========

Terminal version of the game Clue.

I'm doing this as my game for Exercise 45 of Learn Ruby the Hard Way.  I wanted to  do it using test-driven development and with a proper project structure so I jumped ahead to exercises 46 and 47 and then came back to this one.  After coding what you see in the initial load to my GitHub repository I decided to try and follow the MVC architectural pattern because ultimately I want to understand that. After going down that road some distance I decided that was not such a great idea - I was truly biting off too much plus MVC seems to be intended for GUI applications.  That detour convinced me it was time to start using a code versioning system so I could more easily backtrack if needed.  So here I go again, but this time with a rewind capability :)

* Suspects
.Col. Mustard
.Prof. Plum
.Mr. Green
.Mrs. Peacock
.Miss Scarlet
.Mrs. White

* Weapons
.Knife
.Candlestick
.Revolver
.Rope
.Lead Pipe
.Wrench

* Rooms
  - Secret Passages
    .Conservatory to Lounge
    .Study to Kitchen
    .Lounge to Conservatory
    .Kitchen to Study
  * Hall
  * Lounge
  * Dining Room
  * Kitchen
  * Ballroom
  * Conservatory
  * Billiard Room
  * Library
  * Study
  - distance_to_room
  
* Players (3-6 players)
.Player 1
.Player 2
.etc

* Die
  - roll
  - result

* Cards
  - shuffle
  * Suspect Cards
  * Weapon Cards
  * Room Cards

* Confidential Solutions Card Envelope
  - assign_cards

* Detective Notepad
.Player 1
.Player 2
.etc.
  - suspects
  - weapons
  - rooms

Except for the ballroom, each room has 2 doors or 1 door and a secret passageway.  The Ballroom has 4 doors.
When a suggestion is made, the next player has to prove it false to the suggester (and only to the suggester) if he has one of the cards.  Otherwise the next player proves it false.  If no one can prove it false you can end your turn or make an Accusation.
You can make an accusation by saying "I accuse so and so of using such and such weapon in such and such room".  You don't have to be in that room. The accuser and only the accuser then checks the solution card envelope.  You can only do this once in a game.  If you're wrong then you can no longer win.  But you continue to prove suggestions false.

Distances (could make these up or get from board)

		Lng		DR	Kit		BaR	Cons	BiR		Lib		Stdy
Lng		0			4
DR 		4
Kit		19
BaR		14
Cons	26
BiR		22
Lib
Stdy

Moves

Backlog (1st level indented items first, 2nd level indent later)
* DONE: As a player, I  would like to pick my playing piece (suspect). Time Spent: 9h 00m (attempted MVC including research and then rolled back)
  * As a player, I would like to play the computer and/or other people.
  * As a player, I would like the computer to pick its playing pieces automatically.
* DONE: As a player, I would like to randomly assign one suspect to the Confidential Solution Envelope.  Time Spent: 1h 45m
* DONE: As a player, I would like to randomly assign one weapon to the Confidential Solution Envelope. Time spent: 20m
* DONE: As a player, I would like to randomly assign one room to the Confidential Solution Envelope. Time spent: 100m
  * As a player, I would like the computer to shuffle all remaining cards and deal them.
* As a player, I would like each player assigned to a starting spot or starting room.  Time spent: 47m. NEXT does the test need to test every room assignment? Hmm...
  Does there need to be a separate class for the cards vs. the pieces?  My first thought was no but I find myself having to think a little too much.  At first I have only included the suspect pieces in the Pieces class because those were the ones being picked by players.  Now I am wanting to test the initial assignment of pieces to locations (rooms initially).  My first unit test just checked one players initial assignment.  Then I thought maybe I should test every player's initial assignment - if I don't do in a unit test someone would have to manually test.  But if I statically put every name location in my unit test it is a little brittle and less robust.  What if I want to add a piece someday, would I notice it's initial location was not tested?  Or what if want to change the name of a piece, I would need to update every unit test.  Or I could just pull the list of piece names from an existing class/object.  But do I pull that from Pieces or from Suspects?  My mind is wrestling with the concepts of OO here.  I'm beginning to think that the simplest thing is to exactly match the physical world with corresponding classes.  The worst case is there are classes that don't have much in them but conceptually I don't have to think hard to map the physical world to my programmatic model of the world... Hmm... I'm going to stick with what I have for now to avoid refactoring so much.
NEXT:  collapse Pieces class into suspects.  Then continue with testing assign_starting_location.  Or maybe reverse order.

  * As a player, I would like the computer to keep track of who goes next (Miss Scarlet, Col. Mustard, Mrs. White, Mr. Green, Mrs. Peacock, Prof. Plum)
  * As a player, I would like to choose whether to roll dice or use secret passageway.
* DONE:  As a player, I would like to roll the dice. 1h
* As a player, I would like to move all the way to a room.  Design: class for each room, with attributes for each room being distance to every other room.
  * As a player, I would like to know how far each room is from my current room.
  * As a player, I would like to be able to move part way toward a room.
  * As a player, I would like to use a secret passageway to move.
* As a player, I would like make a suggestion (suspect, weapon, room) when I move into a room.
  * As a player, I would like to disprove a suggestion.
* As a player, I would like to make an accusation.
* As a player, I would like to verify an accusation.
  * As a player, I would like to pass to the next player if I can't disprove/verify.
  * As a player, I would like anyone who makes a wrong accusation to be out of the game.
  * As a player, I would like to keep my own detective notepad? or have computer do it?
  * As a player, I would like it to be possible for room doors to be blocked by other players.
  * As a player, I would like if all doors are blocked to a room no one can leave.