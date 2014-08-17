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
* As a player, I  would like to pick my playing piece (suspect). Time Spent: 9h 00m (attempted MVC including research and then rolled back)
  * As a player, I would like to play the computer and/or other people.
  * As a player, I would like the computer to pick its playing pieces automatically.
* As a player, I would like to randomly assign one weapon, one suspect and one room to the Confidential Solution Envelope.
  * As a player, I would like the computer to shuffle all remaining cards and deal them.
  * As a player, I would like the computer to keep track of who goes next (Miss Scarlet, Col. Mustard, Mrs. White, Mr. Green, Mrs. Peacock, Prof. Plum)
  * As a player, I would like to choose whether to roll dice or use secret passageway.
* As a player, I would like to roll the dice and move.
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