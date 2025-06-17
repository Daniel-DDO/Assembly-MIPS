# Arquitetura e Organização de Computadores
# Semestre: 2025.1
# Alunos:
# Álvaro Ribeiro Bezerra da Silva
# Daniel Dionísio de Oliveira
# Gabriel Felipe Pontes da Silva Farias

# Projeto - Sistema de cadastro de pessoas e automóveis para um condomínio


.data
	apartamentosOrigem: .space 17120
	apartamentos: .space 17120
	nomePessoa: .space 64
	inteiroVeiculo: .word 0
	tipoVeiculo: .space 10
	modeloVeiculo: .space 32
	corVeiculo: .space 16
	barraN: .asciiz "\n"
	tab: .asciiz "	"
	
	digiteNomePessoaApt: .asciiz " - Digite o nome da pessoa (até 64 caracteres): "
	
	#Apartamentos
	numApartamento: .word 0
	indiceApartamento: .word 0
	digiteNumApartamento: .asciiz "Digite o número do apartamento (de 101 a 1004): "
	aptNumEncontrado1: .asciiz "Apartamento "
	aptNumEncontrado2: .asciiz " encontrado."
	aptNumNaoEncontrado: .asciiz "Apartamento não encontrado. "
	aptCheio: .asciiz "O apartamento está cheio. Não é possível adicionar um novo morador."
	aptosNaoVazios: .asciiz "Não vazios:   "
	aptosVazios: .asciiz "Vazios:       "
	aptosVaziosOuNaoP1: .asciiz " ("
	aptosVaziosOuNaoP2: .asciiz "%)"
	msgAptoLimpo: .asciiz "Os dados do apartamento foram limpos com sucesso!"
	textoQtdAP: .asciiz "Você quer visualizar as informações de apenas um ou de todos os apartamentos?\n1. Um\n2. Todos\n"
	textoAP: .asciiz "AP: "
	textoModeloVeiculo: .asciiz "Modelo: "
	textoCorVeiculo: .asciiz "Cor: "
	textoCarroCor: .asciiz "Cor: "
	textoMotoModelo: .asciiz "Modelo: "
	textoMotoCor: .asciiz "Cor: "
	textoNaoTemMoradores: .asciiz "\t(Não há moradores cadastrados)"
	textoMoradores: .asciiz "\tMoradores:"
 	textoMoto: .asciiz "\tMoto:"
 	textoCarro: .asciiz "\tCarro:"
 	textNaoTemVeiculos: .asciiz "Não têm veículos"
 	str_all: .asciiz "all"
 	msgErroArgumento: .asciiz"argumento faltando"
	
	#Pessoas
	pessoaNaoExiste: .asciiz "A pessoa não foi encontrada para ser removida nesse apartamento."
	pessoaExiste: .asciiz "Pessoa encontrada e removida com sucesso."
	indicePessoa: .word 0
	pessoaAdicionadaSucesso: .asciiz "Pessoa adicionada com sucesso!"
	pessoaRemovidaSucesso: .asciiz"Pessoa removida com sucesso!"
	

	#Veículos
	veiculoNaoExiste: .asciiz "Veiculo não encontrado."
	veiculoRemovido: .asciiz "Veiculo encontrado e removido com sucesso!"
	msgNaoExisteMoradores: .asciiz "Não é possível adicionar veículos, pois não há moradores"
	aptoNaoPodeTerVeiculo: .asciiz "Falha: AP com numero max de automóveis"
	digiteTipoVeiculo: .asciiz "Digite (m) para moto ou (c) para carro: "
	tipoVeiculoInvalido: .asciiz "Tipo de veículo inválido"
	digiteModeloVeiculo: .asciiz "Digite o modelo do veículo: "
	digiteCorVeiculo: .asciiz "Digite a cor do veículo: "
	veiculoRemovidoSucesso: .asciiz "Veículo removido com sucesso!"

	#Carro
	digiteModeloCarro: .asciiz "Digite o modelo do carro (até 32 caracteres): "
	digiteCorCarro: .asciiz "Digite a cor do carro (até 16 caracteres): "
	carroAdicionadoSucesso: .asciiz "Carro adicionado com sucesso!"
	aptoNaoPodeTerCarro: .asciiz "Esse apartamento não pode ter carro"

	#Moto
	digiteModeloMoto: .asciiz "Digite o modelo da moto (até 32 caracteres): "
	digiteCorMoto: .asciiz "Digite a cor da moto (até 16 caracteres): "
	motoAdicionadaSucesso: .asciiz "Moto adicionada com sucesso!"

	# Arquivo para salvar e recarregar
   	 nomeArquivo: .asciiz "dados_condominio.bin"

   	# Mensagens para arquivo
    	msgSalvoSucesso: .asciiz "Dados salvos com sucesso!\n"
    	msgErroSalvar: .asciiz "Erro ao salvar dados.\n"
    	msgCarregadoSucesso: .asciiz "Dados recarregados com sucesso!\n"
    	msgErroCarregar: .asciiz "Erro ao carregar dados. Arquivo pode nao existir ou estar corrompido.\n"
    	msgArquivoNaoEncontrado: .asciiz "Arquivo de dados não encontrado. Não há o que recarregar\n"
    	msgDadosFormatados: .asciiz "Todos os apartamentos foram formatados!"
	
	#Textos
	escolherOpcao: .asciiz "1. Ver todas as informações\n2. Limpar apartamento\n3. Inserir pessoa\n4. Adicionar automóvel\n5. Remover pessoa\n6. Remover veiculo\n7. Info_geral\n8. Salvar\n9. Recarregar\n10. Formatar\n11. Encerrar\n"
	encerrandoPr: .asciiz "\nEncerrando...\n"
	qtdAP: .asciiz "Você quer visualizar as informações de apenas um ou de todos os apartamentos?\n1. Um\n2. Todos\n"

	#Informações dos apartamentos
	textApt: .asciiz "-----------------\nApartamento: "
	textAP: .asciiz "AP: "
	textMoradores: .asciiz "Moradores: "
	textNaoTemMoradores: .asciiz "Não há moradores neste apartamento. "
	textCarro: .asciiz "Carro: "
	textMoto: .asciiz "Motos: "
	textModeloVeiculo: .asciiz "Modelo: "
	textCorVeiculo: .asciiz "Cor: "
	
	#Mensagens e comandos
	shellGDA: .asciiz "GDA-shell>>"
	comandoInvalido: .asciiz "Comando inválido.\n"
	ad_morador: .asciiz "ad_morador"
	rm_morador: .asciiz "rm_morador"
	ad_auto: .asciiz "ad_auto"
	rm_auto: .asciiz "rm_auto"
	limpar_ap: .asciiz "limpar_ap"
	info_ap: .asciiz "info_ap"
	info_geral: .asciiz "info_geral"
	salvar: .asciiz "salvar"
	recarregar: .asciiz "recarregar"
	formatar: .asciiz "formatar"
	exit: .asciiz "exit"
	argumentoFaltando: .asciiz "Faltam argumentos na execução.\n"
	
	numApt: .word 0

	#Entrada
	userDigitou: .space 100

	#Argumentos separados
	
	option1: .space 12
	option2: .space 5
	option3: .space 64
	option4: .space 32
	option5: .space 16
	
	
	# Estrutura do código:

	# Offset - Campo
	#  numApartamento - 0 (int)
	#  quantidadePessoas - 4 (int)
	#  nomeCompleto (char[]) (cada pessoa 64 caracteres)
	#      pessoa1 - 8
	#      pessoa2 - 72
	#      pessoa3 - 136
	#      pessoa4 - 200
	#      pessoa5 - 264
	#  inteiroVeiculo - 328 (0. nenhum; 1. uma moto; 2. duas motos; 3. um carro) (int)
	#  modeloVeiculo (char[]) (cada modelo 32 caracteres)
	#      modeloVeiculo1 - 332
	#      modeoVeiculo2 - 364
	#  corVeiculo (char[]) (cada cor 16 caracteres)
	#      corVeiculo1 - 396 
	#      corVeiculo2 - 412


#Macros usuais

.macro quebra_linha
	la $a0, barraN	#$a0 = barraN
	li $v0, 4	#chama a impressão
	syscall		#executa a linha anterior
.end_macro

.macro tab
	la $a0, tab	#$a0 = barraN
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
.global main

	la $a0, apartamentos	#$a0 = apartamentos
	li $t0, 1		#$t0 = 1
	li $t1, 101		#$t1 = 101
	li $t2, 40		#$t2 = 40
	li $t5, 5		#$t5 = 5
	
inicializarApartamentosPr:
	sw $t1, 0($a0)		#$a0[0 a 3] = $t0 
	beq $t0, $t2, inicializarQtdPessoasApt	#if ($t0 == $t2) -> inicializarQtdPessoasApt
	
	addi $t0, $t0, 1	#incrementa 1 no $t0
	addi $a0, $a0, 428	#incrementa 428 no .space
	addi $t1, $t1, 1	#incrementa 1 no $t1	
	#Resto
	move $t3, $t1		#$t3 = $t1
	div $t3, $t5		#$t3 = $t3 / $t5
	mfhi $t4		#resto da divisão
	
	beq $t4, $0, somaMais		#if ($t4 == 0) -> somaMais
	bne $t4, $0, voltarPrograma	#if ($t4 != 0) -> voltarPrograma
	
	somaMais:
		jal somaApt		#vai para a função somaApt
	
	voltarPrograma:
	j inicializarApartamentosPr	#volta para o loop


inicializarQtdPessoasApt:
	la $a0, apartamentos	#$a0 = apartamentos
	li $t0, 1		#$t0 = 1
	li $t1, 40		#$t1 = 40
	li $t2, 0		#$t2 = 0, quantidade inicial de pessoas
	
	loopInicializarQtdPessoasApt:
		sw $t2, 4($a0)		#$a0[4] = $t2
		
	beq $t0, $t1, copiarParaApartamentosOrigem #if ($t0 == $t1) -> main
		
		addi $t0, $t0, 1	#$t0 = $t0 + 1
		addi $a0, $a0, 428	#$a0 = $a0 + 428
		
	j loopInicializarQtdPessoasApt	#volta loop


copiarParaApartamentosOrigem:

    	la $t2, apartamentos        # Endereço fonte: apartamentos
        la $t3, apartamentosOrigem  # Endereço destino: apartamentosOrigem
    	li $t0, 0                   # Contador de bytes
   	li $t1, 17120               # Total de bytes a copiar

loopCopiaInicial:
   	 beq $t0, $t1, inicializacaoCompleta # Se copiamos todos os bytes, encerra

   	 lb $t4, 0($t2)              # Carrega um byte de apartamentos
    	sb $t4, 0($t3)              # Salva o byte em apartamentosOrigem

    	addi $t2, $t2, 1            # Avança no endereço fonte
    	addi $t3, $t3, 1            # Avança no endereço destino
    	addi $t0, $t0, 1            # Incrementa o contador de bytes

   	 j loopCopiaInicial

inicializacaoCompleta:

   	 j programaPrincipal
	
	
somaApt:
	addi $t1, $t1, 96	#$t1 = $t1 + 96
	jr $ra			#volta para a função que chamou


programaPrincipal:
iniciarShellPrograma:
	la $a0, shellGDA
	printString

	li $v0, 8
	la $a0, userDigitou
	li $a1, 100
	syscall

	la $a2, userDigitou    # Ponteiro para a string completa digitada pelo usuário
	la $t1, option1        # Ponteiro para o início de option1
	la $t2, option2        # Ponteiro para o início de option2
	la $t3, option3        # Ponteiro para o início de option3
	la $t4, option4        # Ponteiro para o início de option4
	la $s0, option5        # Ponteiro dedicado para option5

	li $t5, 0              # $t5 = contador de opções (0, 1, 2, 3, 4)

loopEntradaUsuario:
	lb $t6, 0($a2)          # $t6 = char atual
	beq $t6, $0, finalStringShell # Se fim da string, vai finalizar

	li $t7, 45              # $t7 = 45 ('-')
	beq $t6, $t7, proximoOptionShell # Se '-', troca argumento

	li $t7, 4               # MUDANÇA AQUI: Agora 4, para permitir 5 opções (0 a 4)
	bgt $t5, $t7, erroArgumentos # Se mais de 5 args, erro (option0 a option4)

	beq $t5, 0, salvarOption1
	beq $t5, 1, salvarOption2
	beq $t5, 2, salvarOption3
	beq $t5, 3, salvarOption4
	beq $t5, 4, salvarOption5 # <--- NOVO: Salva no option5

continuarLoopEntrada:
	addi $a2, $a2, 1        # $a2++
	j loopEntradaUsuario    # Volta pro loop

salvarOption1:
	sb $t6, 0($t1)          # Salva no option1
	addi $t1, $t1, 1        # $t1++
	j continuarLoopEntrada

salvarOption2:
	sb $t6, 0($t2)          # Salva no option2
	addi $t2, $t2, 1        # $t2++
	j continuarLoopEntrada

salvarOption3:
	sb $t6, 0($t3)          # Salva no option3
	addi $t3, $t3, 1        # $t3++
	j continuarLoopEntrada

salvarOption4:
	sb $t6, 0($t4)          # Salva no option4
	addi $t4, $t4, 1        # $t4++
	j continuarLoopEntrada

salvarOption5:
	sb $t6, 0($s0)          # <--- NOVO: Salva no option5 (usando $s0)
	addi $s0, $s0, 1        # <--- NOVO: $s0++
	j continuarLoopEntrada

proximoOptionShell:
	# Baseado em qual option estava sendo preenchida ($t5):
	beq $t5, 0, encerrarOption1
	beq $t5, 1, encerrarOption2
	beq $t5, 2, encerrarOption3
	beq $t5, 3, encerrarOption4
	beq $t5, 4, encerrarOption5 # <--- NOVO: Se $t5=4 (option5), encerra

	j continueProximoOptionShell # Salta se $t5 > 4 (erro já tratado)

encerrarOption1:
	sb $0, 0($t1) # Coloca null no fim do option1 (onde $t1 parou)
	j continueProximoOptionShell

encerrarOption2:
	sb $0, 0($t2) # Coloca null no fim do option2
	j continueProximoOptionShell

encerrarOption3:
	sb $0, 0($t3) # Coloca null no fim do option3
	j continueProximoOptionShell

encerrarOption4:
	sb $0, 0($t4) # Coloca null no fim do option4
	j continueProximoOptionShell

encerrarOption5:
	sb $0, 0($s0) # <--- NOVO: Coloca null no fim do option5 (usando $s0)
	j continueProximoOptionShell

continueProximoOptionShell:
	addi $t5, $t5, 1        # Incrementa o contador de options (passa para a próxima)
	addi $a2, $a2, 1        # Avança o ponteiro de leitura na string do usuário (pula o '-')
	j loopEntradaUsuario    # Volta pro loop para ler o próximo caractere

finalStringShell:
  
    la $t1, option1
    la $t2, option2
    la $t3, option3
    la $t4, option4
    la $s0, option5       

 
    la $t9, option1
    li $t0, 0 # Contador para o loop atual
    loopLimparOption1:
        lb $t8, 0($t9)
        beq $t8, $0, fimLimparOption1
        li $t7, 10 # ASCII para '\n'
        beq $t8, $t7, retirarBarraNLinha1
        addi $t9, $t9, 1
        addi $t0, $t0, 1
        bge $t0, 12, fimLimparOption1 
        j loopLimparOption1
    retirarBarraNLinha1:
        sb $0, 0($t9)
    fimLimparOption1:

    # Processar option2
    la $t9, option2
    li $t0, 0
    loopLimparOption2:
        lb $t8, 0($t9)
        beq $t8, $0, fimLimparOption2
        li $t7, 10
        beq $t8, $t7, retirarBarraNLinha2
        addi $t9, $t9, 1
        addi $t0, $t0, 1
        bge $t0, 5, fimLimparOption2 
        j loopLimparOption2
    retirarBarraNLinha2:
        sb $0, 0($t9)
    fimLimparOption2:

    # Processar option3
    la $t9, option3
    li $t0, 0
    loopLimparOption3:
        lb $t8, 0($t9)
        beq $t8, $0, fimLimparOption3
        li $t7, 10
        beq $t8, $t7, retirarBarraNLinha3
        addi $t9, $t9, 1
        addi $t0, $t0, 1
        bge $t0, 64, fimLimparOption3  
        j loopLimparOption3
    retirarBarraNLinha3:
        sb $0, 0($t9)
    fimLimparOption3:

    # Processar option4
    la $t9, option4
    li $t0, 0
    loopLimparOption4:
        lb $t8, 0($t9)
        beq $t8, $0, fimLimparOption4
        li $t7, 10
        beq $t8, $t7, retirarBarraNLinha4
        addi $t9, $t9, 1
        addi $t0, $t0, 1
        bge $t0, 32, fimLimparOption4 
        j loopLimparOption4
    retirarBarraNLinha4:
        sb $0, 0($t9)
    fimLimparOption4:


    la $t9, option5 
    li $t0, 0 # $t0 é reutilizado como contador de loop local
    loopLimparOption5:
        lb $t8, 0($t9)
        beq $t8, $0, fimLimparOption5
        li $t7, 10
        beq $t8, $t7, retirarBarraNLinha5
        addi $t9, $t9, 1
        addi $t0, $t0, 1
        bge $t0, 16, fimLimparOption5 
        j loopLimparOption5
    retirarBarraNLinha5:
        sb $0, 0($t9)
    fimLimparOption5:

    j verificarComando

erroArgumentos:
	la $a0, comandoInvalido		#$a0=comandoInvalido
	printString			#executa macro
	j programaPrincipal		#volta pro programaPrincipal

verificarComando:
	la $a0, ad_morador		#$a0 = ad_morador
	la $a1, option1			#$a1 = option1
	jal compararStrings		#chama comparar
	beq $v0, 1, adicionarMorador	#se igual, vai

	la $a0, rm_morador		#$a0=rm_morador
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, removerMorador

	la $a0, ad_auto			#$a0=ad_auto
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, adicionarAuto

	la $a0, rm_auto			#$a0=rm_auto
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, removerAuto

	la $a0, limpar_ap		#$a0=limpar_ap
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, limparApartamento

	la $a0, info_ap			#$a0=info_ap
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, infoApartamento

	la $a0, info_geral		#$a0=info_geral
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, infoGeral

	la $a0, salvar			#$a0=salvar
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, salvarDados

	la $a0, recarregar		#$a0=recarregar
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, recarregarDados

	la $a0, formatar		#$a0=formatar
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, formatarSistema

	la $a0, exit			#$a0=exit
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, encerrarPrograma
	
	la $a0, comandoInvalido		#$a0=comandoInvalido
	printString			#executa macro
	j programaPrincipal		#volta pro programaPrincipal

compararStrings:
	li $v0, 1			#$v0=1 (assume igual)

loopComparandoString:
	lb $t7, 0($a0)			#$t7=char string1
	lb $t8, 0($a1)			#$t8=char string2

	bne $t7, $t8, stringNaoIguaisComp	#se diferente, não iguais
	beq $t7, $0, stringIguaisComp	#se fim, são iguais

	addi $a0, $a0, 1		#$a0++
	addi $a1, $a1, 1		#$a1++
	j loopComparandoString

stringNaoIguaisComp:
	li $v0, 0			#$v0 = 0
	jr $ra				#retorna

stringIguaisComp:
	li $v0, 1			#$v0 = 1
	jr $ra				#retorna

adicionarMorador:
	la $t9, option3			#$t9 = option3
	lb $t0, 0($t9)			#$t0 = $t9[0]
	beqz $t0, erroArgumentoFaltando	#if ($t0 ==0 ) -> erroArg
	
	la $a0, option2			#$a0 = option 2
	jal stringParaInt		#converte string em int
	move $t0, $v0			#$t0 = $v0
	sw $t0, numApt			#numApt = $t0

	la $a0, option3    		#$a0 = option 3
	
	lw $t0, numApt			#$t0 = numApt
	add $t3, $0, $t0		#$t3 = $0 + $t0
	
	jal buscarApartamentoCondominio	#faz a busca
	
	move $a0, $t3			#$a0 = $t3
	printInt			#executa macro
	
	lw $t4, indiceApartamento	#$t4 = indiceApartamento (indice memória, ex: 0, 428, 856...)
	quebra_linha			#executa macro
	
	bltz $t4, adicionarMorador	#se $t4 < 0, volta para o loop
	
	#Tem que verifcar quantas pessoas existem naquele apartamento
	la $a0, apartamentos		#$a0 = apartamentos
	addi $t4, $t4, 4		#$t4 = $t4 + 4
	add $a0, $a0, $t4		#$a0 = $a0 + $t4
	lw $t5, 0($a0)			#$t5 = $a0[i] (carrega em t5 o valor que está na posicao de a0)
	
	li $t6, 5			#$t6 = 5
	beq $t5, $t6, apartamentoEstaCheio	#if ($t5 == $t6) -> apartamentoEstaCheio
	
	mul $t7, $t5, 64		#$t7 = $t5 * 64
	addi $t7, $t7, 8		#$t7 = $t7 + 8
	
	#Em $t7 está o índice em memória que deve ficar (iniciar) o nome do morador a ser inserido

	lw $t0, indiceApartamento	#$t0 = indiceApartamento (valor em memória, exemplo: apt 1 começa no 428)
	la $t1, option3			#$t1 = option3 (nomePessoa)
	la $a0, apartamentos		#$a0 = apartamentos
	
	add $a0, $a0, $t0		#$a0 = $a0 + $t0
	add $a0, $a0, $t7		#$t0 = $t0 + $t7
	
	loopInserirNomePessoa:
		lb $t2, 0($t1)				#$t1[0] = $t2 
		beq $t2, $0, fimInserirPessoaApt	#if ($t2 == 0) -> continuaInserirPessoaApt
	
		sb $t2, 0($a0)		#$a0[0] = $t2
		
		addi $t1, $t1, 1	#$t1 = $t1 + 1
		addi $a0, $a0, 1	#$a0 = $a0 + 1
		
		j loopInserirNomePessoa	#volta loop
	
	fimInserirPessoaApt:
		lw $t0, indiceApartamento	#$t0 = indiceApartamento (valor em memória, exemplo: apt 1 começa no 428)
		la $a0, apartamentos		#$a0 = apartamentos
	
		add $a0, $a0, $t0		#$a0 = $a0 + $t0
		addi $a0, $a0, 4		#$a0 = $a0 + 4
	
		lw $t1, 0($a0)			#$t1 = qtdPessoasApt
		addi $t1, $t1, 1		#$t1 = $t1 + 1
		sw $t1, 0($a0)			#$a0[] = $t1
		
		quebra_linha
		quebra_linha
		la $a0, pessoaAdicionadaSucesso
		printString
		quebra_linha
		quebra_linha
		
		j programaPrincipal


removerMorador:
	la $a0, option2			#$a0 = option2
	printString			#executa macro
	removerPessoaApt:
	# 1. Obter Número do Apartamento (option2)
	la $a0, option2
	lb $t0, 0($a0) # Verifica se option2 está vazia
	beqz $t0, erroArgumentoFaltando # Erro se o número do apartamento estiver faltando
	jal stringParaInt # Converte string (option2) em int ($v0)
	move $t3, $v0 # $t3 = número do apartamento

	# 2. Buscar Apartamento no Condomínio
	jal buscarApartamentoCondominio # Busca pelo número do apto em $t3
	
	lw $t4, indiceApartamento # $t4 = indiceApartamento (indice memória do apto encontrado)
	bltz $t4, removerPessoaAptErroAptoNaoEncontrado # Se $t4 < 0, apto não encontrado
	
	# 3. Obter Nome da Pessoa (option3)
	la $a1, option3 # $a1 = ponteiro para option3 (nome da pessoa)
	lb $t0, 0($a1)  # Verifica se option3 está vazia
	beqz $t0, erroArgumentoFaltando # Erro se o nome da pessoa estiver faltando
	
	
	addi $t4, $t4, 8 # $t4 = $t4 + 8, aonde começa os nomes das pessoas no bloco do apartamento (mantido nome original)
	
	la $a0, apartamentos # $a0 = base do array de apartamentos
	add $a0, $a0, $t4    # $a0 agora aponta para o início da área das pessoas no apartamento

	# $t2 é o offset acumulado para a posição da pessoa encontrada.
	# Será usado para determinar qual das 5 posições de morador estamos checando: 0, 64, 128...
	li $t2, 0 # $t2 = 0 (mantido nome original)
	
removerPessoaApartamento:

	move $s1, $a0 # $s1 aponta para a base da área de pessoas
	add $s1, $s1, $t2 # $s1 agora aponta para o início do nome da pessoa atual ($a0 + $t2)
	
	# Reinicializa $a1 para o início da string nomePessoa (option3) para cada nova comparação de nome
	la $a1, option3

	li $t5, 0 # $t5 = contador de caracteres para a string nomePessoa (resetado para cada nome) (mantido nome original)
		
loopBuscarRemPessoaApt:
	lb $t0, 0($s1) # $t0 = char atual do nome na memória do apto (mantido nome original)
	lb $t1, 0($a1) # $t1 = char atual do nome digitado (option3) (mantido nome original)
	
	bne $t0, $t1, nomesDiferentesRem # if ($t0 != $t1) -> nomesDiferentesRem (nomes não são iguais)
	beq $t0, $0, nomesIguaisRem      # if ($t0 == \0) -> nomesIguaisRem (fim da string, nomes são iguais)
	
	addi $s1, $s1, 1 # $s1 = $s1 + 1 (avanca ponteiro para nome no apto)
	addi $a1, $a1, 1 # $a1 = $a1 + 1 (avanca ponteiro para nome digitado)
	addi $t5, $t5, 1 # $t5 = $t5 + 1 (incrementa contador de caracteres)
	
	j loopBuscarRemPessoaApt # volta loop


removerPessoaAptErroAptoNaoEncontrado:
    la $a0, apartamentoNaoEncontrado
    printString
    quebra_linha
    j programaPrincipal

nomesDiferentesRem:
	
	addi $t2, $t2, 64 # $t2 = $t2 + 64 (avanca para o offset do próximo morador)
	
	
	li $t3, 320 # $t3 = 320 (mantido nome original, mas agora como limite)
	# Verifica se já excedeu o limite de 5 pessoas (320 bytes)
	bge $t2, $t3, pessoaNaoExisteRem # Se $t2 >= 320, todas as 5 posições foram checadas e não encontrou a pessoa.

	# Se não excedeu, tenta buscar a próxima pessoa
	j removerPessoaApartamento # Volta para o início do loop `removerPessoaApartamento` para comparar o próximo nome

nomesIguaisRem:
	# Pessoa encontrada! Agora remove e realoca.
	quebra_linha # apenas uma quebra de linha visual

	sw $t2, indicePessoa # indicePessoa = $t2 (offset dentro do apto: 0, 64, 128...) (mantido nome original)
		
	# Recalcular ponteiros para o início do bloco do apto
	lw $t1, indiceApartamento # $t1 = indiceApartamento (offset base do apto) (mantido nome original)
	la $a0, apartamentos # $a0 = base do array de apartamentos
	add $a0, $a0, $t1 # $a0 agora aponta para o *início do bloco do apartamento*
	
	# Quantidade de pessoas no apartamento
	lw $t2, 4($a0) # $t2 = $a0[4] (qtd pessoas, offset 4 do início do bloco do apto) (mantido nome original)

	# Se $t2 for 1, é a última pessoa no apto. Apenas limpa e decrementa.
	li $t8, 1 # $t8 = 1 (novo temporário para comparação)
	beq $t2, $t8, removerUltimaPessoaApt # Se só tem 1 pessoa, pula a realocação

	# Endereço de destino para a cópia (onde a pessoa removida estava)
	lw $t0, indicePessoa # $t0 = indicePessoa (offset da pessoa a ser removida) (mantido nome original)
	addi $t3, $a0, 8   # $t3 = $a0 + 8 (offset que inicia as pessoas) (mantido nome original)
	add $t3, $t3, $t0 # $t3 = $t3 + $t0 (endereço de *início* do nome da pessoa a ser removida) (mantido nome original)

	
	addi $t4, $t3, 64 # $t4 = $t3 + 64 (endereço de início do nome da pessoa que vem *depois* da removida) (mantido nome original)

    lw $t5, 4($a0)    # $t5 = qtd pessoas atual no apto
    subi $t5, $t5, 1  # $t5 = qtd - 1 (para pegar o índice da última pessoa)
    mul $t5, $t5, 64  # $t5 = (qtd - 1) * 64 (offset da ultima pessoa)
    addi $t9, $a0, 8   # $t9 = endereco base dos nomes (usando $t9 como novo temporário)
    add $t5, $t9, $t5 # $t5 = endereco da ultima pessoa (origem para cópia final, mantido nome original)

 
    lw $t6, 4($a0)    # $t6 = qtd pessoas atual no apto
    lw $t7, indicePessoa # $t7 = offset da pessoa removida (0, 64, 128...) (usando $t7 como novo temporário)
    div $t7, $t7, 64  # $t7 = índice da pessoa removida (0, 1, 2...)
    sub $t6, $t6, $t7 # $t6 = qtd de pessoas restantes *após* a removida (incluindo a última)
    subi $t6, $t6, 1  # $t6 = qtd de pessoas a serem movidas (exclui a última pois ela vai ser a nova "última")
               

    # Multiplica $t6 por 64 para obter o total de bytes a mover
    mul $t6, $t6, 64 # $t6 = total de bytes a mover (mantido nome original)

    li $t0, 0 # $t0 = 0 (contador de bytes movidos, mantido nome original)

    # O loop de mover agora usa $t3 (destino) e $t4 (origem)
    moverPessoaParaPosRem: # (mantido nome original do seu label)
        beq $t0, $t6, concluirRemocaoPessoa # Se contador == total de bytes, conclui
        
        lb $t7, 0($t4) # $t7 = caractere da origem ($t4) (usando $t7 como temp)
        sb $t7, 0($t3) # Salva caractere no destino ($t3)

        addi $t3, $t3, 1 # Avança destino
        addi $t4, $t4, 1 # Avança origem
        addi $t0, $t0, 1 # Incrementa contador de bytes
        j moverPessoaParaPosRem

    j programaPrincipal # (este j main aqui é um fallback, não deve ser alcançado em fluxo normal)

removerUltimaPessoaApt:
    # Caso especial: a pessoa a ser removida é a última e única.
    # Apenas decrementa a qtd de pessoas e limpa a área dela.
    lw $t0, indiceApartamento
    la $a0, apartamentos
    add $a0, $a0, $t0 # $a0 = início do bloco do apto
    
    lw $t1, indicePessoa # $t1 = offset da pessoa removida (0, 64, 128...)
    addi $t3, $a0, 8   # $t3 = endereço base da primeira pessoa no apto
    add $t3, $t3, $t1 # $t3 = endereço de *início* do nome da pessoa a ser removida
    
    # Limpa os 64 bytes da pessoa
    li $t6, 0 # $t6 = 0 (Contador)
    li $t7, 64 # $t7 = 64 (Limite)

    loopLimparBytesPessoa: # (mantido nome original do seu label)
        beq $t6, $t7, concluirRemocaoPessoa # Terminou de limpar
        sb $0, 0($t3) # Limpa byte
        addi $t3, $t3, 1
        addi $t6, $t6, 1
        j loopLimparBytesPessoa

concluirRemocaoPessoa:
    # Decrementa a quantidade de pessoas no apartamento
    lw $t0, indiceApartamento
    la $a0, apartamentos
    add $a0, $a0, $t0 # $a0 = início do bloco do apto
    
    lw $t2, 4($a0) # $t2 = qtd pessoas atual
    subi $t2, $t2, 1 # $t2 = $t2 - 1
    sw $t2, 4($a0) # Salva nova qtd de pessoas

    la $a0, pessoaRemovidaSucesso # Mensagem de sucesso
    printString
    quebra_linha
    j programaPrincipal # Volta para o shell

pessoaNaoExisteRem:
  la $a0, pessoaNaoExiste #$a0 = pessoaNaoExiste
  printString #executa macro
  quebra_linha #executa macro
     j programaPrincipal #volta para o main

apartamentoEstaCheio:
	quebra_linha #executa macro
	la $a0, aptCheio #$a0 = aptCheio
	printString #executa macro
	quebra_linha #executa macro
	quebra_linha #executa macro
	j programaPrincipal

	
	
adicionarAuto:
	la $a0, option2			#$a0 = option2
	printString			#executa macro
	quebra_linha			#executa macro
	
	# 1. Obter Número do Apartamento (option2)
	la $a0, option2
	lb $t0, 0($a0) # Verifica se option2 está vazia
	beqz $t0, erroArgumentoFaltando # Erro se o número do apartamento estiver faltando
	jal stringParaInt # Converte string (option2) em int ($v0)
	move $t3, $v0 # $t3 = número do apartamento

	# 2. Buscar Apartamento no Condomínio
	jal buscarApartamentoCondominio # Busca pelo número do apto em $t3
	
	lw $t4, indiceApartamento # $t4 = indiceApartamento (indice memória do apto encontrado)
	bltz $t4, adicionarAutomovelErroAptoNaoEncontrado # Se $t4 < 0, apto não encontrado
	
	la $a0, apartamentos # Base do array de apartamentos
	add $a0, $a0, $t4    # $a0 agora aponta para o início do bloco do apartamento

	# 3. Verificar Quantidade de Moradores
	lw $t8, 4($a0) # $t8 = quantidadePessoasApto (offset 4 do início do apto)
	beqz $t8, semMoradoresSemVeiculos # Se $t8 = 0, não há moradores
	
	# 4. Obter InteiroVeiculo (Tipo de Veículo Existente)
	# OFFSET: 328 bytes para o InteiroVeiculo (Tipo de Veiculo Existente)
	lw $t5, 328($a0) # $t5 = InteiroVeiculo do apartamento
	
	# Verificar se o apartamento pode ter mais veículos (limite 2 motos ou 1 carro)
	li $t6, 3 # 3 = carro
	beq $t5, $t6, apartamentoNaoPodeTerVeiculo # Se já tem carro, não pode ter mais veículos (apenas 1 carro por apto)

	li $t6, 2 # 2 = duas motos
	beq $t5, $t6, apartamentoNaoPodeTerVeiculo # Se já tem duas motos, não pode ter mais veículos
	
	# 5. Obter Tipo de Veículo (option3)
	la $t9, option3 # $t9 = ponteiro para option3 (tipo de veículo: 'c' ou 'm')
	lb $t3, 0($t9)  # $t3 = primeiro caractere de option3
	beqz $t3, erroArgumentoFaltando # Erro se o tipo de veículo estiver faltando

	la $t7, 0x63 # $t7 = 'c' (ASCII para carro)
	beq $t3, $t7, inserirCarro # Se tipo == 'c', vai para inserirCarro

	la $t7, 0x6D # $t7 = 'm' (ASCII para moto)
	beq $t3, $t7, inserirMoto # Se tipo == 'm', vai para inserirMoto
	
	# Se chegou aqui, o tipo de veículo é inválido
	la $a0, tipoVeiculoInvalido
	printString
	quebra_linha
	j programaPrincipal

adicionarAutomovelErroAptoNaoEncontrado:
    la $a0, apartamentoNaoEncontrado # Mensagem de erro
    printString
    quebra_linha
    j programaPrincipal

semMoradoresSemVeiculos:
	quebra_linha
	la $a0, msgNaoExisteMoradores
	printString
	quebra_linha
	j programaPrincipal

inserirCarro:
	
	bnez $t5, apartamentoNaoPodeTerCarro # Se $t5 != 0 (já tem algum veículo), não pode adicionar carro


	la $t1, option4 # $t1 = ponteiro para option4 (modelo do veículo)
	lb $t0, 0($t1)  # Verifica se option4 está vazia
	beqz $t0, erroArgumentoFaltando # Erro se o modelo estiver faltando

	# Ponteiro para o local de destino do modelo no apartamento (offset 332)
	lw $t0, indiceApartamento # Recarrega indiceApartamento
	la $a0, apartamentos      # Base do array de aptos
	add $a0, $a0, $t0         # $a0 aponta para o início do bloco do apto
	addi $a0, $a0, 332        # $a0 agora aponta para o início da área do modelo do veículo (offset 332)
	
	jal loopInserirModeloVeiculo # Copia a string de $t1 para $a0


	la $t1, option5 # $t1 = ponteiro para option5 (cor do veículo)
	lb $t0, 0($t1)  # Verifica se option5 está vazia
	beqz $t0, erroArgumentoFaltando # Erro se a cor estiver faltando

	# Ponteiro para o local de destino da cor no apartamento (offset 396)
	lw $t0, indiceApartamento # Recarrega indiceApartamento
	la $a0, apartamentos      # Base do array de aptos
	add $a0, $a0, $t0         # $a0 aponta para o início do bloco do apto
	addi $a0, $a0, 396        # $a0 agora aponta para o início da área da cor do veículo (offset 396)
	
	jal loopInserirCorVeiculo # Copia a string de $t1 para $a0


	
	lw $t0, indiceApartamento # Recarrega indiceApartamento
	la $a0, apartamentos      # Base do array de aptos
	add $a0, $a0, $t0         # $a0 aponta para o início do bloco do apto
	addi $a0, $a0, 328        # $a0 aponta para InteiroVeiculo
	li $t0, 3                 # $t0 = 3 (código para CARRO)
	sw $t0, 0($a0)            # Salva 3 na posição do InteiroVeiculo

	la $a0, carroAdicionadoSucesso
	printString
	quebra_linha
	j programaPrincipal

inserirMoto:
	# $t5 contém o valor de InteiroVeiculo do apartamento no início de adicionarAutomovel.
	# Se $t5 for 2 (já tem duas motos), não pode adicionar mais. A verificação acima já deveria ter pego.
	# Se $t5 for 3 (já tem carro), também não pode.
	li $t6, 2
	beq $t5, $t6, apartamentoNaoPodeTerVeiculo # Já tem 2 motos, erro
	li $t6, 3
	beq $t5, $t6, apartamentoNaoPodeTerVeiculo # Já tem carro, erro (moto não pode existir com carro)


	mul $t7, $t5, 32 # $t7 = $t5 * 32 (0*32=0 para 1ª moto, 1*32=32 para 2ª moto)
	addi $t7, $t7, 332 # $t7 = $t7 + 332 (Offset base para o primeiro modelo de moto)
	# Em $t7 está o índice em memória que deve ficar (iniciar) o modelo da moto

	# 1. Obter Modelo da Moto (option4)
	la $t1, option4 # $t1 = ponteiro para option4 (modelo do veículo)
	lb $t0, 0($t1)  # Verifica se option4 está vazia
	beqz $t0, erroArgumentoFaltando # Erro se o modelo estiver faltando

	lw $t0, indiceApartamento # Recarrega indiceApartamento
	la $a0, apartamentos      # Base do array de aptos
	add $a0, $a0, $t0         # $a0 aponta para o início do bloco do apto
	add $a0, $a0, $t7         # $a0 agora aponta para o local exato do modelo da moto

	jal loopInserirModeloVeiculo # Copia a string de $t1 para $a0

	
	mul $t7, $t5, 16 # $t7 = $t5 * 16 (0*16=0 para 1ª moto, 1*16=16 para 2ª moto)
	addi $t7, $t7, 396 # $t7 = $t7 + 396 (Offset base para a primeira cor de moto)
	# Em $t7 está o índice em memória que deve ficar (iniciar) a cor da moto


	la $t1, option5 # $t1 = ponteiro para option5 (cor do veículo)
	lb $t0, 0($t1)  # Verifica se option5 está vazia
	beqz $t0, erroArgumentoFaltando # Erro se a cor estiver faltando

	lw $t0, indiceApartamento # Recarrega indiceApartamento
	la $a0, apartamentos      # Base do array de aptos
	add $a0, $a0, $t0         # $a0 aponta para o início do bloco do apto
	add $a0, $a0, $t7         # $a0 agora aponta para o local exato da cor da moto

	jal loopInserirCorVeiculo # Copia a string de $t1 para $a0


	lw $t0, indiceApartamento # Recarrega indiceApartamento
	la $a0, apartamentos      # Base do array de aptos
	add $a0, $a0, $t0         # $a0 aponta para o início do bloco do apto
	addi $a0, $a0, 328        # $a0 aponta para InteiroVeiculo

	lw $t0, 0($a0)            # $t0 = valor atual de InteiroVeiculo
	addi $t0, $t0, 1          # $t0 = $t0 + 1 (incrementa o contador de motos)
	sw $t0, 0($a0)            # Salva o novo valor de InteiroVeiculo

	la $a0, motoAdicionadaSucesso
	printString
	quebra_linha
	j programaPrincipal

loopInserirModeloVeiculo:
	lb $t2, 0($t1) # $t2 = char atual da string de origem ($t1)
	beqz $t2, fimInserirModeloVeiculo # Se char for nulo, fim da cópia

	sb $t2, 0($a0) # Salva o char no destino ($a0)
	addi $t1, $t1, 1 # Avança ponteiro de origem
	addi $a0, $a0, 1 # Avança ponteiro de destino
	j loopInserirModeloVeiculo # Continua o loop
fimInserirModeloVeiculo:
	sb $0, 0($a0) # Garante terminador nulo no final da string copiada
	jr $ra # Retorna

loopInserirCorVeiculo:
	lb $t2, 0($t1) # $t2 = char atual da string de origem ($t1)
	beqz $t2, fimInserirCorVeiculo # Se char for nulo, fim da cópia

	sb $t2, 0($a0) # Salva o char no destino ($a0)
	addi $t1, $t1, 1 # Avança ponteiro de origem
	addi $a0, $a0, 1 # Avança ponteiro de destino
	j loopInserirCorVeiculo # Continua o loop
fimInserirCorVeiculo:
	sb $0, 0($a0) # Garante terminador nulo no final da string copiada
	jr $ra # Retorna

apartamentoNaoPodeTerVeiculo:
	quebra_linha
	la $a0, aptoNaoPodeTerVeiculo
	printString
	quebra_linha
	j programaPrincipal

apartamentoNaoPodeTerCarro:
	quebra_linha
	la $a0, aptoNaoPodeTerCarro
	printString
	quebra_linha
	j programaPrincipal



removerAuto:
	
	la $a0, option2
	lb $t0, 0($a0) # Verifica se option2 está vazia
	beqz $t0, erroArgumentoFaltando # Erro se o número do apartamento estiver faltando
	jal stringParaInt # Converte string (option2) em int ($v0)
	move $t3, $v0 # $t3 = número do apartamento
	

	jal buscarApartamentoCondominio # Faz a busca
	
	lw $t4, indiceApartamento # $t4 = indiceApartamento (indice memória, ex: 0, 428, 856...)

	bltz $t4, removerVeiculoAptErroAptoNaoEncontrado # Se $t4 < 0, apto não encontrado
	
	# 3. Obter Tipo de Veículo (option3)
	la $t9, option3 # $t9 = ponteiro para option3 (tipo de veículo) - (mantido como no seu `removerMorador`)
	lb $t0, 0($t9) # Verifica se option3 está vazia
	beqz $t0, erroArgumentoFaltando # Erro se o tipo de veículo estiver faltando
	
	# 4. Obter Modelo do Veículo (option4)
	la $a1, option4 # $a1 = ponteiro para option4 (modeloVeiculo)
	lb $t0, 0($a1) # Verifica se option4 está vazia
	beqz $t0, erroArgumentoFaltando # Erro se o modelo do veículo estiver faltando

	# 5. Obter Cor do Veículo (option5)
	la $a2, option5 # $a2 = ponteiro para option5 (corVeiculo)
	lb $t0, 0($a2) # Verifica se option5 está vazia
	beqz $t0, erroArgumentoFaltando # Erro se a cor do veículo estiver faltando
	
	# Reinicializa $a0 para o endereço base do apartamento
	la $a0, apartamentos
	add $a0, $a0, $t4 # $a0 agora aponta para o início do bloco do apartamento (base do apto)
	
	# Ponteiros para as áreas de modelos e cores dentro do apartamento
	# Usando $t8 para a base dos modelos e $t5 para a base das cores.
	addi $t8, $a0, 332 # $t8 = $a0 + 332 (base dos modelos)
	addi $t5, $a0, 396 # $t5 = $a0 + 396 (base das cores)

    # Determinar InteiroVeiculo esperado e limites de busca com base no tipo
    lb $t0, 0($t9) # Carrega o caractere do tipo ('c' ou 'm')
    li $t1, 'c' # 'c' para carro
    beq $t0, $t1, removerCarro


    li $t6, 1 # $t6 = InteiroVeiculo esperado para 1 moto
    li $t7, 2 # $t7 = InteiroVeiculo esperado para 2 motos
    li $t2, 64 # $t2 = Limite de busca para modelos de moto (2 motos * 32 bytes/moto) (limite total do offset)
    li $t0, 32 # $t0 = Tamanho do bloco de modelo de moto
    li $t1, 16 # $t1 = Tamanho do bloco de cor de moto
    j iniciarBuscaVeiculo
    
removerCarro:
    # Para carros: esperamos InteiroVeiculo ser 3.
    li $t6, 3 # $t6 = InteiroVeiculo esperado para carro
    li $t7, 3 # (Não usado para carro, mas mantém a estrutura)
    li $t2, 64 # $t2 = Limite de busca para modelo de carro (1 carro * 64 bytes/carro)
    li $t0, 64 # $t0 = Tamanho do bloco de modelo de carro
    li $t1, 32 # $t1 = Tamanho do bloco de cor de carro

iniciarBuscaVeiculo:
    # Verifica o InteiroVeiculo atual do apartamento para ver se o tipo esperado está lá
    lw $t3, 328($a0) # $t3 = $a0[328] (InteiroVeiculo atual do apto)
    
    # Se o tipo esperado não corresponde ao que está no apto (ex: quer remover carro mas só tem moto),
    # ou se o tipo esperado é moto e não há motos (InteiroVeiculo 0), então o veículo não existe.
    beq $t6, 3, checarCarroExiste # Se o tipo esperado é carro, tem tratamento específico
    
    # Se é moto, verifica se $t3 (InteiroVeiculo) é 1 ou 2. Se for 0 ou 3, não tem moto.
    bnez $t3, checarMotoExiste # Se $t3 não for zero, continua
    j veiculoNaoExisteRem # Se $t3 é zero, não há veículos, então a moto não existe.

checarCarroExiste:
    bne $t3, $t6, veiculoNaoExisteRem # Se $t3 não é 3, não há carro.
    j proximaBuscaModelo # Se é 3, continua a busca pelo modelo/cor

checarMotoExiste:
    # $t3 é 1 ou 2. Ok para buscar moto.
    bne $t3, 1, checarSegundaMotoExiste # Se $t3 não é 1, pode ser 2
    j proximaBuscaModelo # Há 1 moto, continua a busca
checarSegundaMotoExiste:
    bne $t3, 2, veiculoNaoExisteRem # Se não é 1 nem 2, não tem a moto certa.
    j proximaBuscaModelo

proximaBuscaModelo:
	li $t4, 0 # $t4 = 0 (offset para o slot de veículo atual: 0 para 1º, 32 para 2º moto)
	
removerModeloApartamento:
	# $a3 agora será o ponteiro de comparação para o modelo no apartamento
	add $a3, $t8, $t4 # $a3 = base dos modelos ($t8) + $t4 (offset do slot atual)
	
	# $a1 já aponta para option4 (modelo digitado)
	# $t7 será o contador de caracteres para a string (reuso de $t7)
	li $t7, 0 # Reinicializa contador de caracteres
	
loopBuscarRemModeloApt:
	lb $t0, 0($a3) # $t0 = char atual do modelo no apto
	lb $t1, 0($a1) # $t1 = char atual do modelo digitado
	
	bne $t0, $t1, veiculosDiferentesRem # if ($t0 != $t1) -> ModelosDiferentesRem
	beq $t0, $0, modelosIguaisRem # if ($t0 == \0) -> modelosIguaisRem (modelos são iguais, prossegue para cor)
	
	addi $a3, $a3, 1 # $a3 = $a3 + 1 (avanca ponteiro para modelo no apto)
	addi $a1, $a1, 1 # $a1 = $a1 + 1 (avanca ponteiro para modelo digitado)
	addi $t7, $t7, 1 # Incrementa contador de caracteres
	j loopBuscarRemModeloApt # Volta loop
	


removerVeiculoAptErroAptoNaoEncontrado:
    la $a0, apartamentoNaoEncontrado
    printString
    quebra_linha
    j programaPrincipal

veiculosDiferentesRem:
	# Modelo atual não corresponde. Tenta o próximo slot de veículo (se houver).
    lb $t0, 0($t9) # Carrega o tipo de veículo novamente (do ponteiro para option3)
    li $t1, 'c'
    beq $t0, $t1, veiculoNaoExisteRem # Se é carro e não achou, não existe. Carro só tem 1 slot.

	addi $t4, $t4, 32 # $t4 = $t4 + 32 (avanca para o offset do próximo modelo de moto)
	# $t2 é 64, o limite máximo para slots de modelo de moto.
	bge $t4, $t2, veiculoNaoExisteRem # Se $t4 >= $t2, significa que tentamos todos os slots.
	
	# Reinicia $a1 para o início de option4 (modelo digitado) para a próxima comparação
	la $a1, option4
	j removerModeloApartamento # Volta para o início de 'removerModeloApartamento' para checar o próximo slot

modelosIguaisRem:
	# Modelos são iguais. Agora compara a cor.
	# Calcula o offset da cor com base no offset do modelo encontrado ($t4)
    lb $t0, 0($t9) # Carrega o tipo de veículo novamente (do ponteiro para option3)
    li $t1, 'c'
    beq $t0, $t1, corCarro # Se é carro, o offset da cor é sempre 0
    
    # Se é moto, $t1 (tamanho do bloco de cor) é 16 ou 32, mas $t4 é o offset do modelo (0 ou 32)
    # A cor da primeira moto está no offset 0, da segunda no offset 16 (relativo à base das cores)
	div $t7, $t4, 2 # $t7 = $t4 / 2 (0/2=0 para 1ª moto, 32/2=16 para 2ª moto, $t7 para offset da cor)
    j iniciarBuscaCor

corCarro:
    li $t7, 0 # Offset da cor do carro é sempre 0

iniciarBuscaCor:
	# $a3 agora será o ponteiro de comparação para a cor no apartamento
	add $a3, $t5, $t7 # $a3 = base das cores ($t5) + $t7 (offset da cor atual)

	# $a2 já aponta para option5 (cor digitada)
	# $t6 será o contador de caracteres para a string (reuso de $t6)
	li $t6, 0 # $t6 = 0 (contador de caracteres para a string de cor atual)
	
loopBuscarRemCorApt:
	lb $t0, 0($a3) # $t0 = char atual da cor no apto
	lb $t1, 0($a2) # $t1 = char atual da cor digitada
	
	bne $t0, $t1, coresDiferentesRem # if ($t0 != $t1) -> coresDiferentesRem
	beq $t0, $0, veiculosIguaisRem # if ($t0 == \0) -> veiculosIguaisRem (cor também é igual, veículo encontrado!)
	
	addi $a3, $a3, 1 # $a3 = $a3 + 1 (avanca ponteiro para cor no apto)
	addi $a2, $a2, 1 # $a2 = $a2 + 1 (avanca ponteiro para cor digitada)
	addi $t6, $t6, 1 # Incrementa contador
	j loopBuscarRemCorApt
	
coresDiferentesRem:
	# Cor não corresponde. Significa que o modelo era igual, mas a cor não.
    lb $t0, 0($t9) # Carrega o tipo de veículo
    li $t1, 'c'
    beq $t0, $t1, veiculoNaoExisteRem # Se é carro, veículo não existe (só tem um slot)

	# Se for moto, e a cor não combinou, tenta o próximo slot de moto (se houver).
	# Reinicia $a1 e $a2 para a próxima comparação
	la $a1, option4
	la $a2, option5
	j veiculosDiferentesRem # Volta ao fluxo de verificar próximo modelo de moto
	

veiculosIguaisRem:
	# Veículo (modelo e cor) encontrado!
	# $t4 (offset do modelo) e $t7 (offset da cor) agora indicam a posição do veículo a ser removido.
	
	la $a0, apartamentos # $a0 = base do array de apartamentos
	lw $t1, indiceApartamento # $t1 = indiceApartamento
	add $a0, $a0, $t1 # $a0 agora aponta para o *início do bloco do apartamento*
	
	# Determina se é moto ou carro para lógica de remoção
	lb $t0, 0($t9) # Carrega o tipo de veículo ('c' ou 'm') (do ponteiro para option3)
	li $t1, 'c' # 'c' para carro
	beq $t0, $t1, removerCarroEncontrado # Se é carro, vai para remoção de carro
	
	# --- Lógica de Remoção para MOTOS ---
	# $t3: InteiroVeiculo do apartamento (tipo de veículo existente e quantidade de motos)
	lw $t3, 328($a0) # $t3 = $a0[328] (InteiroVeiculo)
	
	li $t0, 2 # $t0 = 2 (se InteiroVeiculo for 2, significa que há duas motos)
	# Se $t3 é 2 (duas motos) e o $t4 (offset do modelo) é 0 (primeira moto)
	# então a segunda moto (offset 32) precisa ser movida para a posição da primeira.
	beq $t3, $t0, checarSePrimeiraMotoRemovida # Se há 2 motos, checa qual está sendo removida
	
	# Se só tem 1 moto, ou se a segunda moto está sendo removida, não precisa mover.
	# Vai direto para a limpeza dos bytes da moto removida.
	j limparBytesVeiculo
	
checarSePrimeiraMotoRemovida:
	# Se $t4 for 0, significa que a *primeira* moto (slot 0) está sendo removida.
	# Se for a segunda (slot 32), não precisa mover.
	bnez $t4, limparBytesVeiculo # Se $t4 (offset do modelo) não é 0 (ou seja, é 32),


	addi $a3, $a0, 332 # $a3 = $a0 + 332 (primeiro slot de modelo, DESTINO)
	addi $a1, $a0, 364 # $a1 = $a0 + 364 (segundo slot de modelo, ORIGEM)
	
	li $t6, 0 # $t6 = 0 (contador de bytes movidos)
		
	moverModeloVeiculoPosRem:
		beq $t6, $t0, moverModeloVeiculoConcluido # if ($t6 == $t0 (32)) -> moverModeloVeiculoConcluido

		lb $t2, 0($a1) # $t2 = char do modelo (origem $a1)
		sb $t2, 0($a3) # Salva char no destino ($a3)

		addi $a3, $a3, 1 # Avança destino
		addi $a1, $a1, 1 # Avança origem
		addi $t6, $t6, 1 # Incrementa contador
		j moverModeloVeiculoPosRem
	
	moverModeloVeiculoConcluido:
	# Agora move a cor
	# Ponteiro de destino para a cor (primeiro slot de cor)
	addi $a3, $a0, 396 # $a3 = $a0 + 396 (primeiro slot de cor, DESTINO)
	# Ponteiro de origem para a cor (segundo slot de cor)
	addi $a1, $a0, 412 # $a1 = $a0 + 412 (segundo slot de cor, ORIGEM)
	
	li $t6, 0 # $t6 = 0 (reset contador)
	
	moverCorVeiculoPosRem:
		beq $t6, $t1, limparBytesVeiculo # if ($t6 == $t1 (16)) -> limparBytesVeiculo
		
		lb $t2, 0($a1) # $t2 = char da cor (origem $a1)
		sb $t2, 0($a3) # Salva char no destino ($a3)

		addi $a3, $a3, 1 # Avança destino
		addi $a1, $a1, 1 # Avança origem
		addi $t6, $t6, 1 # Incrementa contador
		j moverCorVeiculoPosRem
	
removerCarroEncontrado:
    # Se um carro está sendo removido, não há deslocamento necessário, apenas limpeza e atualização de InteiroVeiculo.
    # $t4 (offset do modelo) e $t7 (offset da cor) já devem ser 0 para o carro.
    j limparBytesVeiculo



limparBytesVeiculo:
	quebra_linha # apenas uma quebra de linha visual
	la $a0, apartamentos # $a0 = base do array de apartamentos
	lw $t1, indiceApartamento # $t1 = indiceApartamento
	add $a0, $a0, $t1 # $a0 agora aponta para o *início do bloco do apartamento*
	
	# Ponteiros para a área do modelo e cor do veículo a ser limpo
	# $t4 é o offset do modelo a ser limpo (0 para 1ª moto/carro, 32 para 2ª moto)
	addi $a3, $a0, 332 # $a3 = $a0 + 332 (base dos modelos, reuso de $a3 para ponteiro de limpeza)
	add $a3, $a3, $t4 # $a3 = $a3 + $t4 (Posição do modelo a ser limpo)
	
	# $t7 é o offset da cor a ser limpa (0 para 1ª moto/carro, 16 para 2ª moto)
	addi $a1, $a0, 396 # $a1 = $a0 + 396 (base das cores, reuso de $a1 para ponteiro de limpeza)
	add $a1, $a1, $t7 # $a1 = $a1 + $t7 (Posição da cor a ser limpa)
	
	# Definir o tamanho do bloco a ser limpo (modelo)
    lb $t0, 0($t9) # Tipo de veículo ('c' ou 'm')
    li $t1, 'c'
    beq $t0, $t1, limparCarroModelo # Se é carro, limpa 64 bytes
    
    # Se é moto, limpa 32 bytes de modelo
	li $t6, 0 # $t6 = 0 (contador de bytes limpos)
	li $t7, 32 # $t7 = 32 (limite para limpar o bloco do modelo de moto)
    j loopLimparModelo

limparCarroModelo:
    li $t6, 0 # $t6 = 0 (contador de bytes limpos)
    li $t7, 64 # $t7 = 64 (limite para limpar o bloco do modelo de carro)

loopLimparModelo:
	beq $t6, $t7, byteModeloRemovidoSuc # if ($t6 == $t7) -> terminou de limpar o modelo
	
	sb $0, 0($a3) # Limpa byte do modelo ($a3 é o ponteiro do modelo)
	
 	addi $a3, $a3, 1 # Avança ponteiro do modelo
	addi $t6, $t6, 1 # Incrementa contador
		
	j loopLimparModelo
	
byteModeloRemovidoSuc:
	# Agora limpa a cor.
    lb $t0, 0($t9) # Tipo de veículo ('c' ou 'm')
    li $t1, 'c'
    beq $t0, $t1, limparCarroCor # Se é carro, limpa 32 bytes de cor
    
    # Se é moto, limpa 16 bytes de cor
	li $t6, 0 # $t6 = 0 (reset contador para cor)
	li $t7, 16 # $t7 = 16 (limite para limpar o bloco da cor de moto)
    j loopLimparCor

limparCarroCor:
    li $t6, 0 # $t6 = 0 (reset contador para cor)
    li $t7, 32 # $t7 = 32 (limite para limpar o bloco da cor de carro)

loopLimparCor:
	beq $t6, $t7, corRemovidaSuc # if ($t6 == $t7) -> terminou de limpar a cor
	
	sb $0, 0($a1) # Limpa byte da cor ($a1 é o ponteiro para a cor)
	
 	addi $a1, $a1, 1 # Avança ponteiro da cor
	addi $t6, $t6, 1 # Incrementa contador
		
	j loopLimparCor
	
corRemovidaSuc:
	# Atualiza o InteiroVeiculo
	lw $t3, 328($a0) # $t3 = $a0[328] (InteiroVeiculo)
	
    lb $t0, 0($t9) # Tipo de veículo ('c' ou 'm')
    li $t1, 'c'
    beq $t0, $t1, atualizaInteiroVeiculoCarro # Se é carro, trata a atualização
    
    # Se é moto, decrementa
    subi $t3, $t3, 1 # $t3 = $t3 - 1 (de 1 para 0, ou de 2 para 1)
    j atualizarInteiroVeiculo

atualizaInteiroVeiculoCarro:
    li $t3, 0 # $t3 = 0 (carro foi removido, InteiroVeiculo vira 0)
	
atualizarInteiroVeiculo:
	sw $t3, 328($a0) # Salva novo InteiroVeiculo		

veiculoRemocaoConcluida:
	la $a0, veiculoRemovidoSucesso # Mensagem de sucesso
	printString # Executa macro
	quebra_linha # Executa macro
	
	j programaPrincipal # Volta para o main
	
veiculoNaoExisteRem:
	la $a0, veiculoNaoExiste # Mensagem de erro
	printString # Executa macro
	quebra_linha # Executa macro
	j programaPrincipal # Volta para o main
	
	

limparApartamento:

	la $a0, option2			#$a0 = option2
	printString			#executa macro
	quebra_linha			#executa macro
	
	la $t9, option2            # $t9 = endereço de option2
  	lb $t0, 0($t9)             # $t0 = primeiro byte de option2
    	beqz $t0, erroArgumentoFaltando # Se for 0 (string vazia), erro

    	la $a0, option2            # $a0 = endereço da string em option2
    	jal stringParaInt          # Chama sua função para converter string para int
   	move $t0, $v0              # $t0 = valor inteiro retornado por stringParaInt
    	sw $t0, numApartamento     # Salva o número do apartamento na variável global (já existente)

   	lw $t3, numApartamento 
	
	jal buscarApartamentoCondominio	#faz a busca
	
	move $a0, $t3			#$a0 = $t3
	printInt			#executa macro
	quebra_linha			#executa macro
	
	lw $t4, indiceApartamento	#$t4 = indiceApartamento (indice memória, ex: 0, 428, 856...)

	bltz $t4, limparApartamento	#se $t4 < 0, volta para o loop
	
	quebra_linha		#executa macro

    	la $t2, apartamentosOrigem  # Endereço fonte: apartamentosOrigem
    	addi $t2, $t2, 4	    #$t3 = $t2 + 4 (endereço da quantidade de pessoas do apto)
    	
    	la $t3, apartamentos        # Endereço destino: apartamentos
    	add $t3, $t3, $t4	    #$t3 = $t3 + $t4  (endereço do apto)
    	addi $t3, $t3, 4	    #$t3 = $t3 + 4 (endereço da quantidade de pessoas do apto)
    	
    	li $t0, 0                   # Contador de bytes
   	li $t1, 424                 # Total de bytes a copiar (mesmo tamanho da área)

	loopLimpaApartamentos:
	
   	 beq $t0, $t1, fimLimparApto # Se copiamos todos os bytes, termine

    	 lb $t4, 0($t2)              # Carrega um byte de apartamentosOrigem
   	 sb $t4, 0($t3)              # Salva o byte em apartamentos

    	 addi $t2, $t2, 1            # Avança no endereço fonte
   	 addi $t3, $t3, 1            # Avança no endereço destino
   	 addi $t0, $t0, 1            # Incrementa o contador de bytes

    	j loopLimpaApartamentos

	fimLimparApto:

    	la $a0, msgAptoLimpo
    	printString
    	quebra_linha
    	quebra_linha

   	j programaPrincipal                  # Retorna ao menu principal
	
	

infoApartamento:
	
	j programaPrincipal

infoGeral:

	la $a0, option2			#$a0 = option2
	printString			#executa macro
	quebra_linha			#executa macro
	
	
	la $a0, apartamentos
	addi $a0, $a0, 4                         #endereço da quantidade de pessoas do 1° apto
	li $t0, 0
	li $t1, 40
	li $t2, 0				 #contador de apto vazios
	li $t6, 0
	li $t7, 0
	
    loopVerificarApartamentos:
	
 	beq $t0, $t1, imprimirResultadoInfoGeral
	lw $t4, 0($a0) 
	beqz $t4, incrementarContagemAptosVazios
	
	continuaLoopVerificarAptos:
	
	addi $t0, $t0, 1			#incrementa 1 no $t1 (iterador)
	addi $a0, $a0, 428			#incrementa 428 no $a0
	
	j loopVerificarApartamentos
	
	   
    incrementarContagemAptosVazios:
	addi $t2, $t2, 1 
	
         j continuaLoopVerificarAptos
	   

    imprimirResultadoInfoGeral: 
   
	 	quebra_linha
	 	sub $t6, $t1, $t2			#AptosNaoVazios
	 	li $t5, 100				#$t5 = 100
	 	
	 	mul $t7, $t6, $t5
	 	div $t8, $t7, $t1			#PorcentagemAptosNaoVazios
	 	sub  $t7, $t5, $t8			#porcentagemAptosVazios
	 	
	 	la $a0, aptosNaoVazios
	 	printString
	 	move $a0, $t6
		printInt
		la $a0, aptosVaziosOuNaoP1
		printString
		move $a0, $t8
		printInt
		la $a0, aptosVaziosOuNaoP2
		printString
		
		quebra_linha
		quebra_linha
		
	 	la $a0, aptosVazios
	 	printString
	 	move $a0, $t2
	 	printInt
	 	la $a0, aptosVaziosOuNaoP1
		printString
	 	move $a0, $t7
	 	printInt
	 	la $a0, aptosVaziosOuNaoP2
		printString
		
		quebra_linha
		quebra_linha
	
      
	j programaPrincipal

salvarDados:
	la $a0, option2			#$a0 = option2
	printString			#executa macro
	quebra_linha			#executa macro

    quebra_linha

    li $v0, 13		     #comando para ler ou escrever em arquivo
    la $a0, nomeArquivo      # Nome do arquivo
    li $a1, 1                # Flag para escrita 
    syscall
    
    move $s0, $v0            # Salva o file descriptor em $s0

    li $v0, 15		     #escrever no arquivo
    move $a0, $s0            # File descriptor
    la $a1, apartamentos     # Endereço inicial da área de dados
    li $a2, 17120            # Tamanho total da área de apartamentos 
    syscall

    bltz $v0, erroSalvar # Se $v0 < 0, houve um erro ao escrever

    li $v0, 16		     #fechando arquivo
    move $a0, $s0            # File descriptor
    syscall

    la $a0, msgSalvoSucesso
    printString
    quebra_linha
    
    j programaPrincipal                   # Retorna ao menu principal
    
    
   erroSalvar:

    quebra_linha

    li $v0, 16		     #fechando arquivo
    move $a0, $s0            # File descriptor
    syscall
    
    la $a0, msgErroSalvar
    printString
    quebra_linha
    
   j programaPrincipal                 # Retorna ao menu principal
    
	

recarregarDados:

	la $a0, option2			#$a0= option2
	printString			#executa macro
	quebra_linha			#executa macro
	
	quebra_linha

    li $v0, 13		     #comando para ler ou escrever em arquivo
    la $a0, nomeArquivo      # Nome do arquivo
    li $a1, 0                # Flag para leitura 
    syscall
    
    move $s0, $v0            # Salva o file descriptor em $s0

    bltz $s0, erroAbrirArquivo # Se $s0 < 0, houve um erro ao abrir (arquivo não existe)

    move $a0, $s0            # File descriptor
    li $v0, 14
    la $a1, apartamentos     # Endereço inicial da área de destino
    li $a2, 17120            # Tamanho esperado dos dados
    syscall

    bltz $v0, erroLerArquivo # Se $v0 < 0, houve um erro na leitura

    li $v0, 16
    move $a0, $s0            # File descriptor
    syscall

    la $a0, msgCarregadoSucesso
    printString
    quebra_linha
    
    j programaPrincipal                   # Retorna ao menu principal
    
    
  erroAbrirArquivo:

    quebra_linha
 
    la $a0, msgArquivoNaoEncontrado
    printString
    quebra_linha
    
    j programaPrincipal 
    

  erroLerArquivo:

    quebra_linha
 
    li $v0, 16			#fechando arquivo
    move $a0, $s0
    syscall
    
    la $a0, msgErroCarregar	#$a0 = msgErroCarregar
    printString			#executa macro
    quebra_linha
    
    j programaPrincipal
	

formatarSistema:

	la $a0, option2			#$a0 = option2
	printString			#executa macro
	quebra_linha			#executa macro
	
	
	quebra_linha

    la $t2, apartamentosOrigem  # Endereço fonte: apartamentosOrigem
    la $t3, apartamentos        # Endereço destino: apartamentos
    li $t0, 0                   # Contador de bytes
    li $t1, 17120               # Total de bytes a copiar (mesmo tamanho da área)

   loopFormataApartamentos:
    beq $t0, $t1, fimFormatacao # Se copiamos todos os bytes, termine

    lb $t4, 0($t2)              # Carrega um byte de apartamentosOrigem
    sb $t4, 0($t3)              # Salva o byte em apartamentos

    addi $t2, $t2, 1            # Avança no endereço fonte
    addi $t3, $t3, 1            # Avança no endereço destino
    addi $t0, $t0, 1            # Incrementa o contador de bytes

    j loopFormataApartamentos

   fimFormatacao:

    la $a0, msgDadosFormatados
    printString
    quebra_linha
    quebra_linha

   j programaPrincipal                   # Retorna ao menu principal


stringParaInt:
    li $v0, 0                #inicializa o resultado em 0

loopStringInt:
    lb $t0, 0($a0)           #$t0 = $a0[i]
    beqz $t0, fimStringInt   #se for fim da string, encerra

    #Verifica se é um dígito
    li $t1, 48		# '0'
    li $t2, 57		# '9'
    blt $t0, $t1, fimStringInt  #Se < '0', termina
    bgt $t0, $t2, fimStringInt  #Se > '9', termina

    #converte ASCII -> inteiro
    sub $t0, $t0, $t1        #$t0 = char - '0'

    #numero = numero * 10 + digito
    mul $v0, $v0, 10
    add $v0, $v0, $t0

    addi $a0, $a0, 1         #Avança para próximo caractere
    j loopStringInt

fimStringInt:
    jr $ra                   #Retorna




encerrarPrograma:
	la $a0, encerrandoPr		#$a0 = encerrandoPr
	printString			#executa macro
	encerrar			#executa macro



	
	



buscarApartamento:
	quebra_linha			#executa macro
	la $a0, digiteNumApartamento	#$a0 = digiteNumApartamento
	printString			#executa macro

	readInt				#executa macro
	add $t5, $0, $v0		#$t5 = $0 + $v0
	
	la $a0, apartamentos		#$a0 = apartamentos
	li $t1, 1			#$t1 = 1
	li $t2, 40			#$t2 = 40
	
	loopBuscarApartamento:
		lw $t0, 0($a0)				#$t0 = $a0 []
		beq $t5, $t0, apartamentoEncontrado	#if ($t5 == $t0) -> apartamentoEncontrado
		
		beq $t1, $t2, apartamentoNaoEncontrado	#if ($t1 == $t2) -> apartamentoNaoEncontrado
		
		addi $t1, $t1, 1			#incrementa 1 no $t1 (iterador)
		addi $a0, $a0, 428			#incrementa 428 no $a0
		
		j loopBuscarApartamento			#volta loop
	
	
	apartamentoEncontrado:
		quebra_linha				#executa macro
		sw $t5, indiceApartamento		#indiceApartamento = $t5
		la $a0, aptNumEncontrado1		#$a0 = aptNumEncontrado1
		printString				#executa macro
		lw $a0, indiceApartamento		#$a0 = indiceApartamento
		printInt				#executa macro
		la $a0, aptNumEncontrado2		#$a0 = aptNumEncontrado2
		printString				#executa macro
		quebra_linha				#executa macro
		j programaPrincipal				#volta para o main
	
	apartamentoNaoEncontrado:
		quebra_linha				#executa macro
		la $a0, aptNumNaoEncontrado		#$a0 = aptNumNaoEncontrado
		printString				#executa macro
		quebra_linha				#executa macro
		j programaPrincipal				#volta para o main
	
	encerrar
	
	





	
	

	
	
	


buscarApartamentoCondominio:
	la $a0, apartamentos		#$a0 = apartamentos
	li $t1, 1			#$t1 = 1
	li $t2, 40			#$t2 = 40
	
	loopBuscarApartamentoCondominio:
		lw $t0, 0($a0)				#$t0 = $a0 []
		beq $t3, $t0, apartamentoEncontradoC	#if ($t3 == $t0) -> apartamentoEncontradoC
		
		beq $t1, $t2, apartamentoNaoEncontradoC	#if ($t1 == $t2) -> apartamentoNaoEncontradoC
		
		addi $t1, $t1, 1			#incrementa 1 no $t1 (iterador)
		addi $a0, $a0, 428			#incrementa 428 no $a0
		
		j loopBuscarApartamentoCondominio	#volta loop
	
	apartamentoEncontradoC:
		quebra_linha				#executa macro
		sw $t3, indiceApartamento		#indiceApartamento = $t5
		la $a0, aptNumEncontrado1		#$a0 = aptNumEncontrado1
		printString				#executa macro
		lw $a0, indiceApartamento		#$a0 = indiceApartamento
		printInt				#executa macro
		quebra_linha				#executa macro
		la $a0, aptNumEncontrado2		#$a0 = aptNumEncontrado2
		printString				#executa macro
		quebra_linha				#executa macro
		
		la $a0, apartamentos
		li $t0, 0
		li $t1, 17120
		lw $t2, indiceApartamento
		
		loopIndiceApt:
			beq $t0, $t1, concluiAptEncontrado
			lw $t3, 0($a0)
			beq $t3, $t2, retornaIndiceApt
			
			addi $t0, $t0, 4
			addi $a0, $a0, 4
			
			j loopIndiceApt
		
		retornaIndiceApt:
			sw $t0, indiceApartamento
		
		concluiAptEncontrado:
		jr $ra					#volta para inserirPessoaApt
	
	apartamentoNaoEncontradoC:
		quebra_linha				#executa macro
		la $a0, aptNumNaoEncontrado		#$a0 = aptNumNaoEncontrado
		printString				#executa macro
		li $t0, -1				#$t0 = -1
		sw $t0, indiceApartamento		#indiceApartamento = -1
		quebra_linha				#executa macro
		jr $ra
		#j inserirPessoaApt			#volta para inserirPessoaApt no começo

erroArgumentoFaltando:
	la $a0, argumentoFaltando
	printString
	
	
voltaMain:
	j programaPrincipal
