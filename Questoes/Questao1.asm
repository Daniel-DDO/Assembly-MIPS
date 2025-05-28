# Arquitetura e Organização de Computadores
# Semestre: 2025.1
# Alunos:
# Álvaro Ribeiro Bezerra da Silva
# Daniel Dionísio de Oliveira
# Gabriel Felipe Pontes da Silva Farias

# Questão 1


.data
	barraN: .asciiz "\n"

	bibliotecaStringH: .asciiz "String.h - Assembly MIPS"
	programa: .asciiz "\nEscolha uma opção:\n1 - STRCPY\n2 - MEMCPY\n3 - STRCMP\n4 - STRNCMP\n5 - STRCAT\n6 - Encerrar\n"
	opcaoEscolhida: .word 0

	textStrcpy: .asciiz "STRCPY"
	textMemcpy: .asciiz "MEMCPY"
	textStrcmp: .asciiz "STRCMP"
	textStrncmp: .asciiz "STRNCMP"
	textStrcat: .asciiz "STRCAT"

	userDigitou: .space 200
	entradaInv: .asciiz "\nEntrada inválida. Tente novamente."
    

	digiteStr: .asciiz "Digite uma string: "
	voceDigitou: .asciiz "Você digitou: "

	encerrando: .asciiz "\nEncerrando...\n"

#Macros usuais

.macro quebra_linha
	la $a0, barraN      #$a0 = barraN
	li $v0, 4           #chama a impressão
	syscall             #executa a linha anterior
.end_macro

.macro encerrar
	li $v0, 10          #chama o serviço para encerrar
	syscall             #encerra o programa
.end_macro

.macro printString
	li $v0, 4           #imprime string que está em $a0
	syscall             #executa
.end_macro

.macro printInt
	li $v0, 1           #imprime int que está em $a0
	syscall             #executa
.end_macro

.macro readInt
	li $v0, 5           #lê int, salva em $v0
	syscall             #executa
.end_macro


.text
.globl main
main:

	la $a0, bibliotecaStringH   #$a0 = bibliotecaStringH
	printString                 #executa macro
	quebra_linha		        #executa macro

execucaoPrograma:
	la $a0, programa            #$a0 = programa
	printString                 #executa macro

	readInt                     #executa macro
	add $t0, $v0, $0            #$t0 = $v0 + 0
	sw $t0, opcaoEscolhida      #opcaoEscolhida = $t0
    
	li $t1, 1
	beq $t0, $t1, strcpy        # if ($t0 == 1) -> executa strcpy
	li $t1, 2
	beq $t0, $t1, memcpy        # if ($t0 == 2) -> executa memcpy
	li $t1, 3
	beq $t0, $t1, strcmp        # if ($t0 == 3) -> executa strcmp
	li $t1, 4
	beq $t0, $t1, strncmp       # if ($t0 == 4) -> executa strncmp
	li $t1, 5
	beq $t0, $t1, strcat        # if ($t0 == 5) -> executa strcat
	li $t1, 6
	beq $t0, $t1, encerrarPr    # if ($t0 == 6) -> encerrar programa

    	la $a0, entradaInv          #$a0 = entradaInv
    	printString                 #executa macro

	j execucaoPrograma


	#Depuração e testes
	lw $a0, opcaoEscolhida
	printInt

	encerrar

strcpy:
	la $a0, textStrcpy          #$a0 = textStrcpy
	printString                 #executa macro

	quebra_linha
	la $a0, digiteStr           #$a0 = digiteStr
	printString
	li $v0, 8                   #chama serviço de scan string
	la $a0, userDigitou         #userDigitou = $a0 (string que foi digitada)
	la $a1, 200                 #tamanho da string em $a1
	syscall

	#depuração
	quebra_linha
	la $a0, voceDigitou
	printString
	la $a0, userDigitou
	printString
    
	encerrar

memcpy:
	la $a0, textMemcpy          #$a0 = textMemcpy
	printString                 #executa macro
	encerrar

strcmp:
	la $a0, textStrcmp          #$a0 = textStrcmp
	printString                 #executa macro
	encerrar

strncmp:
	la $a0, textStrncmp         #$a0 = textStrncmp
	printString                 #executa macro
	encerrar

strcat:
	la $a0, textStrcat          #$a0 = textStrcat
	printString                 #executa mmacro
	encerrar

encerrarPr:
	la $a0, encerrando          #$a0 = encerrando
	printString                 #executa macro
	encerrar
