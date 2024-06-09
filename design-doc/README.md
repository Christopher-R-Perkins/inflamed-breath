# Inflamed Breath

## DESIGN DOCUMENT

<!-- TABLE OF CONTENTS -->

- [Introduction](#introduction)
  - [Game Pitch](#game-pitch)
  - [Inspiration](#inspiration)
    - [Legend of Zelda Series](#legend-of-zelda-series)
    - [Celeste](#celeste)
  - [Player Experience](#player-experience)
  - [Platform](#platform)
  - [Development Software](#development-software)
  - [Genre](#genre)
  - [Target Audience](#target-audience)
- [Concpet](#concept)
  - [Gameplay Overview](#gameplay-overview)
  - [Mechanics](#mechanics)
- [Art](#art)
- [Music](#music)
- [Game Experience](#game-experience)
  - [UI](#ui)
  - [Controls](#controls)
- [Timeline](#timeline)
  - [MVP](#mvp)

## Introduction

### Game Pitch

Inflamed breath is a puzzle platformer where you have to light all the braziers before you run out of air.

### Inspiration

#### Legend of Zelda Series

The Legend of Zelda series includes numerous puzzles where Link must light all the braziers in a room to open the path to another room. Typically the braziers are spaced apart and some are physically unreachable, so it takes some ingenuity in order to light them all.

#### Celeste

Celeste is an inspiration on how to handle movement. The freedom of movement celeste offers is insane and should be a monument for any 2d platformer.

### Player Experience

In a single screen dungeon for each of the 10 levels(?), the player will solve a pathing puzzle and light all the braziers and reach the exit before air runs out of the room. This will require the player to plan a path, learn and execute various manuevers, and use knowledge of various interactions between the environment and the player to complete each level before time is up.

### Platform

The game is developed to be released on the browser.

### Development Software

- Godot
- Asesprite
- FamiStudio
- jsfxr

### Genre

Singleplayer, puzzle, platformer

### Target Audience

Game should be marketed to casual game players, however speed runners will find the challenges much more enticing.

## Concept

### Gameplay overview

The player controls Evy as she must navigate more and more complex single room dungeons with her fire powers and light all the braziers in the room. The more Evy uses her powers and the more braziers that are lit, the faster the air in the room is consumed. Evy must light all the braziers and reach the exit prior to the air being fully consumed.

### Mechanics

- Jump

  - Evy can jump a short height

- Flare

  - Evy's main power. Evy blasts fire 360 degrees from herself.
  - If the fire hits something flamable that hasn't been set aflame or a wall while Evy is in the air, this will launch Evy in the opposite direction from that object
  - This uses oxygen

- Flamable Objects

  - Can be set on fire with flare
  - Once set on fire can't be used to boost Evy
  - Once set on fire consumes oxygen every frame

- Braziers

  - Is a flamable object
  - All Braziers must be set aflame to open the exit

- Exit
  - At the beginning of the level is locked
  - Evy must reach the exit once its unlocked to complete the level

## Art

I will use a minimalist free tile pack + some pixel art made by me to match it

## Music

Chiptune pack, if I can find one

## Game Experience

### UI

The UI will be very minimalistic. Likely just an O2 bar and the level number listed at the top of the screen.

### Controls

- Keyboard

  - Arrow/AD to Move
  - Space to jump
  - CTRL to Flare

- Gamepad
  - DPAD/Joystick to move
  - A to Jump
  - B to Flare

## Timeline

### MVP

| #   | Assignment                    | Status      | Finish By | Notes                                                       |
| --- | ----------------------------- | ----------- | --------- | ----------------------------------------------------------- |
| 1   | Design Doc                    | Complete    | 6/07/24   |                                                             |
| 2   | Find environment Assets       | Complete    | 06/07/24  |                                                             |
| 3   | Create Player Assets          | Complete    | 06/07/24  | Idle/Walk/Jump/Flare                                        |
| 4   | Create flamable object assets | Complete    | 06/08/24  | Braziers + other objects lit/unlit                          |
| 5   | Create UI assets              | Complete    | 06/09/24  | Bar + flourish                                              |
| 6   | Create player scene           | Complete    | 06/07/24  | Make sure she moves correctly                               |
| 7   | Create flamable Object Scene  | Complete    | 06/08/24  | Should collide with flare and set ablaze/send player flying |
| 8   | Create brazier scene          | Complete    | 06/08/24  | Should count towards exit \| Just a flag on flammable       |
| 9   | Create Oxygen Timer Scene     | Complete    | 06/08/24  |                                                             |
| 10  | Create exit scene             | Complete    | 06/08/24  |                                                             |
| 11  | Create Level Transitions      | Complete    | 06/08/24  | Disolve/fade in/out? - If I have time as a stretch          |
| 12  | Particles                     | Not Started | 06/09/24  | Make fire look good \| stretch goal                         |
| 13  | Sound Effects                 | Complete    | 06/09/24  | Find something for jump/flare/ open exit                    |
| 14  | Music                         | Complete    | 06/09/24  |                                                             |
| 15  | Level Design 1 - 5            | Complete    | 06/08/24  |                                                             |
| 16  | Level Design 6 - 10           | In Progress | 06/09/24  |                                                             |
| 17  | Main Menu/Splash              | Complete    | 06/09/24  |                                                             |
| 18  | SUBMIT                        | Not Started | 06/09/24  |                                                             |
