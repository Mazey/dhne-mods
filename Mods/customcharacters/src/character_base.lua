return {
	name = "",
	starting_coins = 0,
	
	required_unlocks = {}, --none

	turns = 0,
	busts = 0,
	power_limit = 0,
	dice_limit = 0,
	dice = {},
	
	body_sprite = "",

	power = "",

	dialogue_text = {
		setup = {
			line1 = "",
			line2_easy = "",
			line2_normal = ""
		},
		gameover = {
			line1 = "",
			line2 = ""
		},
	},

	dialogues = {
		{
			name = "setup",
			minor = true,
			self_complete = false,
			events = {"level_start"},
			script = function(self, state, dialogue)
				if self.self_complete then return end
				if state.encounter_level == 1 then
					local board = state.game_config.board.id
					if board == "easy" then
						dialogue:line(state.character.dialogue_text.setup.line1)
						dialogue:line(state.character.dialogue_text.setup.line2_easy)
					else
						dialogue:line(state.character.dialogue_text.setup.line1)
						dialogue:line(state.character.dialogue_text.setup.line2_normal)
					end
					self.self_complete = true
				end
			end,
		},
		{
			name = "gameover",
			script = function(self, state, dialogue)
				dialogue:line(state.character.dialogue_text.gameover.line1)
				dialogue:line(state.character.dialogue_text.gameover.line2)
			end,
		},
		{
			name = "deaths_door",
			chance_counter = 0,
			script = function(self, state, dialogue)
				--(count how many chances we had)
				self.chance_counter = self.chance_counter + 1
				local cost = 100 ^ self.chance_counter

				--check we can afford it
				local stars = SAVE.stars + state.stars_pending
				if stars < cost then
					return
				end

				--count dice, not items or coins
				--(bail if they dont have a dice to give)
				local dice_to_take = state.player_dice:filter(function(v) return not v.item and not v.coin end)
				if #dice_to_take <= 2 then
					return
				end

				dialogue:line("...Want to keep going?")

				if dialogue:prompt(("I'll revive you for $cost ¤ and one die"):apply_template({
					cost = cost,
				}), {
					"Yes",
					"No",
				}) == 2 then
					dialogue:line("Your loss :)")
					return
				end

				--take the stars
				local take_from_pending = math.min(cost, state.stars_pending)
				local take_from_persistent = cost - take_from_pending
				state.stars_pending = state.stars_pending - take_from_pending
				SAVE:take_stars(take_from_persistent)

				--take a random die (just take nothing if theres nothing due to async shenanigans)
				local taken_die = dice_to_take:pick_random()
				if taken_die then
					state:destroy_dice_or_item(taken_die)
				end

				--signal that we revived
				dialogue.revived = true

				dialogue:line("Hope it's worth it!")
			end,
		},

	},
}