extends Node2D

var words = [
'casa',
'sol',
'livro',
'gato',
'mesa',
'flor',
'sapo',
'bola',
'vento',
'água',
'noite',
'pão',
'janela',
'café',
'porta',
'dente',
'árvore',
'nuvem',
'som',
'peixe',
'luz',
'papel',
'leite',
'rio',
'copo',
'fogo',
'pé',
'areia',
'dia',
'cama',
'chão',
'barco',
'sorvete',
'pato',
'verde',
'chuva',
'sombra',
'fruta',
'sino',
'faca',
'cola',
'folha',
'claro',
'prato',
'vela',
'pente',
'ferro',
'salto',
'cinto',
'pedra'
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
