# Arquitetura e Organização de Computadores
# Semestre: 2025.1
# Alunos:
# Álvaro Ribeiro Bezerra da Silva
# Daniel Dionísio de Oliveira
# Gabriel Felipe Pontes da Silva Farias

# Projeto - Sistema de cadastro de pessoas e automóveis para um condomínio


.data
	apartamentos: .space 17120
	
	# Estrutura do código:

	# Offset - Campo
	#    0   - numApartamento (int)
	#    4   - quantidadePessoas (int)
	#    8   - nomeCompleto (char[]) (cada pessoa 64 caracteres)
	#  328   - inteiroVeiculo (0. nenhum; 1. uma moto; 2. duas motos; 3. um carro) (int)
	#  332   - modeloVeiculo (char[]) (cada modelo 32 caracteres)
	#  396   - corVeiculo (char[]) (cara cor 16 caracteres)

.text
.globl main

main:
	#rascunho
	la $a0, apartamentos
	lb $t1, 4($a0)
	
	li $t2, 1
	add $a0, $a0, $t2
	add $t1, $t1, $t2

