# Systems
See SYSTEM MANAGEMENT in masterplan
## Core Backend System
The game has a central state that can be described in 3 different ways:
  - Playing - the player is watching what happens

## Toolbar
The toolbar system is the system that allows the player or level designer to place objects in the room. It comes with two subsystems, the Events system and the Editor system.

### Editor
The editor consists of the toolbar and the tooltray. The toolbar is always open to the player on the left side of the screen and allows them to select a tool to use. Each tool places, destroys, or modifies a specific game entity type, such as the rail tool. The tooltray allows the level designer to drag tools from it to the toolbox for the player to use. It also allows the designer to make certain objects uneditable 

See LEVEL EDITOR MOCKUP in masterplan

### Events
The events system broadcasts certain level editor events to specific entities.


## Movement and Tick System