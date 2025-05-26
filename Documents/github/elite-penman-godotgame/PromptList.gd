extends Node2D

var words = [
'psicose',
'gnostico',
'mnemonico',
'ptolemeu',
'xilofone',
'circuito',
'hemorragia',
'pneumonia',
'despeito',
'desjejum',
'subtrair',
'prurido',
'quimera',
'tsunami',
'rixoso',
'exegese',
'diptero',
'hipfose',
'rinite',
'eczema',
'pleonasmo',
'gnomo',
'criptico',
'jiboia',
'xaxado',
'xerox',
'paradoxo',
'bulimia',
'malograr',
'tenente',
'legivel',
'obice',
'obstetra',
'obsesso',
'pratico',
'transe',
'sintese',
'detrito',
'miopia',
'juris',
'quociente',
'sucinto',
'deduzir',
'complexo',
'explicito',
'estrategia',
'paralelo',
'hibrido',
'condiz',
'obvio'
]

#var special_characters = [
#'!',
#'@',
#'#',
#'%',
#'*'
#]

func get_prompt() -> String:
	var word_index = randi() % words.size()
	#var special_index = randi() % special_characters.size()

	var word = words[word_index]
	#var special_character = special_characters[special_index]

	return word #+ special_character

