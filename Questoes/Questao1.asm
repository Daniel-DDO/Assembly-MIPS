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
	
	#Variáveis do strcpy
	stringCopia: .space 200
	concluiuStrcpy: .asciiz "STRCPY\nString copiada com sucesso.\nString copiada: "

	encerrando: .asciiz "\nEncerrando...\n"
	
	teste: .asciiz "Acabou."

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
	la $a0, textStrcpy		#$a0 = textStrcpy
	printString			#executa macro

	quebra_linha
	la $a0, digiteStr		#$a0 = digiteStr
	printString
	li $v0, 8			#chama serviço de scan string
	la $a0, userDigitou		#userDigitou = $a0 (string que foi digitada)
	la $a1, 200			#tamanho da string em $a1
	syscall

	quebra_linha			#executa macro
	la $a0, voceDigitou		#$a0 = voceDigitou
	printString			#executa macro
	la $a0, userDigitou		#$a0 = userDigitou
	printString			#executa macro
	
	la $t0, userDigitou		#$t0 = userDigitou
	la $t2, stringCopia		#$t2 = stringCopia
	loopStrcpy:
		lb $t1, 0($t0)			#carrega os caracteres em cada posição
		beq $t1, $0, voltarStrcpy	# if (string[i] == \0) -> voltarStrcpy
	
		li $v0, 11			#chama serviço para imprimir caracteres
		move $a0, $t1			#move o [i] para $a0
		#syscall			#chama impressão
		
		move $t3, $t1			#$t3 = $t1
		sb $t3, 0($t2)			#salva os caracteres em cada posição
	
		addi $t0, $t0, 1		#incrementa o laço da string userDigitou
		addi $t2, $t2, 1		#incrementa o laço da stringCopia
	
		j loopStrcpy			#volta para a próx. iteração
	
	voltarStrcpy:
	
	quebra_linha			#executa macro
	la $a0, concluiuStrcpy		#$a0 = concluiuStrcpy
	printString			#executa macro

    	la $a0, stringCopia		#$a0 = stringCopia
    	printString			#executa macro
    	
	#depuração
	quebra_linha
	j execucaoPrograma

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



#-----------------------------
#Funções extras
#-----------------------------

