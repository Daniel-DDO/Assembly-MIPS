# Arquitetura e Organização de Computadores
# Semestre: 2025.1
# Alunos:
# Álvaro Ribeiro Bezerra da Silva
# Daniel Dionísio de Oliveira
# Gabriel Felipe Pontes da Silva Farias

# Questão 2


.data

.text
.globl main
main:

	#Endereços:
	# 0xFFFF0000 -> Controle do teclado (leitura)
	# 0xFFFF0004 -> Dados do teclado (leitura)
	# 0xFFFF0008 -> Controle do display (leitura)
	# 0xFFFF000C -> Dados do display (escrita)

	li $t0, 0xFFFF0000		#Endereço fixo que representa o controle do teclado
	
	loopTeclado:
		lw $t1, 0($t0)			#Leitura do controle do teclado
		andi $t1, $t1, 1		#Faz um AND de $t1 com 1 para isolar o bit menos significativo
		beq $t1, $0, loopTeclado	#Se $t1 == 0, volta o loop (ou seja, se nada for digitado, aguarda)
	
	lb $t2, 4($t0)			#$t2 = caractere em ASCII
	
	loopDisplay:
		lw $t3, 8($t0)			#Leitura do controle do display
		andi $t3, $t3, 1		#Faz um AND de $t3 com 1 para isolar o bit menos significativo
		beq $t3, $0, loopDisplay	#Se $t3 == 0, volta o loop
		
	sb $t2, 12($t0)			#Salva no registrador de dados do display
	
	j loopTeclado			#Recomeça a execução
