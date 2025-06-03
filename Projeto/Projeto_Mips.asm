# Arquitetura e Organização de Computadores
# Semestre: 2025.1
# Alunos:
# Álvaro Ribeiro Bezerra da Silva
# Daniel Dionísio de Oliveira
# Gabriel Felipe Pontes da Silva Farias

# Projeto - Sistema de cadastro de pessoas e automóveis para um condomínio


.data
    espaco: .space 26080

.text
.globl main

main:
	#rascunho
	la $a0, espaco
	lb $t1, 4($a0)
	
	li $t2, 1
	add $a0, $a0, $t2
	add $t1, $t1, $t2

