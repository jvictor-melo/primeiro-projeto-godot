extends Camera2D

#TODO: O Bacana de ter uma entidade pra camera, é que eu posso colocar essa entidade em qualquer cena, que vai vir com as configurações de codigo que eu fiz, mas na propria cena, posso mexer nas configs da camera, que vão ser alteradas apenas na cena que eu fiz a alteração. Isso é bem bacana.

var target: Node2D #* Criada a variavel pra escolher um alvo se for do tipo Node2D.

#* Chamado quando o nó entra na árvore de cena pela primeira vez.
func _ready() -> void:
	#* Chamando func get_target
	get_target()

#* Chamado a cada frame. “delta” é o tempo decorrido desde o frame anterior..
func _process(delta: float) -> void:
	#* trava a posição da camera no target a todo frame, e o target é o player
	position = target.position

#* Detectar se há um player na arvore da cena
func get_target():
	var nodes = get_tree().get_nodes_in_group("Player") #* Vai navegar na arvore da cena, e procurar um node que ta no grupo "Player".
	#* Se o nodes estiver vazio, mostrar o erro.
	if nodes.size() == 0:
		push_error("Jogador não encontrado")
	
	#* target vai receber o primeiro player encontrado em nodes, indice 0 
	target = nodes[0]
