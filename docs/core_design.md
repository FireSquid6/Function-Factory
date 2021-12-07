# CORE DESIGN
Function factory is a math-based puzzle game where players build up programs to manipulate moving number blocks and output a specified result. This is done by placing "rails" for the number blocks to move on, and having them go through "operators" and "evaluators" to manipulate them (See game_entities.md). 

The player's core loop should be (as a Minimum Viable Product):
  - Experiment different solutions to problem
    - Each puzzle should provide different mechanics that require the player to toy with before understanding
    - No mechanic should be too obtuse nor too obvious
  - Discover the correct solution
    - The player should eventually have a "eureka" moment after exploring a specific puzzle
    - This feeling is the core appeal of the game
  - Master and optimize the puzzle
    - This will give the player an opportunity to compete on global leaderboards against their friends on their program's speed, efficiency, and cost
  - Move onto the next puzzle and repeat the loop
  
The player should also have the ability to design their own puzzles and share them with others through the steam workshop and direct exportation.

Core Feelings:
 - Eureka - the "ah ha!" moment once you figure out a puzzle
 - Fiero - positive feedback after performing a skilled task well
 - Curiosity - interest in pursuing the next puzzle
 - Positive Creative feedback from designing your own puzzle

# Puzzle Structure
The goal of each puzzle is to satisfy each ejector with it's desired input. You do this by guiding rails from dispensers to various entities to manipulate the numbers. See game_entities.md for more info.
Each puzzle will be presented to the player looking something like this:
[Insert image of a starting puzzle]

The player will then fill in rails to connect up the various entities in the cellular grid, looking like this:
  - The player only has a certain type of each color of rail to place
  - The various colors of rail cannot interact 
[Insert image of a completed puzzle]

The player will then press a play bar, and each dispenser will output a number block that will follow its rails. The player is unable to place rails during this time.
[Insert gif of a puzzle being played]

If the puzzle is failed, all blocks will be deleted and the player will be put back in control
If the puzzle is completed, a results screen will be shown displaying how the player's score compares to their previous time and their friend's time
  - 0 - 3 stars will be awarded based on your score
    - 0 for puzzle competion
    - 1 for getting 1/3 of the maximum score (set by designer)
    - 2 for getting 2/3 of the maximum score
    - 3 for getting a score greater than or equal to the maximum score
  - The score is based on the cycles it took to complete the puzzle (c), the total amount of extra rails the player has left over (r), and the difficulty of the puzzle (d), which is rated on a float scale of 1-10. 
    - 1 cycle = time it takes for a block to go from one cell to the next
    - The player can view their total score from every puzzle and compare it with their friends
    - Puzzles from the workshop do not factor in the difficulty and the total score from them is viewed as a separate statistic
    - Scoring Formula: s = 10d + 5r - 2.5c