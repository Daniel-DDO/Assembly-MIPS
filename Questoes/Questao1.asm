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


.text
.globl main
main:

    la $a0, bibliotecaStringH   #$a0 = bibliotecaStringH
    printString                 #executa macro

    encerrar
