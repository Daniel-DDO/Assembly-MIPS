# Arquitetura e Organização de Computadores
# Semestre: 2025.1
# Alunos:
# Álvaro Ribeiro Bezerra da Silva
# Daniel Dionísio de Oliveira
# Gabriel Felipe Pontes da Silva Farias

# Projeto - Sistema de cadastro de pessoas e automóveis para um condomínio


.data
	apartamentos: .space 17120
	indiceApartamento: .word 0
	
	#Texto
	barraN: .asciiz "\n"
	digiteNumApartamento: .asciiz "Digite o número do apartamento (de 1 a 40): "
	
	escolherOpcao: .asciiz "1. Ver todas as informações\n2. Buscar apartamento\n9. Encerrar\n"
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
	
inicializarPrograma:
	sw $t1, 0($a0)		#$a0[0 a 3] = $t0 
	beq $t0, $t2, main	#if ($t0 == $t2) -> main
	
	addi $t0, $t0, 1	#incrementa 1 no $t0
	addi $a0, $a0, 428	#incrementa 428 no .space
	addi $t1, $t1, 1
	
	#Resto
	move $t3, $t1		#$t3 = $t1
	div $t3, $t5		#$t3 = $t3 / $t5
	mfhi $t4		#resto da divisão
	
	beq $t4, $0, somaMais		#if ($t4 == 0) -> somaMais
	bne $t4, $0, voltarPrograma	#if ($t4 != 0) -> voltarPrograma
	
	somaMais:
		jal somaApt		#vai para a função somaApt
	
	voltarPrograma:
	j inicializarPrograma		#volta para o loop

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
	subi $t5, $t5, 1		#$t5 = $t5 - 1 (estamos contando os apt de 1 até 40)
	sw $t5, indiceApartamento	#indiceApartamento = $t5

	#$t0 -> indice do apartamento a ser buscado.
	lw $t0, indiceApartamento	#$t0 = indiceApartamento
	li $t1, 428			#$t1 = 428
	mul $t2, $t1, $t0		#$t2 = 428 * indice
	
	move $a0, $t2			#$a0 = $t2
	printInt			#executa macro
	
	quebra_linha			#executa macro
	j main
	encerrar
	

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

	
	

