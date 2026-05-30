return {
	name = "Super Liz",
	starting_coins = 0,
	turns = 3,
	busts = 5,
	power_type = "turn_over",
	power_limit = 2,
	power_cost = 1,
	dice_limit = 6,

	dialogue_text = {
		setup = {
			line1 = "Hey... I feel blessed",
			line2_easy = "Just 7 levels, you got this",
			line2_normal = "10 levels, that should be fun"
		},
		gameover = {
			line1 = "Aww, I was sure you got this",
			line2 = "It ain't my fault, that's for sure"
		}
	},

	dice = {
		{side_effects = {"bust", "none", "none", "none", "none", "bonus", "none", "none"}},
		{side_effects = {"bust", "none", "none", "none", "none", "bonus", "none", "none"}},
		{side_effects = {"bust", "none", "none", "none", "none", "none", "none", "none"}},
		{side_effects = {"bust", "none", "none", "none", "none", "none", "none", "none"}},
		{side_effects = {"bust", "none", "none", "none", "none", "none", "none", "none"}},
	},
}