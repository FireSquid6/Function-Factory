## Game Entities
#### Game entities can be placed in each level and are the core foundation of Function Factory. This list contains all game entities and their functions

### Number block
- Number blocks are what the player will be guiding with rails to ejectors to complete each level
- Each number block holds an integer
- That integer can be operated on by operators and evaluated by evaluators
- Number blocks start out in dispensers as specified amounts and can change over time
### Rails
- Rails are the fundamental building block of each level
- Number blocks will travel along them after they are dispensed
- A level can have multiple different channels (colors) of rail, and different channels cannot interact
- Number blocks won't change directions unless they hit a bouncepoint
- Rails cannot have 3 way junctions, only turns
- The level designer decides how many rail channels the player has
- Rails have nodes and bouncers as bouncepoints
  - Nodes will just cause the number to stop or will be the starting point after a dispenser/operator/evaluator
  - Bouncepoints will cause the numbers to go back the opposite way on the rail
- If two number blocks collide on the same rail, the program will fail
- If a rail can be multiple different types (ie corner and vertical), it will choose based on a hierchy
  - This can be changed by just clicking to modify the rail
### Operators
- Operators perform a specific operation to number inputs and give an output
- Each operator can have 1 - 2 inputs, specified by the level designer
- Each operator is a 2 by 1 rectangle
- When an operator is modified, it rotates
- Inputs must enter in a specified side
- If one input arrives in an operator before another, 
- Types of operators:
  - Additive Block - outputs the sum of two inputs
  - Subtractive Block - outputs the difference between two inputs
  - Multiplicative Block - outputs the product of two inputs
  - Divisive Block - outputs the quotient of two inputs
  - Modulus Block - outputs the modulo of two inputs
  - Equative block - sets one input equal to another and outputs it
  - Exponential block - raises one input to the power of another
### Dispensers
- Dispensers output a given number block at the start of every program
- These number blocks must be manipulated to complete each puzzle
- Generally not placed by the player
### Evaluators
- Evaluators will stop a block if it does not fit a given condition
- Conditions can be taken as inputs or set beforehand
- Types of conditions:
  - Greater than
    - Less than
    - Equal to
### Ejectors
  - Ejectors require a specific block to complete a program
  - The goal of each program is to get the correct number block to each ejector
### Wires
  - Wires are complex mechanics introduced later in the game
  - Add more explanation for this later
### Walls
  - Walls cannot have anything in them nor can they be placed
### Teleporters
  - A teleporter comes in two blocks, one an input and one an output
  - The outputted block's direction is chosen by the direction of the teleporter
  - Teleporters are rotated 90 degrees when modified