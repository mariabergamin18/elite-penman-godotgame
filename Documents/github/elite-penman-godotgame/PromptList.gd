extends Node2D

var words = [
'luz',
'bola',
'pedra',
'areia',
'rio',
'lobo',
'papel',
'salto',
'trapo',
'tigre',
'mato',
'cobra',
'bicho',
'pente',
'linha',
'noite',
'fundo',
'signo',
'verde',
'marca',
'telha',
'copos',
'cesto',
'sabao',
'faca',
'prato',
'moeda',
'piano',
'tecla',
'tinta',
'treno',
'corda',
'banco',
'festa',
'calma',
'rato',
'livre',
'pasta',
'barco',
'mundo',
'norte',
'sul',
'oeste',
'leste',
'campo',
'folha',
'gelo',
'casca',
'cinto',
'baixa'
]

var special_characters = [
'!',
'@',
'#',
'%',
'*'
]

func get_prompt() -> String:
	var word_index = randi() % words.size()
	var special_index = randi() % special_characters.size()

	var word = words[word_index]
	var special_character = special_characters[special_index]

	return word + special_character
