# Arquitetura e Organização de Computadores
# Semestre: 2025.1
# Alunos:
# Álvaro Ribeiro Bezerra da Silva
# Daniel Dionísio de Oliveira
# Gabriel Felipe Pontes da Silva Farias

# Questão 1 - Alternativa A


.data
    barraN: .asciiz "\n"


.macro quebra-linha
    la $a0, barraN  #carrega a variável barraN em $a0
    li $v0, 4       #chama a impressão
    syscall         #executa a linha anterior
.end_macro

.macro encerrar
    li $v0, 10      #chama o serviço para encerrar
    syscall         #encerra o programa
.end_macro

.text
.globl main
main:




