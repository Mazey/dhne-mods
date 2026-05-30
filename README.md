# Custom Character mod
This is a custom character mod allowing you to quickly make & install new characters, with the help of the only generator.

It's possible to change all values you would expect, such as rounds and busts, but also any existing power and modifying the amount of power and its cost. It is also possible to create fully custom (starting) dice.

Includes an example character, Super Liz, which is like Liz but with extra power and extra bust, albeit she forgot her starting coin somewhere along the way...

## Installation

### Lovely

Mods require [Lovely](https://github.com/ethangreen-dev/lovely-injector).

After installing Lovely, run the game once. Verify it installed correctly as described on the Lovely GitHub.

### Mod

Download and extract the mod.

Navigate to %AppData%/Roaming (Windows) or equivalent on your system. You'll see 2 folders, `dice-have-no-eyes` and `dice_have_no_eyes`.

To install the mod now follow these steps
1. Navigate to `dice-have-no-eyes/Mods/`, create a folder `ccreator` and inside, you'll want to place `lovely.toml` which you've downloaded as part of the mod.
2. Head back and open the other folder, `dice_have_no_eyes`. Here you will want to put the other files you downloaded, so you should see `dice_have_no_eyes/Mods/ccreator/characters` after doing this.

The mod is now installed, verify by running the game and you should see the character Super Liz.

#### Why 2 folders?

Sorry, but due to the way the game is setup right now, you need to divide the mod in 2 pieces. The developer is aware, hopefully this can be improved in a near update so you'll only have to extract & place the mod for installation.

### Custom characters

To create a character:

1. Navigate to the [character creator](https://mazey.github.io/dhne/ccreator/).
2. Create the character as you prefer, and download it using the button at the top right corner.
3. Place the downloaded file in `dice_have_no_eyes/Mods/ccreator/characters`.
4. (optional) there is a stock dice image for custom characters, if you want a custom artwork, you can place it in `dice_have_no_eyes/Mods/ccreator/assets`. It should have the same name as your character file but `.png` instead of `.lua`.

To install a character, simply follow step 3 and optionally step 4, if artwork is also provided.
