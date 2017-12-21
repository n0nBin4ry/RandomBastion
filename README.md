# RandomBastion
A Bastion-themed Roguelike game. No official title yet.    

- Finals are over and went great! Time to really polish this turd! :)

## Main design-goal
Make a procedurally generated game where player(s) try to get as far as they could through as many levels as they could in fast-pased dungeon crawling. Then return to try to beat their score.

## Game Story/Flavor
- As Bastion wanders throught the black forrest, they come across a secret organization that is based in the forrest trying to revive the Omnic Crisis along with the help of their own robotic replications of other Heroes/Villains from the world.
	- Oh yeah I know the game so far seems like an endless roguelike, it still might be (so Bastion always fails lol), but also there might be an eventual Final Boss leading to an ending.
	
# Developer Notes/Thoughts/Etc.
- I believe that the final/future versions will have better quality of play with my current ideas on the chopping block. But even though I am more a developer I want it to be fun and will certainly go through an experiment only phase towards the homestretch of the alpha build. So stay tuned.
- Also I want to note that I did want to be a good amount farther in the game by this point. But school (finals are my current bane) does take a lot of time and chunks out of my schedule. When school ends, development speed will increase two-fold.

# Current Version v0.3.1(Alpha) 12/20/17
- Still in v0.3 but did part of the goals for next goal done
	- the part being: Dynamic scaling of GUI with Window resizing and full-screen
- The main gameplay features for the player are now implemented for the most part.
	- The features are subject to change based on any new gameplay designs added.
	- For now game ends/restarts when player dies or all enemies die.
- Basic idea of enemies implemented with obj_testBoii.
	- Other enemies will be inhereted from (or based off) obj_testBoii
- Build is playable but not super fun yet (developer first, designer second) but I have many design ideas to implement/test in next builds.
	- Check out "Possible Design Ideas" column in "Alpha Build" project.
	- Most promising design ideas (that I personally am excited for):
		- Causing a run-and-gun design by making it that Bastion's self-repair resource is only recovered by killing enemies (more details in project column)
		- Enemy "Bosses" show up in form of other Overwatch Heroes (mostly Bastion counters) when player takes too long to clear level.

## Bugs (Look in "BUGS" column of Alpha Build project for more details.)
- Player modes-system works but player sprite won't change. Gun sprite does change.
- Enemy doesn't stop following path and attack as soon as player seen.
- NPCs sometimes ignore starting room wall/door of starting room in pathfinding.
- Corner-to-corner floor cells cause enemies to see player and bullets to get through.
- Start-up room rarely but sometimes starts with no doors. Just restart game for now.
- Bullet sometimes find a way to reach out of bounds of level grid

# Goals For Next Build
- Update sprites past place-holders to have a more accurate representation of player, NPCs, etc when developing. Not final sprites exactly.
- Increase resolution/scale of whole game.
- Some (or at least one) new enemy.

