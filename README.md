<h1 align="center">
	<p>
	so_long
	</p>
	<img src="https://github.com/ayogun/42-project-badges/blob/main/badges/so_longm.png">
</h1>

<p align="center">
	<b><i>And thanks for all the fish!</i></b><br><br>
</p>

<p align="center">
	<img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/aaron-22766/42_so_long?color=lightblue" />
	<img alt="Code language count" src="https://img.shields.io/github/languages/count/aaron-22766/42_so_long?color=yellow" />
	<img alt="GitHub top language" src="https://img.shields.io/github/languages/top/aaron-22766/42_so_long?color=blue" />
	<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/aaron-22766/42_so_long?color=green" />
</p>

---

## 🗣 About

This project is a very small 2D game. Its purpose is to make you work with textures, sprites, and some other very basic gameplay elements.

### Theme

> In the shadowed cloak of night, the ominous Nazgûl, cloaked in darkness and dread, stealthily infiltrated the venerable realm of Rivendell. Their nefarious purpose unveiled itself as they ruthlessly seized the shards of Narsil, the shattered remains of a once-mighty blade, foretelling doom for the free realms. Swiftly, the sons of Elrond, Elladan and Elrohir, undeterred by fear, pursued the Ringwraiths through the eldritch veil of night. Amidst their flight, the Nazgûl, tormented by the relentless pursuit of the elven brethren, faltered. In the dense thickets of the Wilderland, the shards slipped from their ghastly grasp, lost to the shadows. Aragorn, the heir to the throne of Gondor, burdened with destiny, was summoned to retrieve the shards swiftly, for they held the key to the redemption of a kingdom. But in this perilous quest, he was forewarned – beware the Nazgûl, the shadows of Sauron's malevolence, ever watchful, ever haunting, in their relentless pursuit of the One Ring and the heir to the line of Isildur.

> Help Strider gather all the shards of Narsil and bring them back to Rivendell, where they shall be reforged! Don't let the Ringwraiths catch you!

![play demo](https://github.com/aaron-22766/42_so_long/assets/79376206/164a8ff1-2d19-4ca6-ad27-ec9d32ba8e16)

## 🛠 Usage

### Requirements

The game is written in C language and thus needs the **`gcc` compiler** and some standard **C libraries** to run. [MLX42](https://github.com/codam-coding-college/MLX42) is used as the graphics engine, since it is easier to work with than MiniLibX. Since MLX is optimized to the OSs this game can only be played on macOS.

### Instructions

Run the mandatory version:
```shell
make
./so_long maps/*.ber
```
Run the bonus version:
```shell
make bonus
./so_long_bonus maps/bonus/*.ber
```

### Play

* Move: `WASD` or `↑←↓→`
* Sprint (bonus only): `LEFT SHIFT`
* Exit: `ESCAPE`

### Maps

* The map has to be constructed with 3 components: walls, collectibles, and free space.
* The map can be composed of only these 5 characters:
	- `0` for an empty space
	- `1` for a wall
	- `C` for a collectible
	- `E` for a map exit
	- `P` for the player’s starting position
Bonus difference:
	- `E` for an enemy
	- `X` for a map exit
* The map must contain 1 exit, at least 1 collectible, and 1 starting position to be valid.
* The map must be rectangular.
* The map must be closed/surrounded by walls.
* You have to check if there’s a valid path in the map.
* If any misconfiguration of any kind is encountered in the file, the program must exit in a clean way, and return "Error\n" followed by an explicit error message of your choice.

Here is a simple valid map (mandatory):
```
1111111111111
10010000000C1
1000011111001
1P0011E000001
1111111111111
```
Bonus example:
```
111111111
1P00001E1
101111111
101C00001
101011111
1000000C1
111011111
1C00000X1
111111111
```

## 💬 Description
| Feature                      | Madatory                | Bonus                                                                                                    |
|------------------------------|-------------------------|----------------------------------------------------------------------------------------------------------|
| `player movement`              | tile by tile            | smoothly between tiles                                                                                   |
| `player rotation `             | only one way            | turns whenever you change direction                                                                      |
| `move & collect counters` | printed to the terminal | displayed in-game with custom font                                                                            |
| `enemies`                      | none                    | walk straight until they hit a wall, then choose a new direction randomly, if you walk into them you die |
| `animations`                   | none                    | win and death animations that are 3x3 tiles big                                                          |
| `sprint`                       | no                      | yes                                                                                                      |
