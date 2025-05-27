# Arquitetura e Organização de Computadores
# Semestre: 2025.1
# Alunos:
# Álvaro Ribeiro Bezerra da Silva
# Daniel Dionísio de Oliveira
# Gabriel Felipe Pontes da Silva Farias

# Questão 01


.data
    var: .asciiz "Opa"

.text
.globl main

main:
    la $a0, var
    li $v0, 4
    syscall
