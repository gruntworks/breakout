# Godot Breakout

Simple Breakout game created in Godot.

## Game features:
- Play
- Level Select
- Random music shuffling
- Bricks/bubbles animations
- Custom parallax

## Play:
Play redirects to main scene which gets the current level instance from scene loader. This is also only place at the moment which has fade in/fade out on scene change event.

## Levels:
Each level in a game is a separate scene, as is each brick or bubble.
That means, when creating new level, instances of bricks or bubbles are placed in a custom scene and then saved in **levels** folder as **level_NUMBER**. Naming is important for scene loader.

## Level Select:
Level selection is a separate scene in scenes folder. When new level is added to levels folder, appropriate node (with thumbnail) for that level has to be added as a child to **LevelSelector** node. Name of the level should just be the number of the level, as it is also important for scene loader.

## Music:
Music is placed in **assets/sound/music** and name of each song has to be added to *TRACKS* array in autoload/*music_controller.gd*