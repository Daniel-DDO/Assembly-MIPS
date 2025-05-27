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
    programa: .asciiz "\nEscolha uma opção:\n1 - STRCPY\n2 - MEMCPY\n3 - STRCMP\n4 - STRNCMP\n5 - STRCAT\n"
    opcaoEscolhida: .word 0

    userDigitou: .space 200

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

.macro readString
    li $v0, 8           #lê string, salva texto em $a0 e tamanho em $a1
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

    la $a0, programa            #$a0 = programa
    printString                 #executa macro

    readInt
    add $t0, $v0, $0
    sw $t0, opcaoEscolhida
    
    lw $a0, opcaoEscolhida
    printInt

    encerrar
