# Arquitetura e Organização de Computadores
# Semestre: 2025.1
# Alunos:
# Álvaro Ribeiro Bezerra da Silva
# Daniel Dionísio de Oliveira
# Gabriel Felipe Pontes da Silva Farias

# Projeto - Sistema de cadastro de pessoas e automóveis para um condomínio


.data
	apartamentos: .space 17120
	iApartamento: .word 0
	
	# Estrutura do código:

	# Offset - Campo
	#    0   - numApartamento (int)
	#    4   - quantidadePessoas (int)
	#    8   - nomeCompleto (char[]) (cada pessoa 64 caracteres)
	#  328   - inteiroVeiculo (0. nenhum; 1. uma moto; 2. duas motos; 3. um carro) (int)
	#  332   - modeloVeiculo (char[]) (cada modelo 32 caracteres)
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

main:
	#rascunho
	la $a0, apartamentos
	li $t1, 'D'
	li $t2, 'a'
	sb $t1, 0($a0)
	sb $t2, 1($a0)
	
	lb $t3, 0($a0)
	move $a0, $t3
	printChar

	encerrar
	
carregarInformacoes:
	la $t0, apartamentos	#$t0 = apartamentos
	li $t1, 40		#$t1 = 40 (total de apartamentos)
	li $t2, 0		#$t2 = 0 (contador)
	
acessarInformacoes:
	li $t0, 428		#$t0 = 428 (múltiplo)
	lw $t1, iApartamento	#$t1 = iApartamento (1, 2, 3... 39. 40)
	
	mul $t2, $t0, $t1	#$t2 = $t0 * $t1 (end de cada apt)
	
	addi $t3, $t3, 0	#$t3 = $t3 + 0
	addi $t4, $t4, 4	#$t4 = $t4 + 4
	addi $t5, $t5, 8	#$t5 = $t5 + 8
	addi $t6, $t6, 328	#$t6 = $t6 + 328
	addi $t7, $t7, 332	#$t7 = $t7 + 332
	addi $t8, $t8, 396	#$t8 = $t8 + 396
	
		

