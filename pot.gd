class_name Pot

var rng = RandomNumberGenerator.new()

var drop: int
var chest: Array
var all_ingredients: Array
var seen_ingredients: Dictionary # ID: int (count seen)
var current_pot_position: int
var last_ingredient: Ingredient
const MAX_POT_POSITION = 52

func _init():
	drop = 0
	all_ingredients = Pot.init_chest()
	current_pot_position = 0
	last_ingredient = null
	prepare()

func prepare():
	seen_ingredients = {"I-0-3": 0, "I-0-2": 0, "I-0-1": 0}
	chest = all_ingredients.duplicate()

func is_empty() -> bool:
	return last_ingredient == null

func is_finished() -> bool:
	return current_pot_position == MAX_POT_POSITION

func is_blown_up() -> bool:
	return seen_ingredients["I-0-1"] + seen_ingredients["I-0-2"] * 2 + seen_ingredients["I-0-3"] * 3 > 7

# {blown_up: bool, ingredient: Ingredient | null, position: Vector2, finished: bool}
func draw_ingredient() -> Dictionary:
	var index = 0
	if chest.size() == 0:
		return {"blown_up": false, "ingredient": null, "position": Vector2.ZERO, "finished": false}
	else:
		index = rng.randi_range(0, chest.size() - 1)
	var ingredient = chest.pop_at(index)
	_log_ingredient_drawn(ingredient)
	var position = _determine_position(ingredient)
	return {"blown_up": is_blown_up(), "ingredient": ingredient, "position": position, "finished": is_finished()}

func return_last_ingredient() -> Ingredient:
	current_pot_position -= last_ingredient.get_pot_position_increase(seen_ingredients)
	var id = last_ingredient.get_id()
	seen_ingredients[id] -= 1
	chest.append(last_ingredient)
	return last_ingredient
	
func _determine_position(ingredient: Ingredient) -> Vector2:
	return path[current_pot_position][3]

func _log_ingredient_drawn(ingredient: Ingredient):
	var id = ingredient.get_id()
	if id not in seen_ingredients:
		seen_ingredients[id] = 0
	seen_ingredients[id] += 1
	current_pot_position = min(current_pot_position + ingredient.get_pot_position_increase(seen_ingredients), MAX_POT_POSITION)
	last_ingredient = ingredient

# -------- STATIC

static func init_chest():
	return [WhiteIngredient.new(1),
		WhiteIngredient.new(1),
		WhiteIngredient.new(1),
		WhiteIngredient.new(1),
		WhiteIngredient.new(2),
		WhiteIngredient.new(2),
		WhiteIngredient.new(3),
		GreenIngredient.new(1),
		OrangeIngredient.new(1)]
		

# space to [shopping: int, victory points: int, gems: bool, position: Vector2]
const path = {
	0: [0, 0, false, Vector2(564, 276)],
	1: [1, 0, false, Vector2(517, 295)],
	2: [2, 0, false, Vector2(480, 263)],
	3: [0, 0, false, Vector2(507, 221)],
	4: [4, 0, false, Vector2(559, 215)],
	5: [5, 0, true, Vector2(609, 230)],
	6: [6, 1, false, Vector2(639, 268)],
	7: [7, 1, false, Vector2(625, 316)],
	8: [8, 1, false, Vector2(584, 346)],
	9: [9, 1, true, Vector2(529, 352)],
	10: [10, 2, false, Vector2(478, 340)],
	11: [11, 2, false, Vector2(433, 311)],
	12: [12, 2, false, Vector2(415, 264)],
	13: [13, 2, true, Vector2(426, 217)],
	14: [14, 3, false, Vector2(463, 179)],
	15: [15, 3, false, Vector2(514, 162)],
	16: [15, 3, true, Vector2(567, 163)],
	17: [16, 3, false, Vector2(619, 174)],
	18: [16, 4, false, Vector2(663, 199)],
	19: [17, 4, false, Vector2(692, 238)],
	20: [17, 4, true, Vector2(700, 286)],
	21: [18, 4, false, Vector2(685, 335)],
	22: [18, 5, false, Vector2(650,372)],
	23: [19, 5, false, Vector2(604, 397)],
	24: [19, 5, true, Vector2(549, 405)],
	25: [20, 5, false, Vector2(492, 402)],
	26: [20, 6, false, Vector2(440, 384)],
	27: [21, 6, false, Vector2(397, 353)],
	28: [21, 6, true, Vector2(368, 308)],
	29: [22, 7, false, Vector2(354, 259)],
	30: [22, 7, true, Vector2(363, 209)],
	31: [23, 7, false, Vector2(387, 167)],
	32: [23, 8, false, Vector2(429, 134)],
	33: [24, 8, false, Vector2(480, 114)],
	34: [24, 8, true, Vector2(534, 108)],
	35: [25, 9, false, Vector2(590, 113)],
	36: [25, 9, true, Vector2(641, 126)],
	37: [26, 9, false, Vector2(687, 151)],
	38: [26, 10, false, Vector2(727, 182)],
	39: [27, 10, false, Vector2(751, 224)],
	40: [27, 10, true, Vector2(762, 270)],
	41: [28, 11, false, Vector2(757, 321)],
	42: [28, 11, true, Vector2(734, 367)],
	43: [29, 11, false, Vector2(703, 406)],
	44: [29, 12, false, Vector2(659, 434)],
	45: [30, 12, false, Vector2(607, 453)],
	46: [30, 12, true, Vector2(552, 461)],
	47: [31, 12, false, Vector2(495, 459)],
	48: [31, 13, false, Vector2(438, 445)],
	49: [32, 13, false, Vector2(388, 416)],
	50: [32, 13, true, Vector2(350, 380)],
	51: [33, 14, false, Vector2(323, 335)],
	52: [33, 14, true, Vector2(310, 284)],
	53: [35, 15, false, Vector2.ZERO]
	# Anything 53 and over, drops to 53
}

# add tube path
