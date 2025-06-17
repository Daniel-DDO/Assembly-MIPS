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
	tipoVeiculo: .space 10
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

	#Carro
	digiteModeloCarro: .asciiz "Digite o modelo do carro (até 32 caracteres): "
	digiteCorCarro: .asciiz "Digite a cor do carro (até 16 caracteres): "
	carroAdicionadoSucesso: .asciiz "Carro adicionado com sucesso!"
	aptoNaoPodeTerVeiculo: .asciiz "Falha: AP com numero max de automóveis"
	digiteTipoVeiculo: .asciiz "Digite (m) para moto ou (c) para carro: "
	tipoVeiculoInvalido: .asciiz "Tipo de veículo inválido"
	aptoNaoPodeTerCarro: .asciiz "Esse apartamento não pode ter carro"

	#Moto/Veiculo
	digiteModeloMoto: .asciiz "Digite o modelo da moto (até 32 caracteres): "
	digiteCorMoto: .asciiz "Digite a cor da moto (até 16 caracteres): "
	motoAdicionadaSucesso: .asciiz "Moto adicionada com sucesso!"
	digiteModeloVeiculo: .asciiz "Digite o modelo do veiculo (até 32 caracteres): "
	digiteCorVeiculo: .asciiz "Digite a cor do veiculo (até 16 caracteres): "
	veiculoNaoExiste: .asciiz "Veiculo não encontrado."
	veiculoRemovido: .asciiz "Veiculo encontrado e removido com sucesso!"
	
	#Textos
	escolherOpcao: .asciiz "1. Ver todas as informações\n2. Buscar apartamento\n3. Inserir pessoa\n4. Adicionar automóvel\n5. Remover pessoa\n6. Remover veiculo\n10. Encerrar\n"
	encerrandoPr: .asciiz "\nEncerrando...\n"

	#Informações dos apartamentos
	textApt: .asciiz "-----------------\nApartamento: "
	textMoradores: .asciiz "Moradores: "
	textNaoTemMoradores: .asciiz "Não há moradores neste apartamento. "
	textCarro: .asciiz "Carro: "
	textCarroCor: .asciiz "Cor: "
	textMoto: .asciiz "Motos: "
	textMotoModelo: .asciiz "Modelo: "
	textMotoCor: .asciiz "Cor: "
	
	# Estrutura do código:

	# Offset - Campo
	#  numApartamento - 0 (int)
	#  quantidadePessoas - 4 (int)
	#  nomeCompleto (char[]) (cada pessoa 64 caracteres)
	#      pessoa1 - 8
	#      pessoa2 - 72
	#      pessoa3 - 136
	#      pessoa4 - 200
	#      pessoa5 - 264
	#  inteiroVeiculo - 328 (0. nenhum; 1. uma moto; 2. duas motos; 3. um carro) (int)
	#  modeloVeiculo (char[]) (cada modelo 32 caracteres)
	#      modeloVeiculo1 - 332
	#      modeoVeiculo2 - 364
	#  corVeiculo (char[]) (cada cor 16 caracteres)
	#      corVeiculo1 - 396 
	#      corVeiculo2 - 412


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
	beq $t0, $t1, infoCadastradaApartamento	#if ($t0 == $t1) -> visualizarInformacoes
	li $t1, 2				#$t1 = 2
	beq $t0, $t1, buscarApartamento		#if ($t0 == $t1) -> buscarApartamento
	li $t1, 3				#$t1 = 3
	beq $t0, $t1, inserirPessoaApt		#if ($t0 == $t1) -> inserirPessoaApt
	li $t1, 4				#$t1 = 4
	beq $t0, $t1, adicionarAutomovel	#if ($t0 == $t1) -> adicionarAutomovel
	li $t1, 5				#$t1 = 5
	beq $t0, $t1, removerPessoaApt		#if ($t0 == $t1) -> removerPessoaApt
	li $t1, 6				#$t1 = 6
	beq $t0, $t1, removerVeiculoApt		#if ($t0 == $t1) -> removerVeiculoApt
	li $t1, 10				#$t1 = 9
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
		li $t5, 0			#$t5 = 0
		
	loopBuscarRemPessoaApt:
		lb $t0, 0($a0)			#$t0 = $a0[i]
		lb $t1, 0($a1)			#$t1 = $a1[i]
		
		bne $t0, $t1, nomesDiferentesRem	#if ($t0 != $t1) -> nomesDiferentesRem
		beq $t0, $0, nomesIguaisRem		#if ($t0 == \0) -> nomesIguaisRem
		
		addi $a0, $a0, 1		#$a0 = $a0 + 1
		addi $a1, $a1, 1		#$a1 = $a1 + 1
		addi $t5, $t5, 1		#$t5 = $t5 + 1
		
		j loopBuscarRemPessoaApt	#volta loop
	
	j main
	
nomesDiferentesRem:
	beq $t2, $t3, pessoaNaoExisteRem	#if ($t2 == $t3) -> pessoaNaoExisteRem

	sub $a0, $a0, $t5	#$a0 = $a0 - $t5
	sub $a1, $a1, $t5	#$a1 = $a1 - $t5
	addi $t2, $t2, 64	#$t2 = $t2 + 64
	j removerPessoaApartamento

nomesIguaisRem:
	quebra_linha		#executa macro

	sw $t2, indicePessoa	#indicePessoa = $t2 (é o índice referente ao apartamento, ent começa 0, 64, 128...)
		
	lw $t0, indicePessoa	#$t0 = indicePessoa 
	lw $t1, indiceApartamento #$t1 = indiceApartamento 

	la $a0, apartamentos	#$a0 = apartamentos
	add $a0, $a0, $t1	#$a0 = $a0 + $t1

	lw $t2, 4($a0)		#$t2 = $a0[4] (qtd pessoas)

	addi $t3, $a0, 8	#$t3 = $a0 + 8 (offset que inicia as pessoas)
	add  $t3, $t3, $t0	#$t3 = $t3 + $t0 (endereço da pessoa a ser removida)

	subi $t4, $t2, 1	#$t4 = $t2 - 1 (quantidade -1)
	mul  $t4, $t4, 64	#$t4 = $t4 * 64
	addi $t5, $a0, 8	#$t5 = $a0 + 8 (início da lista de pessoas)
	add  $t5, $t5, $t4	#$t5 = $t5 + $t4 (end da última pessoa)

	li $t6, 0		#iterador
	li $t7, 64		#iterador

	loopLimparBytesPessoa:
		beq $t6, $t7, pessoaRemovidaSuc 	#if ($t6 == $t7) -> pessoaRemovidaSuc
	
		sb $0, 0($t3)		#$t3[i] = 0 (limpeza)
		
    		addi $t3, $t3, 1	#$t3 = $t3 + 1
		addi $t6, $t6, 1	#$t6 = $t6 + 1
		
	j loopLimparBytesPessoa
		
	pessoaRemovidaSuc:
	addi $t3, $a0, 8	#$t3 = $a0 + 8
    	add  $t3, $t3, $t0	#$t3 = $t3 + $t0

	addi $t9, $a0, 8	#$t9 = $a0 + 8
	add  $t9, $t9, $t4	#$t9 = $t9 + $t4

    	li $t6, 0		#iterador
	li $t8, 64		#iterador
	
	moverPessoaParaPosRem:
    		beq $t6, $t8, concluirRemocaoPessoa	#if ($t6 == $t8) -> concluirRemocaoPessoa

    		lb $t7, 0($t5)		#$t7 = $t5[i]
    		sb $t7, 0($t3)		#$t3[i] = $t7

    		addi $t3, $t3, 1	#$t3 = $t3 + 1
    		addi $t5, $t5, 1	#$t5 = $t5 + 1
    		addi $t6, $t6, 1	#$t6 = $t6 + 1

	j moverPessoaParaPosRem
	
	concluirRemocaoPessoa:

	subi $t2, $t2, 1	#$t2 = $t2 - 1
	sw $t2, 4($a0)		#$a0[4] = $t2

	li $t6, 0		#$t6 = 0
	li $t7, 64		#$t7 = 64

	limparUltimaPessoa:
	beq $t6, $t7, pessoaRemocaoConcluida	#if ($t6 == $t7) -> pessoaRemocaoConcluida

	sb $0, 0($t9)		#$t5[i] = \0
	addi $t9, $t9, 1	#$t5 = $t5 + 1
	addi $t6, $t6, 1	#$t6 = $t6 + 1

	j limparUltimaPessoa	#volta loop

pessoaRemocaoConcluida:
	la $a0, pessoaExiste	#$a0 = pessoaExiste
	printString		#executa macro
	quebra_linha		#executa macro
	
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

adicionarAutomovel:

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
	
	bltz $t4, adicionarAutomovel	#se $t4 < 0, volta para o loop
	
	la $a0, apartamentos		#$a0 = apartamentos
	addi $t4, $t4, 328		#$t4 = $t4 + 328
	add $a0, $a0, $t4		#$a0 = $a0 + $t4
	lw $t5, 0($a0)			#$t5 = $a0[i] (carrega em t5 o valor que está na posicao de a0)
	
	move $a0, $t5
	printInt
	
	li $t6, 3			#$t6 = 3
	beq $t5, $t6, apartamentoNaoPodeTerVeiculo	#if ($t5 == 3) -> apartamentoNaoPodeTerVeiculo
	
	li $t6, 2			#$t6 = 2
	beq $t5, $t6, apartamentoNaoPodeTerVeiculo	#if ($t5 == 2) -> apartamentoNaoPodeTerVeiculo
	
       loopInserirTipoVeiculo:
	quebra_linha			#executa macro
	la $a0, digiteTipoVeiculo	#$a0 = digiteTipoVeiculo
	printString			#executa macro
	
	li $v0, 8                       #$v0 = 8
	la $a0, tipoVeiculo		#$a0 = tipoVeiculo
	la $a1, 10 			#$a1 = 10
	syscall
	
	quebra_linha
	
	lb $t3, tipoVeiculo			#$t3 = tipoVeiculo
	
	la  $t7, 0x63			#t7 = 'c'
	beq $t3, $t7, inserirCarro	#if ($t3 == 'c') -> inserirCarro
	
	la $t7, 0x6D			#t7 = 'm'
	beq $t3, $t7, inserirMoto	#if ($t3 == 'm') -> inserirMoto
	
	la $a0, tipoVeiculoInvalido	#$a0 = tipoVeiculoInvalido
	printString			#executa macro
	
	  j loopInserirTipoVeiculo		#redireciona para adicionarAutomovel
	
	
inserirCarro:
	quebra_linha			#executa macro
	
	bnez  $t5, apartamentoNaoPodeTerCarro	#if ($t5 != 0) -> apartamentoNaoPodeTerCarro
	
	la $a0, digiteModeloCarro	#$a0 = digiteModeloVeiculo
	printString			#executa macro
	
	li $v0, 8			#chama serviço de ler string
	la $a0, modeloVeiculo		#modeloVeiculo = $a0
	la $a1, 32			#$a1 = 32
	syscall				#executa leitura
	
	la $t1, modeloVeiculo		#$t1 = modeloVeiculo
	la $a0, apartamentos		#$a0 = apartamentos
	
	addi $t4, $t4, 4                #$t4 =  $t4 + 4 (endereço de memória do inicío de modelo)
	add $a0, $a0, $t4		#$t0 = $t0 + $t4
	
	jal loopInserirModeloVeiculo
	
	quebra_linha			#executa macro
	
	la $a0, digiteCorCarro	#$a0 = digiteCorCarro
	printString			#executa macro
	
	li $v0, 8			#chama serviço de ler string
	la $a0, corVeiculo		#corVeiculo = $a0
	la $a1, 16			#$a1 = 16
	syscall				#executa leitura
	
	la $t1, corVeiculo		#$t1 = modeloVeiculo
	la $a0, apartamentos		#$a0 = apartamentos
	
	addi $t4, $t4, 64               #$t4 = 64 (endereço de memória do inicío de cor/332+64 = 396)
	add $a0, $a0, $t4		#$a0 = $a0 + $t4 
	
	jal loopInserirCorVeiculo
	
	la $a0, apartamentos		#$$a0 = apartamentos
	subi $t4, $t4, 68		#$t4 = $t4 - 68 (posição do InteiroVeiculo)
	add $a0, $a0, $t4		#$$a0 = $t4
	li $t0, 3               	# $t0 = 3
	sw $t0, 0($a0)                	# a posição na memória $a0 (posição do inteiroVeiculo) recebe o valor 3
		
	la $a0, carroAdicionadoSucesso	#$a0 = carroAdicionadoSucesso
	printString			#executa macro
	quebra_linha			#executa macro
	
	        j main
		

inserirMoto:
	quebra_linha			#executa macro
	
	mul $t7, $t5, 32		#$t7 = $t5 * 32
	addi $t7, $t7, 332		#$t7 = $t7 + 332
	#Em $t7 está o índice em memória que deve ficar (iniciar) o nome do modelo a ser inserido
	
	#depuração
	add $a0, $0, $t7		
	printInt
	#fim dep
	
	quebra_linha			#executa macro
	
	la $a0, digiteModeloMoto	#$a0 = digiteModeloMoto
	printString			#executa macro
	
	li $v0, 8			#chama serviço de ler string
	la $a0, modeloVeiculo		#modeloVeiculo = $a0
	la $a1, 32			#$a1 = 32
	syscall				#executa leitura
	
	lw $t0, indiceApartamento	#$t0 = indiceApartamento (valor em memória, exemplo: apt 1 começa no 428)
	la $t1, modeloVeiculo		#$t1 = modeloVeiculo
	la $a0, apartamentos		#$a0 = apartamentos
	
	add $a0, $a0, $t0		#$a0 = $a0 + $t0
	add $a0, $a0, $t7		#$t0 = $t0 + $t7
	
	jal loopInserirModeloVeiculo
	
	
		lw $t0, indiceApartamento	#$t0 = indiceApartamento (valor em memória, exemplo: apt 1 começa no 428)
		la $a0, apartamentos		#$a0 = apartamentos
	
		add $a0, $a0, $t0		#$a0 = $a0 + $t0
		addi $a0, $a0, 328		#$a0 = $a0 + 328
	
		mul $t7, $t5, 16		#$t7 = $t5 * 16
		addi $t7, $t7, 396		#$t7 = $t7 + 396
		#Em $t7 está o índice em memória que deve ficar (iniciar) o nome da cor a ser inserida

quebra_linha			#executa macro
	
	la $a0, digiteCorMoto	#$a0 = digitecorVeiculoApt
	printString			#executa macro
	
	li $v0, 8			#chama serviço de ler string
	la $a0, corVeiculo		#modeloVeiculo = $a0
	la $a1, 16			#$a1 = 16
	syscall				#executa leitura
	
	lw $t0, indiceApartamento	#$t0 = indiceApartamento (valor em memória, exemplo: apt 1 começa no 428)
	la $t1, corVeiculo		#$t1 = corVeiculo
	la $a0, apartamentos		#$a0 = apartamentos
	
	add $a0, $a0, $t0		#$a0 = $a0 + $t0
	add $a0, $a0, $t7		#$t0 = $t0 + $t7
	
	jal loopInserirCorVeiculo
	
	la $a0, apartamentos		#$a0 = apartamentos
	lw $t4, indiceApartamento	#$t4 = indiceApartamento 
	addi $t4, $t4, 328		#$t4 = 328 (posição do inteiroVeiculo)
	add $a0, $a0, $t4		#$a0 = $t4
		
	lw $t0, 0($a0)			#$t0 = valor no endereço #$a0 (inteiroVeiculo)
	addi $t0, $t0, 1		#$t0 = $t0 + 1
	sw $t0, 0($a0)                	# a posição na memória $a0 (posição do inteiroVeiculo) recebe o valor em $t0, atualizado 
		
	la $a0, motoAdicionadaSucesso	#$a0 = motoAdicionadaSucesso
	printString			#executa macro
	quebra_linha			#executa macro
	
	   j main




loopInserirModeloVeiculo:

	lb $t2, 0($t1)				#$t1[0] = $t2 
	beqz  $t2, continuaInserindoCorVeiculo	#if ($t2 == 0) -> continuaInserirVeiculo
	
	sb $t2, 0($a0)		#$a0[0] = $t2
		
	addi $t1, $t1, 1	#$t1 = $t1 + 1
	addi $a0, $a0, 1	#$a0 = $a0 + 1
		
	 j loopInserirModeloVeiculo
	 
	 continuaInserindoCorVeiculo:
	 	jr $ra
	 
	 
	 
loopInserirCorVeiculo:

	lb $t2, 0($t1)				#$t1[0] = $t2 
	beqz  $t2, fimInserirVeiculo	#if ($t2 == 0) -> continuaInserirCarro
	
	sb $t2, 0($a0)		#$a0[0] = $t2
		
	addi $t1, $t1, 1	#$t1 = $t1 + 1
	addi $a0, $a0, 1	#$a0 = $a0 + 1
		
	  j loopInserirCorVeiculo	#volta loop
	  
	fimInserirVeiculo:
	  jr $ra
	   
	      
apartamentoNaoPodeTerVeiculo:
	quebra_linha			#executa macro
	la $a0, aptoNaoPodeTerVeiculo	#$a0 = aptoJaTemCarro
	printString			#executa macro
	quebra_linha			#executa macro
	quebra_linha			#executa macro
	j main

apartamentoNaoPodeTerCarro:
	quebra_linha			#executa macro
	la $a0, aptoNaoPodeTerCarro	#$a0 = aptoNaoPodeTerCarro
	printString			#executa macro
	quebra_linha			#executa macro
	quebra_linha			#executa macro
	j main

removerVeiculoApt:
	quebra_linha			#executa macro
	la $a0, digiteNumApartamento	#$a0 = digiteNumApartamento
	printString			#executa macro
	
	readInt				#executa macro
	add $t3, $0, $v0		#$t3 = $0 + $v0
	
	jal buscarApartamentoCondominio	#faz a busca
	
	move $a0, $t3			#$a0 = $t3
	printInt			#executa macro
	quebra_linha			#executa macro
	
	lw $t4, indiceApartamento	#$t4 = indiceApartamento (indice memória, ex: 0, 428, 856...)

	bltz $t4, removerVeiculoApt	#se $t4 < 0, volta para o loop
	
	la $a0, digiteModeloVeiculo	#$a0 = digiteModeloVeiculo
	printString			#executa macro
	
	li $v0, 8			#chama serviço de ler string
	la $a0, modeloVeiculo		#modeloVeiculo = $a0
	la $a1, 32			#$a1 = 32
	syscall				#executa leitura
	
	
	la $a0, digiteCorVeiculo	#$a0 = digiteCorVeiculo
	printString			#executa macro
	
	li $v0, 8			#chama serviço de ler string
	la $a0, corVeiculo		#corVeiculo = $a0
	la $a1, 16			#$a1 = 16
	syscall				#executa leitura
	
	lw $t4, indiceApartamento	#$t4 = indiceApartamento (indice memória, ex: 0, 428, 856...)
	addi $t4, $t4, 332		#$t4 = $t4 + 332, aonde começa os modelos dos veículos
	addi $t5, $t4, 64		#$t5 = $t4 + 64 (onde as cores começam)
	
	la $a0, apartamentos		#$a0 = apartamentos
	la $a1, modeloVeiculo		#$a1 = modeloVeiculo
	la $a2, corVeiculo		#$a2 = corVeiculo
	
	add $a3, $a0, $t5		#$a3 = $a0 + $t5
	add $a0, $a0, $t4		#$a0 = $a0 + $t4
	
	li $t2, 0			#$t2 = 0
	li $t7, 0			#$t7 = 0
	li $t3, 64			#$t3 = 64 (Espaço ocupado por todos os modelos)
	
	removerModeloApartamento:
		add $a0, $a0, $t2		#$a0 = $a0 + $t2
		li $t6, 0			#t6 = 0
	
	loopBuscarRemModeloApt:
		lb $t0, 0($a0)			#$t0 = $a0[i]
		lb $t1, 0($a1)			#$t1 = $a1[i]
		
		bne $t0, $t1, veiculosDiferentesRem	#if ($t0 != $t1) -> ModelosDiferentesRem
		beq $t0, $0, modelosIguaisRem		#if ($t0 == \0) -> modelosIguaisRem
		
		addi $t6, $t6, 1		#$t6 = $t6 + 1
		addi $a0, $a0, 1		#$a0 = $a0 + 1
		addi $a1, $a1, 1		#$a1 = $a1 + 1
		
		j loopBuscarRemModeloApt	#volta loop
	
veiculosDiferentesRem:
	addi $t2, $t2, 32			#$t2 = $t2 + 32
	beq $t2, $t3, veiculoNaoExisteRem	#if ($t2 == $t3) -> veiculoNaoExisteRem
	addi $t7, $t7, 1			#$t7 = $t7 + 1
	sub $a0, $a0, $t6			#$a0 = $a0 - $t5
	sub $a1, $a1, $t6			#$a1 = $a1 - $t5
	j removerModeloApartamento
	
modelosIguaisRem:
	sub $a0, $a0, $t6			#$a0 = $a0 - $t5
	sub $a1, $a1, $t6			#$a1 = $a1 - $t5
	mul $t7, $t7, 16			#$t7 = $t7 * 16
	add $a3, $a3, $t7
	li $t6, 0				#$t6 = 0
	
	loopBuscarRemCorApt:
	lb $t0, 0($a3)				#$t0 = $a3[i]
	lb $t1, 0($a2)				#$t1 = $a2[i]
	
	bne $t0, $t1, coresDiferentesRem		#if ($t0 != $t1) -> coresDiferentesRem
	beq $t0, $0, veiculosIguaisRem			#if ($t0 == \0) -> veiculosIguaisRem
	
	addi $t6, $t6, 1		#$t6 = $t6 + 1
	addi $a2, $a2, 1		#$a2 = $a2 + 1
	addi $a3, $a3, 1		#$a3 = $a3 + 1
	
	j loopBuscarRemCorApt
	
	coresDiferentesRem:
	sub $a2, $a2, $t6			#$a0 = $a0 - $t5
	sub $a3, $a3, $t6			#$a1 = $a1 - $t5
	li $t6, 0				#$t6 = 0
	li $t7, 0				#$t7 = 0
	j veiculosDiferentesRem

	
veiculosIguaisRem:
		la $a0, apartamentos		#$a0 = apartamentos
		lw $t1, indiceApartamento	#$t1 = indiceApartamento
		add $a0, $a0, $t1		#$a0 = $a0 + $t1
		lw $s0, 328($a0)		#$s0 = $a0[328] (inteiroVeiculo)
		li $t0, 2				#$t0 = 2
		bne $s0, $t0, limparBytesVeiculo	#Checa se há 2 motos
		bnez $t2, limparBytesVeiculo	#Checa se a moto excluida foi a segunda
		li $t2, 32
		li $t7, 16
		addi $t0, $a0, 332			#$t0 = $a0 + 332 (Modelo posição 1)
		addi $t1, $a0, 364			#$t1 = $a0 + 364 (Modelo posição 2)
		li $t6, 0				#$t2 = 0
		
	moverModeloVeiculoPosRem:
		beq $t6, $t2, moverModeloVeiculoConcluido	#if ($t6 == $t2) -> moverModeloVeiculoConcluido

    		lb $t8, 0($t1)		#$t8 = $t1[i]
    		sb $t8, 0($t0)		#$t0[i] = $t8

    		addi $t0, $t0, 1	#$t0 = $t0 + 1
    		addi $t1, $t1, 1	#$t1 = $t1 + 1
    		addi $t6, $t6, 1	#$t6 = $t6 + 1

	j moverModeloVeiculoPosRem
	
	moverModeloVeiculoConcluido:
	li $t6, 0			#$t6 = 0
	addi $t0, $t0, 32		#$t0 = $t0 + 32
	addi $t1, $t1, 16		#$t1 = $t1 + 16

	moverCorVeiculoPosRem:
		beq $t6, $t7, limparBytesVeiculo	#Continua após mover cor
		
		lb $t8, 0($t1)		#$t8 = $t1[i]
		sb $t8, 0($t0)		#$t0[i] = $t8

    		addi $t0, $t0, 1	#$t0 = $t0 + 1
    		addi $t1, $t1, 1	#$t1 = $t1 + 1
    		addi $t6, $t6, 1	#$t6 = $t6 + 1
		j moverCorVeiculoPosRem
		
	limparBytesVeiculo:
	quebra_linha			#executa macro
	la $a0, apartamentos		#$a0 = apartamentos
	lw $t1, indiceApartamento	#$t1 = indiceApartamento
	add $a0, $a0, $t1		#$a0 = $a0 + $t1
	addi $t0, $a0, 332		#$t0 = $a0 + 332 
	add $t0, $t0, $t2		#$t0 = $t0 + $t2 (Posição modelo)
	addi $t1, $a0, 396		#$t1 = $a0 + 396
	add $t1, $t1, $t7		#$t1 = $t1 + $t7 (Posição cor)
	li $t6, 0			#$t6 = 0
	li $t7, 32			#$t7 = 32
	
	loopLimparBytesVeiculo:
		beq $t6, $t7, byteRemovidoSuc 	#if ($t6 == $t7) -> pessoaRemovidaSuc
	
		sb $0, 0($t0)		#$t0[i] = 0 (limpeza)
		
    		addi $t0, $t0, 1	#$t0 = $t0 + 1
		addi $t6, $t6, 1	#$t6 = $t6 + 1
		
	j loopLimparBytesVeiculo
	
	byteRemovidoSuc:
	beq $t7, 16, corRemovidaSuc
		li $t6, 0			#$t6 = 0
		li $t7, 16			#$t7 = 16
		move $t0, $t1			#$t0 = $t1
		j loopLimparBytesVeiculo
	
	corRemovidaSuc:
	lw $s0, 328($a0)		#$s0 = $a0[328] (inteiroVeiculo)
	li $t6, 3			#$t6 = 3
	bne $s0, $t6, removeMoto	#$identifica se é carro ou moto
	li $s0, 1
	removeMoto:
	subi $s0, $s0, 1		#$s0 = $s0 - 1
	sw $s0, 328($a0)		#Nomo inteiroVeiculo		

veiculoRemocaoConcluida:
	la $a0, veiculoRemovido	#$a0 = pessoaExiste
	printString		#executa macro
	quebra_linha		#executa macro
	
	j main			#volta para o main
	
veiculoNaoExisteRem:
	la $a0, veiculoNaoExiste	#$a0 = pessoaNaoExiste
	printString		#executa macro
	quebra_linha		#executa macro
	j main			#volta para o main


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
		quebra_linha				#executa macro
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
	
infoCadastradaApartamento:
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
	
	la $a1, apartamentos		#$a1 = apartamentos
	add $a1, $a1, $t4
	li $t2, 64			#$t2 = 64
	
	loopVerificarInfoApartamento:
		la $a0, textApt		#$a0 = textApt
		printString		#executa macro
		lw $t4, 0($a1)		#$t4 = $a1[0]
		add $a0, $t4, $0	#$a0 = $t4
		printInt		#executa macro
		quebra_linha		#executa macro
		quebra_linha		#executa macro
		
		lw $t4, 4($a1)		#$t4 = $a1[4]
		beq $t4, 0, naoHaMoradoresApartamento	#if ($t4 == 0) -> naoHaMoradoresApt
		bne $t4, 0, temMoradoresApartamento	#if ($t4 != 0) -> temMoradoresApt
		
		naoHaMoradoresApartamento:
			la $a0, textNaoTemMoradores
			printString		#executa macro
			quebra_linha		#executa macro
			addi $a1, $a1, 328	#$a1 = $a1 + 328
			j verificarVeiculosApartamento	#vai para verificarVeiculosApt
		
		temMoradoresApartamento:
		la $a0, textMoradores	#$a0 = textMoradores
		printString		#executa macro
		quebra_linha		#executa macro
		addi $a1, $a1, 8	#$a1 = $a1 + 8

		li $t3, 0		#$t3 = 0 (iterador)
		la $t5, nomePessoa	#$t5 = nomePessoa
		li $t6, 0		#$t6 = 0 (contador de pessoas (1, 2, .. 5)
		
		loopNomeMoradorApartamento:
			lb $t4, 0($a1)		#$t4 = $a1[i]
			sb $t4, 0($t5)		#$t5[i] = $t4
			
			beq $t3, $t2, proximoMoradorApartamento	#if ($t3 == $t2) -> proximoMorador
			
			addi $a1, $a1, 1	#$a1 = $a1 + 1
			addi $t3, $t3, 1	#$t3 = $t3 + 1
			addi $t5, $t5, 1	#$t5 = $t5 + 1
			
			j loopNomeMoradorApartamento	#loopNomeMorador
		
		proximoMoradorApartamento:
			addi $t6, $t6, 1	#$t6 = $t6 + 1
			la $a0, nomePessoa	#$a0 = nomePessoa
			printString		#executa macro
		
			la $t5, nomePessoa
			sub $a1, $a1, $t3	#$a1 = $a1 - $t3
			add $t3, $0, $0		#$t3 = 0
			addi $a1, $a1, 64	#$a1 = $a1 + 64

			beq $t6, 5, verificarVeiculosApartamento	#if($t6 == 5) -> verificarVeiculosApt
			j loopNomeMoradorApartamento	#volta loopNomeMorador
		
		
	verificarVeiculosApartamento:
		lw $t3, 0($a1)		#se (0 - nada; 1 - uma moto; 2 - duas motos; 3 - um carro)
		
		li $t4, 0	#$t4 = 0
		beq $t3, $t4, naoExisteVeiculoApartamento	#if ($t3 == $t4) -> naoExisteVeiculoApt	
		
	
	naoExisteVeiculoApartamento:
		addi $a1, $a1, 100		#$a1 = $a1 + 100
		j verificarFinalApartamento	#vai para verificarFinalApt
	
	verificarFinalApartamento:
		quebra_linha			#executa macro
		j main
	


verificarInfoApartamentos:
	la $a1, apartamentos		#$a1 = apartamentos
	li $t0, 428			#$t0 = 428
	li $t1, 0			#$t1 = 0
	li $t2, 64			#$t2 = 64
	
	loopVerificarInfoApt:
		la $a0, textApt		#$a0 = textApt
		printString		#executa macro
		lw $t4, 0($a1)		#$t4 = $a1[0]
		add $a0, $t4, $0	#$a0 = $t4
		printInt		#executa macro
		quebra_linha		#executa macro
		quebra_linha		#executa macro
		
		lw $t4, 4($a1)		#$t4 = $a1[4]
		beq $t4, 0, naoHaMoradoresApt	#if ($t4 == 0) -> naoHaMoradoresApt
		bne $t4, 0, temMoradoresApt	#if ($t4 != 0) -> temMoradoresApt
		
		naoHaMoradoresApt:
			la $a0, textNaoTemMoradores
			printString		#executa macro
			quebra_linha		#executa macro
			addi $a1, $a1, 328	#$a1 = $a1 + 328
			j verificarVeiculosApt	#vai para verificarVeiculosApt
		
		temMoradoresApt:
		la $a0, textMoradores	#$a0 = textMoradores
		printString		#executa macro
		quebra_linha		#executa macro
		addi $a1, $a1, 8	#$a1 = $a1 + 8

		li $t3, 0		#$t3 = 0 (iterador)
		la $t5, nomePessoa	#$t5 = nomePessoa
		li $t6, 0		#$t6 = 0 (contador de pessoas (1, 2, .. 5)
		
		loopNomeMorador:
			lb $t4, 0($a1)		#$t4 = $a1[i]
			sb $t4, 0($t5)		#$t5[i] = $t4
			
			beq $t3, $t2, proximoMorador	#if ($t3 == $t2) -> proximoMorador
			
			addi $a1, $a1, 1	#$a1 = $a1 + 1
			addi $t3, $t3, 1	#$t3 = $t3 + 1
			addi $t5, $t5, 1	#$t5 = $t5 + 1
			
			j loopNomeMorador	#loopNomeMorador
		
		proximoMorador:
			addi $t6, $t6, 1	#$t6 = $t6 + 1
			la $a0, nomePessoa	#$a0 = nomePessoa
			printString		#executa macro
		
			la $t5, nomePessoa
			sub $a1, $a1, $t3	#$a1 = $a1 - $t3
			add $t3, $0, $0		#$t3 = 0
			addi $a1, $a1, 64	#$a1 = $a1 + 64

			beq $t6, 5, verificarVeiculosApt	#if($t6 == 5) -> verificarVeiculosApt
			j loopNomeMorador	#volta loopNomeMorador
		
		
	verificarVeiculosApt:
		lw $t3, 0($a1)		#se (0 - nada; 1 - uma moto; 2 - duas motos; 3 - um carro)
		
		li $t4, 0	#$t4 = 0
		beq $t3, $t4, naoExisteVeiculoApt	#if ($t3 == $t4) -> naoExisteVeiculoApt	
		
	
	naoExisteVeiculoApt:
		addi $a1, $a1, 100		#$a1 = $a1 + 100
		j verificarFinalApt		#vai para verificarFinalApt
	
	verificarFinalApt:
		addi $t1, $t1, 428		#$t1 = $t1 + 428
		li $t9, 17120
		beq $t1, $t9, voltaMain	#if ($t1 == 17120) -> voltaMain
		
		quebra_linha		#executa macro
		j loopVerificarInfoApt	#volta loop
	
voltaMain:
	j main


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

	
	
