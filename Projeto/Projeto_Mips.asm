# Arquitetura e Organização de Computadores
# Semestre: 2025.1
# Alunos:
# Álvaro Ribeiro Bezerra da Silva
# Daniel Dionísio de Oliveira
# Gabriel Felipe Pontes da Silva Farias

# Projeto - Sistema de cadastro de pessoas e automóveis para um condomínio


.data
	apartamentos: .space 17120
	nomePessoa: .space 64
	inteiroVeiculo: .word 0
	modeloVeiculo: .space 32
	corVeiculo: .space 16
	barraN: .asciiz "\n"
	
	digiteNomePessoaApt: .asciiz " - Digite o nome da pessoa (até 64 caracteres): "
	
	#Apartamentos
	numApartamento: .word 0
	indiceApartamento: .word 0
	digiteNumApartamento: .asciiz "Digite o número do apartamento (de 101 a 1004): "
	aptNumEncontrado1: .asciiz "Apartamento "
	aptNumEncontrado2: .asciiz " encontrado."
	aptNumNaoEncontrado: .asciiz "Apartamento não encontrado. "
	aptCheio: .asciiz "O apartamento está cheio. Não é possível adicionar um novo morador."
	
	#Pessoas
	pessoaNaoExiste: .asciiz "A pessoa não foi encontrada para ser removida nesse apartamento."
	pessoaExiste: .asciiz "Pessoa encontrada e removida com sucesso."
	indicePessoa: .word 0
	
	#Textos
	escolherOpcao: .asciiz "1. Ver todas as informações\n2. Buscar apartamento\n3. Inserir pessoa\n4. Inserir carro\n5. Inserir moto\n6. Remover pessoa\n7. Remover carro\n8. Remover moto\n9. Encerrar\n"
	encerrandoPr: .asciiz "\nEncerrando...\n"
	
	# Estrutura do código:

	# Offset - Campo
	#    0   - numApartamento (int)
	#    4   - quantidadePessoas (int)
	#    8   - nomeCompleto (char[]) (cada pessoa 64 caracteres)
	#    8   - pessoa1
	#   72   - pessoa2
	#  136   - pessoa3
	#  200   - pessoa4
	#  264   - pessoa5
	#  328   - inteiroVeiculo (0. nenhum; 1. uma moto; 2. duas motos; 3. um carro) (int)
	#  332   - modeloVeiculo (char[]) (cada modelo 32 caracteres)
	#  332   - veiculo1
	#  364   - veiculo2
	#  396   - corVeiculo (char[]) (cara cor 16 caracteres)


#Macros usuais

.macro quebra_linha
	la $a0, barraN	#$a0 = barraN
	li $v0, 4	#chama a impressão
	syscall		#executa a linha anterior
.end_macro

.macro encerrar
	li $v0, 10	#chama o serviço para encerrar
	syscall		#encerra o programa
.end_macro

.macro printString
	li $v0, 4	#imprime string que está em $a0
	syscall		#executa
.end_macro

.macro printChar
	li $v0, 11	#imprime char que está em $a0
	syscall		#executa
.end_macro

.macro printInt
	li $v0, 1	#imprime int que está em $a0
	syscall		#executa
.end_macro

.macro readInt
	li $v0, 5	#lê int, salva em $v0
	syscall		#executa
.end_macro


.text
.globl main

	la $a0, apartamentos	#$a0 = apartamentos
	li $t0, 1		#$t0 = 1
	li $t1, 101		#$t1 = 101
	li $t2, 40		#$t2 = 40
	li $t5, 5		#$t5 = 5
	
inicializarApartamentosPr:
	sw $t1, 0($a0)		#$a0[0 a 3] = $t0 
	beq $t0, $t2, inicializarQtdPessoasApt	#if ($t0 == $t2) -> inicializarQtdPessoasApt
	
	addi $t0, $t0, 1	#incrementa 1 no $t0
	addi $a0, $a0, 428	#incrementa 428 no .space
	addi $t1, $t1, 1	#incrementa 1 no $t1	
	#Resto
	move $t3, $t1		#$t3 = $t1
	div $t3, $t5		#$t3 = $t3 / $t5
	mfhi $t4		#resto da divisão
	
	beq $t4, $0, somaMais		#if ($t4 == 0) -> somaMais
	bne $t4, $0, voltarPrograma	#if ($t4 != 0) -> voltarPrograma
	
	somaMais:
		jal somaApt		#vai para a função somaApt
	
	voltarPrograma:
	j inicializarApartamentosPr	#volta para o loop


inicializarQtdPessoasApt:
	la $a0, apartamentos	#$a0 = apartamentos
	li $t0, 1		#$t0 = 1
	li $t1, 40		#$t1 = 40
	li $t2, 0		#$t2 = 0, quantidade inicial de pessoas
	
	loopInicializarQtdPessoasApt:
		sw $t2, 4($a0)		#$a0[4] = $t2
		
		beq $t0, $t1, main	#if ($t0 == $t1) -> main
		
		addi $t0, $t0, 1	#$t0 = $t0 + 1
		addi $a0, $a0, 428	#$a0 = $a0 + 428
		
	j loopInicializarQtdPessoasApt	#volta loop
	
	
somaApt:
	addi $t1, $t1, 96	#$t1 = $t1 + 96
	jr $ra			#volta para a função que chamou


main:
	la $a0, escolherOpcao		#$a0 = escolherOpcao
	printString			#executa macro
	
	readInt				#executa macro
	move $t0, $v0			#$t0 = $v0
	
	li $t1, 1				#$t1 = 1
	beq $t0, $t1, visualizarInformacoes	#if ($t0 == $t1) -> visualizarInformacoes
	li $t1, 2				#$t1 = 2
	beq $t0, $t1, buscarApartamento		#if ($t0 == $t1) -> buscarApartamento
	li $t1, 3				#$t1 = 3
	beq $t0, $t1, inserirPessoaApt		#if ($t0 == $t1) -> inserirPessoaApt
	li $t1, 6				#$t1 = 6
	beq $t0, $t1, removerPessoaApt		#if ($t0 == $t1) -> removerPessoaApt
	li $t1, 9				#$t1 = 9
	beq $t0, $t1, encerrarPrograma		#if ($t0 == $t1) -> encerrarPrograma
	
	j main				#volta pro main
	encerrar			#executa macro
	
	
visualizarInformacoes:
	la $a1, apartamentos		#$a1 = apartamentos
	li $t0, 1			#$t0 = 1
	quebra_linha			#executa macro
	
	verificarCadaApt:
		lw $t1, 0($a1)		#$t1 = $a1 [ 0 ] (vai somando 428 a cada iter.)
		move $a0, $t1		#$a0 = $t1
		printInt		#executa macro
		
		quebra_linha		#executa macro
		beq $t0, 40, main	#if ($t0 == 40) -> main
		
		addi $t0, $t0, 1	#iterando, $t0 = $t0 + 1
		addi $a1, $a1, 428	#iterando, $t0 = $t0 + 428
		
		j verificarCadaApt	#volta no loop
	
	j main			#pula para o main
	encerrar		#executa macro


buscarApartamento:
	quebra_linha			#executa macro
	la $a0, digiteNumApartamento	#$a0 = digiteNumApartamento
	printString			#executa macro

	readInt				#executa macro
	add $t5, $0, $v0		#$t5 = $0 + $v0
	
	la $a0, apartamentos		#$a0 = apartamentos
	li $t1, 1			#$t1 = 1
	li $t2, 40			#$t2 = 40
	
	loopBuscarApartamento:
		lw $t0, 0($a0)				#$t0 = $a0 []
		beq $t5, $t0, apartamentoEncontrado	#if ($t5 == $t0) -> apartamentoEncontrado
		
		beq $t1, $t2, apartamentoNaoEncontrado	#if ($t1 == $t2) -> apartamentoNaoEncontrado
		
		addi $t1, $t1, 1			#incrementa 1 no $t1 (iterador)
		addi $a0, $a0, 428			#incrementa 428 no $a0
		
		j loopBuscarApartamento			#volta loop
	
	
	apartamentoEncontrado:
		quebra_linha				#executa macro
		sw $t5, indiceApartamento		#indiceApartamento = $t5
		la $a0, aptNumEncontrado1		#$a0 = aptNumEncontrado1
		printString				#executa macro
		lw $a0, indiceApartamento		#$a0 = indiceApartamento
		printInt				#executa macro
		la $a0, aptNumEncontrado2		#$a0 = aptNumEncontrado2
		printString				#executa macro
		quebra_linha				#executa macro
		j main					#volta para o main
	
	apartamentoNaoEncontrado:
		quebra_linha				#executa macro
		la $a0, aptNumNaoEncontrado		#$a0 = aptNumNaoEncontrado
		printString				#executa macro
		quebra_linha				#executa macro
		j main					#volta para o main
	
	encerrar
	

inserirPessoaApt:
	quebra_linha			#executa macro
	la $a0, digiteNumApartamento	#$a0 = digiteNumApartamento
	printString			#executa macro
	
	readInt				#executa macro
	add $t3, $0, $v0		#$t3 = $0 + $v0
	
	jal buscarApartamentoCondominio	#faz a busca
	
	move $a0, $t3			#$a0 = $t3
	printInt			#executa macro
	
	lw $t4, indiceApartamento	#$t4 = indiceApartamento (indice memória, ex: 0, 428, 856...)
	quebra_linha			#executa macro
	
	bltz $t4, inserirPessoaApt	#se $t4 < 0, volta para o loop
	
	#Tem que verifcar quantas pessoas existem naquele apartamento
	la $a0, apartamentos		#$a0 = apartamentos
	addi $t4, $t4, 4		#$t4 = $t4 + 4
	add $a0, $a0, $t4		#$a0 = $a0 + $t4
	lw $t5, 0($a0)			#$t5 = $a0[i] (carrega em t5 o valor que está na posicao de a0)
	
	li $t6, 5			#$t6 = 5
	beq $t5, $t6, apartamentoEstaCheio	#if ($t5 == $t6) -> apartamentoEstaCheio
	
	mul $t7, $t5, 64		#$t7 = $t5 * 64
	addi $t7, $t7, 8		#$t7 = $t7 + 8
	
	#Em $t7 está o índice em memória que deve ficar (iniciar) o nome do morador a ser inserido
	
	#depuração
	add $a0, $0, $t7		
	printInt
	#fim dep
	
	quebra_linha			#executa macro
	
	la $a0, digiteNomePessoaApt	#$a0 = digiteNomePessoaApt
	printString			#executa macro
	
	li $v0, 8			#chama serviço de ler string
	la $a0, nomePessoa		#nomePessoa = $a0
	la $a1, 64			#$a1 = 64
	syscall				#executa leitura
	
	lw $t0, indiceApartamento	#$t0 = indiceApartamento (valor em memória, exemplo: apt 1 começa no 428)
	la $t1, nomePessoa		#$t1 = nomePessoa
	la $a0, apartamentos		#$a0 = apartamentos
	
	add $a0, $a0, $t0		#$a0 = $a0 + $t0
	add $a0, $a0, $t7		#$t0 = $t0 + $t7
	
	loopInserirNomePessoa:
		lb $t2, 0($t1)				#$t1[0] = $t2 
		beq $t2, $0, continuaInserirPessoaApt	#if ($t2 == 0) -> continuaInserirPessoaApt
	
		sb $t2, 0($a0)		#$a0[0] = $t2
		
		addi $t1, $t1, 1	#$t1 = $t1 + 1
		addi $a0, $a0, 1	#$a0 = $a0 + 1
		
		j loopInserirNomePessoa	#volta loop
	
	continuaInserirPessoaApt:
	lw $t0, indiceApartamento	#$t0 = indiceApartamento (valor em memória, exemplo: apt 1 começa no 428)
	la $a0, apartamentos		#$a0 = apartamentos
	
	add $a0, $a0, $t0		#$a0 = $a0 + $t0
	addi $a0, $a0, 4		#$a0 = $a0 + 4
	
	lw $t1, 0($a0)			#$t1 = qtdPessoasApt
	addi $t1, $t1, 1		#$t1 = $t1 + 1
	sw $t1, 0($a0)			#$a0[] = $t1
	
	j main


removerPessoaApt:
	quebra_linha			#executa macro
	la $a0, digiteNumApartamento	#$a0 = digiteNumApartamento
	printString			#executa macro
	
	readInt				#executa macro
	add $t3, $0, $v0		#$t3 = $0 + $v0
	
	jal buscarApartamentoCondominio	#faz a busca
	
	move $a0, $t3			#$a0 = $t3
	printInt			#executa macro
	
	lw $t4, indiceApartamento	#$t4 = indiceApartamento (indice memória, ex: 0, 428, 856...)

	bltz $t4, removerPessoaApt	#se $t4 < 0, volta para o loop
	
	la $a0, digiteNomePessoaApt	#$a0 = digiteNomePessoaApt
	printString			#executa macro
	
	li $v0, 8			#chama serviço de ler string
	la $a0, nomePessoa		#nomePessoa = $a0
	la $a1, 64			#$a1 = 64
	syscall				#executa leitura
	
	addi $t4, $t4, 8		#$t4 = $t4 + 8, aonde começa os nomes das pessoas
	
	la $a0, apartamentos		#$a0 = apartamentos
	la $a1, nomePessoa		#$a1 = nomePessoa
	
	add $a0, $a0, $t4		#$a0 = $a0 + $t4
	
	li $t2, 0			#$t2 = 0
	
	removerPessoaApartamento:
		li $t3, 320			#$t2 = 320
		add $a0, $a0, $t2		#$a0 = $a0 + $t2
	
	loopBuscarRemPessoaApt:
		lb $t0, 0($a0)			#$t0 = $a0[i]
		lb $t1, 0($a1)			#$t1 = $a1[i]
		
		bne $t0, $t1, nomesDiferentesRem	#if ($t0 != $t1) -> nomesDiferentesRem
		beq $t0, $0, nomesIguaisRem		#if ($t0 == \0) -> nomesIguaisRem
		
		addi $a0, $a0, 1		#$a0 = $a0 + 1
		addi $a1, $a1, 1		#$a1 = $a1 + 1
		
		j loopBuscarRemPessoaApt	#volta loop
	
	j main
	
nomesDiferentesRem:
	beq $t2, $t3, pessoaNaoExisteRem	#if ($t2 == $t3) -> pessoaNaoExisteRem

	addi $t2, $t2, 64	#$t2 = $t2 + 64
	j removerPessoaApartamento

nomesIguaisRem:
	la $a0, pessoaExiste	#$a0 = pessoaExiste
	printString		#executa macro
	quebra_linha		#executa macro
	
	#tem que fazer a remoção
	sw $t2, indicePessoa	#indicePessoa = $t2 (é o índice referente ao apartamento, ent começa 0, 64, 128...)
	
	lw $t0, indicePessoa		#$t0 = indicePessoa
	lw $t1, indiceApartamento	#$t1 = indiceApartamento
	add $t2, $t1, $t0		#$t2 = $t1 + $t0
	addi $t2, $t2, 8		#$t2 = $t2 + 8
	
	la $a0, apartamentos		#$a0 = apartamentos
	add $a0, $a0, $t2		#$a0 = $a0 + $t2
	
	li $t0, 0			#$t0 = 0 (iterador)
	li $t1, 64			#$t1 = 64 (tam máximo da string nome)
	li $t2, 0			#$t2 = 0 (para zerar as informações)
	
	loopLimparBytesPessoa:
		beq $t0, $t1, pessoaRemovidaSuc 	#if ($t0 == $t1) -> pessoaRemovidaSuc
	
		lb $t3, 0($a0)		#$t3 = $a0[i]
		
		sb $t2, 0($a0)		#$a0[i] = $t2
		
		addi $t0, $t0, 1	#$t0 = $t0 + 1
		addi $a0, $a0, 1	#$a0 = $a0 + 1
		
		j loopLimparBytesPessoa
		
	pessoaRemovidaSuc:
	lw $t0, indicePessoa		#$t0 = indicePessoa
	lw $t1, indiceApartamento	#$t1 = indiceApartamento
	add $t2, $t1, $t0		#$t2 = $t1 + $t0
	addi $t2, $t2, 8		#$t2 = $t2 + 8
	
	la $a0, apartamentos		#$a0 = apartamentos
	add $a0, $a0, $t1		#$a0 = $a0 + $t1
	lw $t3, 4($a0)			#$t3 = $a0[4]
	addi $t4, $t3, 0		#$t4 = $t3 + 0
	mul $t4, $t3, 64		#$t4 = $t3 * 64
	
	moverPessoaParaPosRem:
		
	
	subi $t3, $t3, 1		#$t3 = $t3 - 1
	sw $t3, 4($a0)			#$a0[4] = $t3
	
	quebra_linha
	encerrar
	j main			#volta para o main
	
pessoaNaoExisteRem:
	la $a0, pessoaNaoExiste	#$a0 = pessoaNaoExiste
	printString		#executa macro
	quebra_linha		#executa macro
	j main			#volta para o main

apartamentoEstaCheio:
	quebra_linha		#executa macro
	la $a0, aptCheio	#$a0 = aptCheio
	printString		#executa macro
	quebra_linha		#executa macro
	quebra_linha		#executa macro
	j main


buscarApartamentoCondominio:
	la $a0, apartamentos		#$a0 = apartamentos
	li $t1, 1			#$t1 = 1
	li $t2, 40			#$t2 = 40
	
	loopBuscarApartamentoCondominio:
		lw $t0, 0($a0)				#$t0 = $a0 []
		beq $t3, $t0, apartamentoEncontradoC	#if ($t3 == $t0) -> apartamentoEncontradoC
		
		beq $t1, $t2, apartamentoNaoEncontradoC	#if ($t1 == $t2) -> apartamentoNaoEncontradoC
		
		addi $t1, $t1, 1			#incrementa 1 no $t1 (iterador)
		addi $a0, $a0, 428			#incrementa 428 no $a0
		
		j loopBuscarApartamentoCondominio	#volta loop
	
	apartamentoEncontradoC:
		quebra_linha				#executa macro
		sw $t3, indiceApartamento		#indiceApartamento = $t5
		la $a0, aptNumEncontrado1		#$a0 = aptNumEncontrado1
		printString				#executa macro
		lw $a0, indiceApartamento		#$a0 = indiceApartamento
		printInt				#executa macro
		la $a0, aptNumEncontrado2		#$a0 = aptNumEncontrado2
		printString				#executa macro
		quebra_linha				#executa macro
		
		la $a0, apartamentos
		li $t0, 0
		li $t1, 17120
		lw $t2, indiceApartamento
		
		loopIndiceApt:
			beq $t0, $t1, concluiAptEncontrado
			lw $t3, 0($a0)
			beq $t3, $t2, retornaIndiceApt
			
			addi $t0, $t0, 4
			addi $a0, $a0, 4
			
			j loopIndiceApt
		
		retornaIndiceApt:
			sw $t0, indiceApartamento
		
		concluiAptEncontrado:
		jr $ra					#volta para inserirPessoaApt
	
	apartamentoNaoEncontradoC:
		quebra_linha				#executa macro
		la $a0, aptNumNaoEncontrado		#$a0 = aptNumNaoEncontrado
		printString				#executa macro
		li $t0, -1				#$t0 = -1
		sw $t0, indiceApartamento		#indiceApartamento = -1
		quebra_linha				#executa macro
		jr $ra
		#j inserirPessoaApt			#volta para inserirPessoaApt no começo
	

carregarApt:
	



main1:
	#rascunho
	la $a0, apartamentos
	li $t1, 'D'
	li $t2, 'a'
	sb $t1, 0($a0)
	sb $t2, 1($a0)
	
	
	lb $t3, 0($a0)
	move $a0, $t3
	printChar

	j main
	encerrar
	
encerrarPrograma:
	la $a0, encerrandoPr		#$a0 = encerrandoPr
	printString			#executa macro
	encerrar			#executa macro

	
	

