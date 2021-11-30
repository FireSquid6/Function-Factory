## Game Entities
#### Game entities can be placed in each level and are the core foundation of Function Factory. This list contains all game entities and their functions

### Number block
- COLOR: RED
- Small square that takes up 3/4th of the cell
- Number blocks are what the player will be guiding with rails to ejectors to complete each level
- Each number block holds an integer
- That integer can be operated on by operators and evaluated by evaluators
- Number blocks start out in dispensers as specified amounts and can change over time
### Rails
- VARYING COLOR
- The designer can decide how many of a certain rail color can be place by the player
- lines draw to connect cells
- Rails are the fundamental building block of each level
- Number blocks will travel along them after they are dispensed
- A level can have multiple different channels (colors) of rail, and different channels cannot interact
- Rails cannot have 3 way junctions, only turns
- The level designer decides how many rail channels the player has
- If two number blocks collide on the same rail, the program will fail
- If a rail can be multiple different types (ie corner and vertical), it will choose based on a hierchy
  - This can be changed by just clicking to modify the rail
### Operators
- COLOR: GREEN
- Large square that takes up pretty much the entire cell
  - Green highlights on input sides
  - Red highlights on output sides
- Number blocks slide into the operator as inputs, and out as outputs
- The position of the numbers in the expression is based on when they arrive into the number block
  - Ex: Subtractive operator receives a 7, so it adds it to the front 
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
- COLOR: ORANGE
- Trapezoid with an arrow pointing to the hypotenuse 
- Dispensers output a given number block at the start of every program
- These number blocks must be manipulated to complete each puzzle
- Generally not placed by the player
### Evaluators
- COLOR: BLUE
- Equilateral triangles taking up 1 cell
- Evaluators will stop a block if it does not fit a given condition
- Conditions can be taken as inputs or set beforehand
- Types of conditions:
  - Greater than
  - Less than
  - Equal to
### Ejectors
  - COLOR: YELLOW
  - Trapezoid with an arrow pointing from the hypotenuse
  - Ejectors require a specific block to complete a program
  - The goal of each program is to get the correct number block to each ejector
### Wires
  - Wires are complex mechanics introduced later in the game
  - Add more explanation for this later
### Barriers
  - Can't have anything in them
  - Can only be placed when in level designer mode
  - Stop any rails that match the same color as them
  
### Junctions
  - Split color between the rails it conjoins
  - Conjoins two different rail lines
  - The level designer gives the player a specific amount of these to use
### Teleporters
  - COLOR: AQUA
  - Hexagonal shape with an arrow
  - A teleporter comes in two blocks, one an input and one an output
  - The outputted block's direction is chosen by the direction of the teleporter
  - Teleporters are rotated 90 degrees when modified