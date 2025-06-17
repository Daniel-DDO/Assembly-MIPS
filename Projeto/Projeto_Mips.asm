# Arquitetura e Organização de Computadores
# Semestre: 2025.1
# Alunos:
# Álvaro Ribeiro Bezerra da Silva
# Daniel Dionísio de Oliveira
# Gabriel Felipe Pontes da Silva Farias

# Projeto - Sistema de cadastro de pessoas e automóveis para um condomínio


.data
	apartamentosOrigem: .space 17120	#Espaço para formatação
	apartamentos: .space 17120		#Espaço de todos os APT
	nomePessoa: .space 64			#Espaço para o nome de uma pessoa
	inteiroVeiculo: .word 0			#Espaço para armazenamento de inteiro auxiliar à manutenção de veiculos
	tipoVeiculo: .space 10			#Espaço para armazenar o tipo de veículo (Carro ou moto)
	modeloVeiculo: .space 32		#Espaço para armazenar modelo de veículo
	corVeiculo: .space 16			#Espaço para armazenar cor de veículo
	barraN: .asciiz "\n"			#Pular linha
	tab: .asciiz "	"			#Tabulação
	
	digiteNomePessoaApt: .asciiz " - Digite o nome da pessoa (até 64 caracteres): "
	
	#Apartamentos
	numApartamento: .word 0		#Espaço para registro de número de apartamento
	indiceApartamento: .word 0	#Posição relativa do apartamento
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
	
	#Pessoas
	pessoaNaoExiste: .asciiz "A pessoa não foi encontrada para ser removida nesse apartamento."
	pessoaExiste: .asciiz "Pessoa encontrada e removida com sucesso."
	indicePessoa: .word 0	#Posição relativa
	pessoaAdicionadaSucesso: .asciiz "Pessoa adicionada com sucesso!"
	

	#Veículos
	veiculoNaoExiste: .asciiz "Veiculo não encontrado."
	veiculoRemovido: .asciiz "Veiculo encontrado e removido com sucesso!"
	msgNaoExisteMoradores: .asciiz "Não é possível adicionar veículos, pois não há moradores"
	aptoNaoPodeTerVeiculo: .asciiz "Falha: AP com numero max de automóveis"
	digiteTipoVeiculo: .asciiz "Digite (m) para moto ou (c) para carro: "
	tipoVeiculoInvalido: .asciiz "Tipo de veículo inválido"
	digiteModeloVeiculo: .asciiz "Digite o modelo do veículo: "
	digiteCorVeiculo: .asciiz "Digite a cor do veículo: "

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

.macro quebra_linha	#Pular linha rapidamente
	la $a0, barraN	#$a0 = barraN
	li $v0, 4	#chama a impressão
	syscall		#executa a linha anterior
.end_macro

.macro tab		#Tabulação rápida
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
.globl main			#main inicial e para testes

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
	la $a0, shellGDA	#$a0 = shellGDA
	printString

	li $v0, 8		#$v0 = 8
	la $a0, userDigitou	#$a0 = userDigitou
	li $a1, 100		#$a1 = 100
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

	beq $t5, 0, salvarOption1	#Salva no option1
	beq $t5, 1, salvarOption2	#Salva no option2
	beq $t5, 2, salvarOption3	#Salva no option3
	beq $t5, 3, salvarOption4	#Salva no option4
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
	beq $t5, 0, encerrarOption1		#Se $t5=0 (option1), encerra
	beq $t5, 1, encerrarOption2		#Se $t5=1 (option2), encerra
	beq $t5, 2, encerrarOption3		#Se $t5=2 (option3), encerra
	beq $t5, 3, encerrarOption4		#Se $t5=3 (option4), encerra
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
    # REINICIALIZAÇÃO DOS PONTEIROS PARA OS ENDEREÇOS BASE DAS OPTIONS
    la $t1, option1
    la $t2, option2
    la $t3, option3
    la $t4, option4
    la $s0, option5        # <--- NOVO: Recarrega $s0 para o início de option5

    # Processar option1 (re-uso de $t9 para varredura e $t0 como contador local)
    la $t9, option1
    li $t0, 0 # Contador para o loop atual
    loopLimparOption1:
        lb $t8, 0($t9)			#$t8 = $t9[0]
        beq $t8, $0, fimLimparOption1	#if $t8 == 0 fimLimparOption1
        li $t7, 10  			#ASCII para '\n'
        beq $t8, $t7, retirarBarraNLinha1	#if $t8 == $t7 retirarBarraNLinha1
        addi $t9, $t9, 1		#$t9 = $t9 + 1
        addi $t0, $t0, 1		#$t0 = $t0 + 1
        bge $t0, 12, fimLimparOption1 # <--- AJUSTADO para 12 bytes (option1)
        j loopLimparOption1
    retirarBarraNLinha1:
        sb $0, 0($t9)		#$t9[0] = 0
    fimLimparOption1:

    # Processar option2
    la $t9, option2		#$t9 = option2
    li $t0, 0			#$t0 = 0
    loopLimparOption2:
        lb $t8, 0($t9)		#$t8 = $t9[0]
        beq $t8, $0, fimLimparOption2	#if $t8 == 0 fimLimparOption2
        li $t7, 10		 # ASCII para '\n'
        beq $t8, $t7, retirarBarraNLinha2	#if $t8 == $t7 retirarBarraNLinha2
        addi $t9, $t9, 1		#$t9 = $t9 + 1
        addi $t0, $t0, 1		#$t0 = $t0 + 1
        bge $t0, 5, fimLimparOption2 # <--- AJUSTADO para 5 bytes (option2)
        j loopLimparOption2
    retirarBarraNLinha2:
        sb $0, 0($t9)			#$t9[0] = 0
    fimLimparOption2:

    # Processar option3
    la $t9, option3
    li $t0, 0
    loopLimparOption3:
        lb $t8, 0($t9)		#$t8 = $t9[0]
        beq $t8, $0, fimLimparOption3		#if $t8 == 0 fimLimparOption3
        li $t7, 10				 # ASCII para '\n'
        beq $t8, $t7, retirarBarraNLinha3	#if $t8 == $t7 retirarBarraNLinha3
        addi $t9, $t9, 1		#$t9 = $t9 + 1
        addi $t0, $t0, 1		#$t0 = $t0 + 1
        bge $t0, 64, fimLimparOption3 # <--- AJUSTADO para 64 bytes (option3)
        j loopLimparOption3
    retirarBarraNLinha3:
        sb $0, 0($t9)			#$t9[0] = 0
    fimLimparOption3:

    # Processar option4
    la $t9, option4
    li $t0, 0
    loopLimparOption4:
        lb $t8, 0($t9)		#$t8 = $t9[0]
        beq $t8, $0, fimLimparOption4		#if $t8 == 0 fimLimparOption4
        li $t7, 10				 # ASCII para '\n'
        beq $t8, $t7, retirarBarraNLinha4	#if $t8 == $t7 retirarBarraNLinha4
        addi $t9, $t9, 1		#$t9 = $t9 + 1
        addi $t0, $t0, 1		#$t0 = $t0 + 1
        bge $t0, 32, fimLimparOption4 # <--- AJUSTADO para 32 bytes (option4)
        j loopLimparOption4
    retirarBarraNLinha4:
        sb $0, 0($t9)			#$t9[0] = 0
    fimLimparOption4:

    # NOVO: Processar option5
    la $t9, option5 # <--- $t9 é reutilizado para varrer option5
    li $t0, 0 # $t0 é reutilizado como contador de loop local
    loopLimparOption5:
        lb $t8, 0($t9)		#$t8 = $t9[0]
        beq $t8, $0, fimLimparOption5		#if $t8 == 0 fimLimparOption5
        li $t7, 10				 # ASCII para '\n'
        beq $t8, $t7, retirarBarraNLinha5	#if $t8 == $t7 retirarBarraNLinha5
        addi $t9, $t9, 1		#$t9 = $t9 + 1
        addi $t0, $t0, 1		#$t0 = $t0 + 1
        bge $t0, 16, fimLimparOption5 # <--- AJUSTADO para 16 bytes (option5)
        j loopLimparOption5
    retirarBarraNLinha5:
        sb $0, 0($t9)			#$t9[0] = 0
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
	beq $v0, 1, removerMorador	#if $v0 == 1, removerMorador

	la $a0, ad_auto			#$a0=ad_auto
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, adicionarAuto	#if $v0 == 1, adicionarAuto


	la $a0, rm_auto			#$a0=rm_auto
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, removerAuto		#if $v0 == 1, removerAuto

	la $a0, limpar_ap		#$a0=limpar_ap
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, limparApartamento	#if $v0 == 1, limparApartamento

	la $a0, info_ap			#$a0=info_ap
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, infoApartamento	#if $v0 == 1, infoApartamento

	la $a0, info_geral		#$a0=info_geral
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, infoGeral		#if $v0 == 1, infoGeral

	la $a0, salvar			#$a0=salvar
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, salvarDados		#if $v0 == 1, salvarDados

	la $a0, recarregar		#$a0=recarregar
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, recarregarDados	#if $v0 == 1, recarregarDados

	la $a0, formatar		#$a0=formatar
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, formatarSistema	#if $v0 == 1, formatarSistema

	la $a0, exit			#$a0=exit
	la $a1, option1			#$a1=option1
	jal compararStrings
	beq $v0, 1, encerrarPrograma	#if $v0 == 1, encerrarPrograma
	
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
		
		quebra_linha			#executa macro
		quebra_linha			#executa macro
		la $a0, pessoaAdicionadaSucesso	#$a0 = pessoaAdicionadaSucesso
		printString			#executa macro
		quebra_linha			#executa macro
		quebra_linha			#executa macro
		
		j programaPrincipal


removerMorador:
	la $a0, option2			#$a0 = option2
	printString			#executa macro
	quebra_linha			#executa macro
	j programaPrincipal

adicionarAuto:
	la $a0, option2			#$a0 = option2
	printString			#executa macro
	quebra_linha			#executa macro
	j programaPrincipal

removerAuto:
	la $a0, option2			#$a0 = option2
	printString			#executa macro
	quebra_linha			#executa macro
	j programaPrincipal

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

   	lw $t3, numApartamento 		#$t3 = numApartamento
	
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
    	printString		#executa macro
    	quebra_linha		#executa macro
    	quebra_linha		#executa macro

   	j programaPrincipal                  # Retorna ao menu principal
	
	

infoApartamento:
    la $a0, option2            #$a0 = option2
    printString            #executa macro
    quebra_linha            #executa macro

    la $t0, option2            #$t0 = option2
    lb $t1, 0($t0)            #$t1 = $t0[0]
    li $s1, 0            #$s1 = 0
    li $t3, 101            #$t3 = 101
    li $s0, 2            #

    li $t2, 'a'            #$t2 = a
    beq $t1, $t2, iniciarTodosAPs
    jal stringParaInt    #Transforma em Int
    move $t3, $v0
    li $s0, 1            #$s0 = 1

    j iniciarTodosAPs

    j programaPrincipal

infoGeral:

	la $a0, option2			#$a0 = option2
	printString			#executa macro
	quebra_linha			#executa macro
	
	
	la $a0, apartamentos
	addi $a0, $a0, 4                         #endereço da quantidade de pessoas do 1° apto
	li $t0, 0				#$t0 = 0
	li $t1, 40				#$t1 = 40
	li $t2, 0				#$t2 = 0 (contador de apto vazios)
	li $t6, 0				#$t6 = 0
	li $t7, 0				#$t7 = 0
	
    loopVerificarApartamentos:
	
 	beq $t0, $t1, imprimirResultadoInfoGeral	#if $t0 == $t1 imprimirResultadoInfoGeral
	lw $t4, 0($a0) 					#$t4 = $a0[0]
	beqz $t4, incrementarContagemAptosVazios	#if $t0 == 0 incrementarContagemAptosVazios
	
	continuaLoopVerificarAptos:
	
	addi $t0, $t0, 1			#incrementa 1 no $t1 (iterador)
	addi $a0, $a0, 428			#incrementa 428 no $a0
	
	j loopVerificarApartamentos
	
	   
    incrementarContagemAptosVazios:
	addi $t2, $t2, 1 				#$t2 = $t2 + 1
	
         j continuaLoopVerificarAptos
	   

    imprimirResultadoInfoGeral: 
   
	 	quebra_linha
	 	sub $t6, $t1, $t2			#AptosNaoVazios
	 	li $t5, 100				#$t5 = 100
	 	
	 	mul $t7, $t6, $t5
	 	div $t8, $t7, $t1			#PorcentagemAptosNaoVazios
	 	sub  $t7, $t5, $t8			#porcentagemAptosVazios
	 	
	 	la $a0, aptosNaoVazios			#$a0 = aptosNaoVazios
	 	printString				#executa macro
	 	move $a0, $t6				#$a0 = $t6
		printInt				#executa macro
		la $a0, aptosVaziosOuNaoP1		#$a0 = aptosVaziosOuNaoP1
		printString				#executa macro
		move $a0, $t8				#$a0 = $t8
		printInt				#executa macro
		la $a0, aptosVaziosOuNaoP2		#$a0 = aptosVaziosOuNaoP2
		printString				#executa macro
		
		quebra_linha				#executa macro
		quebra_linha				#executa macro
		
	 	la $a0, aptosVazios
	 	printString				#executa macro
	 	move $a0, $t2
	 	printInt				#executa macro
	 	la $a0, aptosVaziosOuNaoP1
		printString				#executa macro
	 	move $a0, $t7
	 	printInt				#executa macro
	 	la $a0, aptosVaziosOuNaoP2
		printString				#executa macro
		
		quebra_linha				#executa macro
		quebra_linha				#executa macro
	
      
	j programaPrincipal

salvarDados:
	la $a0, option2			#$a0 = option2
	printString			#executa macro
	quebra_linha			#executa macro

    quebra_linha			#executa macro

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
    printString				#executa macro
    quebra_linha			#executa macro
    
    j programaPrincipal                   # Retorna ao menu principal
    
    
   erroSalvar:

    quebra_linha		#executa macro

    li $v0, 16		     #fechando arquivo
    move $a0, $s0            # File descriptor
    syscall
    
    la $a0, msgErroSalvar
    printString				#executa macro
    quebra_linha			#executa macro
    
   j programaPrincipal                 # Retorna ao menu principal
    
	

recarregarDados:

	la $a0, option2			#$a0= option2
	printString			#executa macro
	quebra_linha			#executa macro
	
	quebra_linha			#executa macro

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

    li $v0, 16			#$v0 = 16
    move $a0, $s0            # File descriptor
    syscall

    la $a0, msgCarregadoSucesso		#$a0 = msgCarregadoSucesso
    printString				#executa macro
    quebra_linha			#executa macro
    
    j programaPrincipal                   # Retorna ao menu principal
    
    
  erroAbrirArquivo:

    quebra_linha			#executa macro
 
    la $a0, msgArquivoNaoEncontrado
    printString				#executa macro
    quebra_linha			#executa macro
    
    j programaPrincipal 
    

  erroLerArquivo:

    quebra_linha			#executa macro
 
    li $v0, 16			#fechando arquivo
    move $a0, $s0		#$a0 = $s0
    syscall
    
    la $a0, msgErroCarregar	#$a0 = msgErroCarregar
    printString			#executa macro
    quebra_linha			#executa macro
    
    j programaPrincipal
	

formatarSistema:

	la $a0, option2			#$a0 = option2
	printString			#executa macro
	quebra_linha			#executa macro
	
	
	quebra_linha			#executa macro

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
    printString				#executa macro
    quebra_linha			#executa macro
    quebra_linha			#executa macro

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
    mul $v0, $v0, 10		#$v0 = $v0 * 10
    add $v0, $v0, $t0		#$v0 = $v0 + $t0

    addi $a0, $a0, 1         #Avança para próximo caractere
    j loopStringInt

fimStringInt:
    jr $ra                   #Retorna




erroArgumentoFaltando:
	la $a0, argumentoFaltando
	printString			#executa macro
	j programaPrincipal

encerrarPrograma:
	la $a0, encerrandoPr		#$a0 = encerrandoPr
	printString			#executa macro
	encerrar			#executa macro


main:
	la $a0, escolherOpcao		#$a0 = escolherOpcao
	printString			#executa macro
	
	readInt				#executa macro
	move $t0, $v0			#$t0 = $v0
	
	li $t1, 1				#$t1 = 1
	#beq $t0, $t1, visualizarInformacoes	#if ($t0 == $t1) -> visualizarInformacoes
	li $t1, 2				#$t1 = 2
	#beq $t0, $t1, limparApto		#if ($t0 == $t1) -> limparApto
	li $t1, 3				#$t1 = 3
	#beq $t0, $t1, adicionarMorador		#if ($t0 == $t1) -> inserirPessoaApt
	li $t1, 4				#$t1 = 4
	#beq $t0, $t1, adicionarAutomovel	#if ($t0 == $t1) -> adicionarAutomovel
	li $t1, 5				#$t1 = 5
	#beq $t0, $t1, removerPessoaApt		#if ($t0 == $t1) -> removerPessoaApt
	li $t1, 6				#$t1 = 6
	#beq $t0, $t1, removerVeiculoApt		#if ($t0 == $t1) -> removerAutomovel
	li $t1, 7				#$t1 = 7
	#beq $t0, $t1, infoGeral			#if ($t0 == $t1) -> info_geral
	li $t1, 8				#$t1, 8
	#beq $t0, $t1, salvarDados		#if ($t0 == $t1) -> salvarDados
	li $t1, 9				#$t1, 9
	#beq $t0, $t1, carregarDados		#if ($t0 == $t1) -> carregarDados
	li $t1, 10				#$t1, 10
	#beq $t0, $t1, formatarDados		#if ($t0 == $t1) -> formatarDados
	li $t1, 11				#$t1 = 11
	#beq $t0, $t1, encerrarPrograma		#if ($t0 == $t1) -> encerrarPrograma
	
	la $a0, comandoInvalido
	printString			#executa macro
	
	j main				#volta pro main
	encerrar			#executa macro
	
	
visualizarInformacoes:
	la $a1, apartamentos		#$a1 = apartamentos
	li $t0, 1			#$t0 = 1
	quebra_linha			#executa macro
	
	verificarCadaApt:
		lw $t1, 0($a1)		#$t1 = $a1 [ 0 ] (vai somando 428 a cada iter.)
		move $a0, $t1		#$a0 = $t1
		printInt		#executa macro
		
		quebra_linha		#executa macro
		beq $t0, 40, main	#if ($t0 == 40) -> main
		
		addi $t0, $t0, 1	#iterando, $t0 = $t0 + 1
		addi $a1, $a1, 428	#iterando, $t0 = $t0 + 428
		
		j verificarCadaApt	#volta no loop
	
	j main			#pula para o main
	encerrar		#executa macro


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
		j main					#volta para o main
	
	apartamentoNaoEncontrado:
		quebra_linha				#executa macro
		la $a0, aptNumNaoEncontrado		#$a0 = aptNumNaoEncontrado
		printString				#executa macro
		quebra_linha				#executa macro
		j main					#volta para o main
	
	encerrar
	
	

removerPessoaApt:
	quebra_linha			#executa macro
	la $a0, digiteNumApartamento	#$a0 = digiteNumApartamento
	printString			#executa macro
	
	readInt				#executa macro
	add $t3, $0, $v0		#$t3 = $0 + $v0
	
	jal buscarApartamentoCondominio	#faz a busca
	
	move $a0, $t3			#$a0 = $t3
	printInt			#executa macro
	
	lw $t4, indiceApartamento	#$t4 = indiceApartamento (indice memória, ex: 0, 428, 856...)

	bltz $t4, removerPessoaApt	#se $t4 < 0, volta para o loop
	
	la $a0, digiteNomePessoaApt	#$a0 = digiteNomePessoaApt
	printString			#executa macro
	
	li $v0, 8			#chama serviço de ler string
	la $a0, nomePessoa		#nomePessoa = $a0
	la $a1, 64			#$a1 = 64
	syscall				#executa leitura
	
	addi $t4, $t4, 8		#$t4 = $t4 + 8, aonde começa os nomes das pessoas
	
	la $a0, apartamentos		#$a0 = apartamentos
	la $a1, nomePessoa		#$a1 = nomePessoa
	
	add $a0, $a0, $t4		#$a0 = $a0 + $t4
	
	li $t2, 0			#$t2 = 0
	
	
	removerPessoaApartamento:
		li $t3, 320			#$t2 = 320
		add $a0, $a0, $t2		#$a0 = $a0 + $t2
		li $t5, 0			#$t5 = 0
		
	loopBuscarRemPessoaApt:
		lb $t0, 0($a0)			#$t0 = $a0[i]
		lb $t1, 0($a1)			#$t1 = $a1[i]
		
		bne $t0, $t1, nomesDiferentesRem	#if ($t0 != $t1) -> nomesDiferentesRem
		beq $t0, $0, nomesIguaisRem		#if ($t0 == \0) -> nomesIguaisRem
		
		addi $a0, $a0, 1		#$a0 = $a0 + 1
		addi $a1, $a1, 1		#$a1 = $a1 + 1
		addi $t5, $t5, 1		#$t5 = $t5 + 1
		
		j loopBuscarRemPessoaApt	#volta loop
	
	j main
	
nomesDiferentesRem:
	beq $t2, $t3, pessoaNaoExisteRem	#if ($t2 == $t3) -> pessoaNaoExisteRem

	sub $a0, $a0, $t5	#$a0 = $a0 - $t5
	sub $a1, $a1, $t5	#$a1 = $a1 - $t5
	addi $t2, $t2, 64	#$t2 = $t2 + 64
	j removerPessoaApartamento

nomesIguaisRem:
	quebra_linha		#executa macro

	sw $t2, indicePessoa	#indicePessoa = $t2 (é o índice referente ao apartamento, ent começa 0, 64, 128...)
		
	lw $t0, indicePessoa	#$t0 = indicePessoa 
	lw $t1, indiceApartamento #$t1 = indiceApartamento 

	la $a0, apartamentos	#$a0 = apartamentos
	add $a0, $a0, $t1	#$a0 = $a0 + $t1

	lw $t2, 4($a0)		#$t2 = $a0[4] (qtd pessoas)

	addi $t3, $a0, 8	#$t3 = $a0 + 8 (offset que inicia as pessoas)
	add  $t3, $t3, $t0	#$t3 = $t3 + $t0 (endereço da pessoa a ser removida)

	subi $t4, $t2, 1	#$t4 = $t2 - 1 (quantidade -1)
	mul  $t4, $t4, 64	#$t4 = $t4 * 64
	addi $t5, $a0, 8	#$t5 = $a0 + 8 (início da lista de pessoas)
	add  $t5, $t5, $t4	#$t5 = $t5 + $t4 (end da última pessoa)

	li $t6, 0		#iterador
	li $t7, 64		#iterador

	loopLimparBytesPessoa:
		beq $t6, $t7, pessoaRemovidaSuc 	#if ($t6 == $t7) -> pessoaRemovidaSuc
	
		sb $0, 0($t3)		#$t3[i] = 0 (limpeza)
		
    		addi $t3, $t3, 1	#$t3 = $t3 + 1
		addi $t6, $t6, 1	#$t6 = $t6 + 1
		
	j loopLimparBytesPessoa
		
	pessoaRemovidaSuc:
	addi $t3, $a0, 8	#$t3 = $a0 + 8
    	add  $t3, $t3, $t0	#$t3 = $t3 + $t0

	addi $t9, $a0, 8	#$t9 = $a0 + 8
	add  $t9, $t9, $t4	#$t9 = $t9 + $t4

    	li $t6, 0		#iterador
	li $t8, 64		#iterador
	
	moverPessoaParaPosRem:
    		beq $t6, $t8, concluirRemocaoPessoa	#if ($t6 == $t8) -> concluirRemocaoPessoa

    		lb $t7, 0($t5)		#$t7 = $t5[i]
    		sb $t7, 0($t3)		#$t3[i] = $t7

    		addi $t3, $t3, 1	#$t3 = $t3 + 1
    		addi $t5, $t5, 1	#$t5 = $t5 + 1
    		addi $t6, $t6, 1	#$t6 = $t6 + 1

	j moverPessoaParaPosRem
	
	concluirRemocaoPessoa:

	subi $t2, $t2, 1	#$t2 = $t2 - 1
	sw $t2, 4($a0)		#$a0[4] = $t2

	li $t6, 0		#$t6 = 0
	li $t7, 64		#$t7 = 64

	limparUltimaPessoa:
	beq $t6, $t7, pessoaRemocaoConcluida	#if ($t6 == $t7) -> pessoaRemocaoConcluida

	sb $0, 0($t9)		#$t5[i] = \0
	addi $t9, $t9, 1	#$t5 = $t5 + 1
	addi $t6, $t6, 1	#$t6 = $t6 + 1

	j limparUltimaPessoa	#volta loop

pessoaRemocaoConcluida:
	la $a0, pessoaExiste	#$a0 = pessoaExiste
	printString		#executa macro
	quebra_linha		#executa macro
	
	j main			#volta para o main
	
pessoaNaoExisteRem:
	la $a0, pessoaNaoExiste	#$a0 = pessoaNaoExiste
	printString		#executa macro
	quebra_linha		#executa macro
	j main			#volta para o main

apartamentoEstaCheio:
	quebra_linha		#executa macro
	la $a0, aptCheio	#$a0 = aptCheio
	printString		#executa macro
	quebra_linha		#executa macro
	quebra_linha		#executa macro
	j main

adicionarAutomovel:

	quebra_linha			#executa macro
	la $a0, digiteNumApartamento	#$a0 = digiteNumApartamento
	printString			#executa macro
	
	readInt				#executa macro
	add $t3, $0, $v0		#$t3 = $0 + $v0
	
	jal buscarApartamentoCondominio	#faz a busca
	
	move $a0, $t3			#$a0 = $t3
	printInt			#executa macro
	
	lw $t4, indiceApartamento	#$t4 = indiceApartamento (indice memória, ex: 0, 428, 856...)
	quebra_linha			#executa macro
	
	bltz $t4, adicionarAutomovel	#se $t4 < 0, volta para o loop
	
	la $a0, apartamentos		#$a0 = apartamentos
	add $a0, $a0, $t4
	
	lw $t8, 4($a0)			#$t8 = quantidadePessoasApto
	
	beqz $t8, semMoradoresSemVeiculos	#se $t8 = 0
	
	la $a0, apartamentos		#$a0 = apartamentos
	addi $t4, $t4, 328		#$t4 = $t4 + 328
	add $a0, $a0, $t4		#$a0 = $a0 + $t4
	lw $t5, 0($a0)			#$t5 = $a0[i] (carrega em t5 o valor que está na posicao de a0)
	
	move $a0, $t5
	printInt
	
	li $t6, 3			#$t6 = 3
	beq $t5, $t6, apartamentoNaoPodeTerVeiculo	#if ($t5 == 3) -> apartamentoNaoPodeTerVeiculo
	
	li $t6, 2			#$t6 = 2
	beq $t5, $t6, apartamentoNaoPodeTerVeiculo	#if ($t5 == 2) -> apartamentoNaoPodeTerVeiculo
	
       loopInserirTipoVeiculo:
	quebra_linha			#executa macro
	la $a0, digiteTipoVeiculo	#$a0 = digiteTipoVeiculo
	printString			#executa macro
	
	li $v0, 8                       #$v0 = 8
	la $a0, tipoVeiculo		#$a0 = tipoVeiculo
	la $a1, 10 			#$a1 = 10
	syscall
	
	quebra_linha
	
	lb $t3, tipoVeiculo			#$t3 = tipoVeiculo
	
	la  $t7, 0x63			#t7 = 'c'
	beq $t3, $t7, inserirCarro	#if ($t3 == 'c') -> inserirCarro
	
	la $t7, 0x6D			#t7 = 'm'
	beq $t3, $t7, inserirMoto	#if ($t3 == 'm') -> inserirMoto
	
	la $a0, tipoVeiculoInvalido	#$a0 = tipoVeiculoInvalido
	printString			#executa macro
	
	  j loopInserirTipoVeiculo		#redireciona para adicionarAutomovel


semMoradoresSemVeiculos:
	
	quebra_linha			#executa macro
	la $a0, msgNaoExisteMoradores
	printString			#executa macro
	quebra_linha			#executa macro
	
	j main
	
inserirCarro:
	quebra_linha			#executa macro
	
	bnez  $t5, apartamentoNaoPodeTerCarro	#if ($t5 != 0) -> apartamentoNaoPodeTerCarro
	
	la $a0, digiteModeloCarro	#$a0 = digiteModeloVeiculo
	printString			#executa macro
	
	li $v0, 8			#chama serviço de ler string
	la $a0, modeloVeiculo		#modeloVeiculo = $a0
	la $a1, 32			#$a1 = 32
	syscall				#executa leitura
	
	la $t1, modeloVeiculo		#$t1 = modeloVeiculo
	la $a0, apartamentos		#$a0 = apartamentos
	
	addi $t4, $t4, 4                #$t4 =  $t4 + 4 (endereço de memória do inicío de modelo)
	add $a0, $a0, $t4		#$t0 = $t0 + $t4
	
	jal loopInserirModeloVeiculo
	
	quebra_linha			#executa macro
	
	la $a0, digiteCorCarro	#$a0 = digiteCorCarro
	printString			#executa macro
	
	li $v0, 8			#chama serviço de ler string
	la $a0, corVeiculo		#corVeiculo = $a0
	la $a1, 16			#$a1 = 16
	syscall				#executa leitura
	
	la $t1, corVeiculo		#$t1 = modeloVeiculo
	la $a0, apartamentos		#$a0 = apartamentos
	
	addi $t4, $t4, 64               #$t4 = 64 (endereço de memória do inicío de cor/332+64 = 396)
	add $a0, $a0, $t4		#$a0 = $a0 + $t4 
	
	jal loopInserirCorVeiculo
	
	la $a0, apartamentos		#$$a0 = apartamentos
	subi $t4, $t4, 68		#$t4 = $t4 - 68 (posição do InteiroVeiculo)
	add $a0, $a0, $t4		#$$a0 = $t4
	li $t0, 3               	# $t0 = 3
	sw $t0, 0($a0)                	# a posição na memória $a0 (posição do inteiroVeiculo) recebe o valor 3
		
	la $a0, carroAdicionadoSucesso	#$a0 = carroAdicionadoSucesso
	printString			#executa macro
	quebra_linha			#executa macro
	
	        j main
		

inserirMoto:
	quebra_linha			#executa macro
	
	mul $t7, $t5, 32		#$t7 = $t5 * 32
	addi $t7, $t7, 332		#$t7 = $t7 + 332
	#Em $t7 está o índice em memória que deve ficar (iniciar) o nome do modelo a ser inserido
	
	#depuração
	add $a0, $0, $t7		
	printInt
	#fim dep
	
	quebra_linha			#executa macro
	
	la $a0, digiteModeloMoto	#$a0 = digiteModeloMoto
	printString			#executa macro
	
	li $v0, 8			#chama serviço de ler string
	la $a0, modeloVeiculo		#modeloVeiculo = $a0
	la $a1, 32			#$a1 = 32
	syscall				#executa leitura
	
	lw $t0, indiceApartamento	#$t0 = indiceApartamento (valor em memória, exemplo: apt 1 começa no 428)
	la $t1, modeloVeiculo		#$t1 = modeloVeiculo
	la $a0, apartamentos		#$a0 = apartamentos
	
	add $a0, $a0, $t0		#$a0 = $a0 + $t0
	add $a0, $a0, $t7		#$t0 = $t0 + $t7
	
	jal loopInserirModeloVeiculo
	
	
		lw $t0, indiceApartamento	#$t0 = indiceApartamento (valor em memória, exemplo: apt 1 começa no 428)
		la $a0, apartamentos		#$a0 = apartamentos
	
		add $a0, $a0, $t0		#$a0 = $a0 + $t0
		addi $a0, $a0, 328		#$a0 = $a0 + 328
	
		mul $t7, $t5, 16		#$t7 = $t5 * 16
		addi $t7, $t7, 396		#$t7 = $t7 + 396
		#Em $t7 está o índice em memória que deve ficar (iniciar) o nome da cor a ser inserida

quebra_linha			#executa macro
	
	la $a0, digiteCorMoto	#$a0 = digitecorVeiculoApt
	printString			#executa macro
	
	li $v0, 8			#chama serviço de ler string
	la $a0, corVeiculo		#modeloVeiculo = $a0
	la $a1, 16			#$a1 = 16
	syscall				#executa leitura
	
	lw $t0, indiceApartamento	#$t0 = indiceApartamento (valor em memória, exemplo: apt 1 começa no 428)
	la $t1, corVeiculo		#$t1 = corVeiculo
	la $a0, apartamentos		#$a0 = apartamentos
	
	add $a0, $a0, $t0		#$a0 = $a0 + $t0
	add $a0, $a0, $t7		#$t0 = $t0 + $t7
	
	jal loopInserirCorVeiculo
	
	la $a0, apartamentos		#$a0 = apartamentos
	lw $t4, indiceApartamento	#$t4 = indiceApartamento 
	addi $t4, $t4, 328		#$t4 = 328 (posição do inteiroVeiculo)
	add $a0, $a0, $t4		#$a0 = $t4
		
	lw $t0, 0($a0)			#$t0 = valor no endereço #$a0 (inteiroVeiculo)
	addi $t0, $t0, 1		#$t0 = $t0 + 1
	sw $t0, 0($a0)                	# a posição na memória $a0 (posição do inteiroVeiculo) recebe o valor em $t0, atualizado 
		
	la $a0, motoAdicionadaSucesso	#$a0 = motoAdicionadaSucesso
	printString			#executa macro
	quebra_linha			#executa macro
	
	   j main




loopInserirModeloVeiculo:

	lb $t2, 0($t1)				#$t1[0] = $t2 
	beqz  $t2, continuaInserindoCorVeiculo	#if ($t2 == 0) -> continuaInserirVeiculo
	
	sb $t2, 0($a0)		#$a0[0] = $t2
		
	addi $t1, $t1, 1	#$t1 = $t1 + 1
	addi $a0, $a0, 1	#$a0 = $a0 + 1
		
	 j loopInserirModeloVeiculo
	 
	 continuaInserindoCorVeiculo:
	 	jr $ra
	 
	 
	 
loopInserirCorVeiculo:

	lb $t2, 0($t1)				#$t1[0] = $t2 
	beqz  $t2, fimInserirVeiculo	#if ($t2 == 0) -> continuaInserirCarro
	
	sb $t2, 0($a0)		#$a0[0] = $t2
		
	addi $t1, $t1, 1	#$t1 = $t1 + 1
	addi $a0, $a0, 1	#$a0 = $a0 + 1
		
	  j loopInserirCorVeiculo	#volta loop
	  
	fimInserirVeiculo:
	  jr $ra
	   
	      
apartamentoNaoPodeTerVeiculo:
	quebra_linha			#executa macro
	la $a0, aptoNaoPodeTerVeiculo	#$a0 = aptoJaTemCarro
	printString			#executa macro
	quebra_linha			#executa macro
	quebra_linha			#executa macro
	j main

apartamentoNaoPodeTerCarro:
	quebra_linha			#executa macro
	la $a0, aptoNaoPodeTerCarro	#$a0 = aptoNaoPodeTerCarro
	printString			#executa macro
	quebra_linha			#executa macro
	quebra_linha			#executa macro
	j main

removerVeiculoApt:
	quebra_linha			#executa macro
	la $a0, digiteNumApartamento	#$a0 = digiteNumApartamento
	printString			#executa macro
	
	readInt				#executa macro
	add $t3, $0, $v0		#$t3 = $0 + $v0
	
	jal buscarApartamentoCondominio	#faz a busca
	
	move $a0, $t3			#$a0 = $t3
	printInt			#executa macro
	quebra_linha			#executa macro
	
	lw $t4, indiceApartamento	#$t4 = indiceApartamento (indice memória, ex: 0, 428, 856...)

	bltz $t4, removerVeiculoApt	#se $t4 < 0, volta para o loop
	
	la $a0, digiteModeloVeiculo	#$a0 = digiteModeloVeiculo
	printString			#executa macro
	
	li $v0, 8			#chama serviço de ler string
	la $a0, modeloVeiculo		#modeloVeiculo = $a0
	la $a1, 32			#$a1 = 32
	syscall				#executa leitura
	
	
	la $a0, digiteCorVeiculo	#$a0 = digiteCorVeiculo
	printString			#executa macro
	
	li $v0, 8			#chama serviço de ler string
	la $a0, corVeiculo		#corVeiculo = $a0
	la $a1, 16			#$a1 = 16
	syscall				#executa leitura
	
	lw $t4, indiceApartamento	#$t4 = indiceApartamento (indice memória, ex: 0, 428, 856...)
	addi $t4, $t4, 332		#$t4 = $t4 + 332, aonde começa os modelos dos veículos
	addi $t5, $t4, 64		#$t5 = $t4 + 64 (onde as cores começam)
	
	la $a0, apartamentos		#$a0 = apartamentos
	la $a1, modeloVeiculo		#$a1 = modeloVeiculo
	la $a2, corVeiculo		#$a2 = corVeiculo
	
	add $a3, $a0, $t5		#$a3 = $a0 + $t5
	add $a0, $a0, $t4		#$a0 = $a0 + $t4
	
	li $t2, 0			#$t2 = 0
	li $t7, 0			#$t7 = 0
	li $t3, 64			#$t3 = 64 (Espaço ocupado por todos os modelos)
	
	removerModeloApartamento:
		add $a0, $a0, $t2		#$a0 = $a0 + $t2
		li $t6, 0			#t6 = 0
	
	loopBuscarRemModeloApt:
		lb $t0, 0($a0)			#$t0 = $a0[i]
		lb $t1, 0($a1)			#$t1 = $a1[i]
		
		bne $t0, $t1, veiculosDiferentesRem	#if ($t0 != $t1) -> ModelosDiferentesRem
		beq $t0, $0, modelosIguaisRem		#if ($t0 == \0) -> modelosIguaisRem
		
		addi $t6, $t6, 1		#$t6 = $t6 + 1
		addi $a0, $a0, 1		#$a0 = $a0 + 1
		addi $a1, $a1, 1		#$a1 = $a1 + 1
		
		j loopBuscarRemModeloApt	#volta loop
	
veiculosDiferentesRem:
	addi $t2, $t2, 32			#$t2 = $t2 + 32
	beq $t2, $t3, veiculoNaoExisteRem	#if ($t2 == $t3) -> veiculoNaoExisteRem
	addi $t7, $t7, 1			#$t7 = $t7 + 1
	sub $a0, $a0, $t6			#$a0 = $a0 - $t5
	sub $a1, $a1, $t6			#$a1 = $a1 - $t5
	j removerModeloApartamento
	
modelosIguaisRem:
	sub $a0, $a0, $t6			#$a0 = $a0 - $t5
	sub $a1, $a1, $t6			#$a1 = $a1 - $t5
	mul $t7, $t7, 16			#$t7 = $t7 * 16
	add $a3, $a3, $t7
	li $t6, 0				#$t6 = 0
	
	loopBuscarRemCorApt:
	lb $t0, 0($a3)				#$t0 = $a3[i]
	lb $t1, 0($a2)				#$t1 = $a2[i]
	
	bne $t0, $t1, coresDiferentesRem		#if ($t0 != $t1) -> coresDiferentesRem
	beq $t0, $0, veiculosIguaisRem			#if ($t0 == \0) -> veiculosIguaisRem
	
	addi $t6, $t6, 1		#$t6 = $t6 + 1
	addi $a2, $a2, 1		#$a2 = $a2 + 1
	addi $a3, $a3, 1		#$a3 = $a3 + 1
	
	j loopBuscarRemCorApt
	
	coresDiferentesRem:
	sub $a2, $a2, $t6			#$a0 = $a0 - $t5
	sub $a3, $a3, $t6			#$a1 = $a1 - $t5
	li $t6, 0				#$t6 = 0
	li $t7, 0				#$t7 = 0
	j veiculosDiferentesRem

	
veiculosIguaisRem:
		la $a0, apartamentos		#$a0 = apartamentos
		lw $t1, indiceApartamento	#$t1 = indiceApartamento
		add $a0, $a0, $t1		#$a0 = $a0 + $t1
		lw $s0, 328($a0)		#$s0 = $a0[328] (inteiroVeiculo)
		li $t0, 2				#$t0 = 2
		bne $s0, $t0, limparBytesVeiculo	#Checa se há 2 motos
		bnez $t2, limparBytesVeiculo	#Checa se a moto excluida foi a segunda
		li $t2, 32
		li $t7, 16
		addi $t0, $a0, 332			#$t0 = $a0 + 332 (Modelo posição 1)
		addi $t1, $a0, 364			#$t1 = $a0 + 364 (Modelo posição 2)
		li $t6, 0				#$t2 = 0
		
	moverModeloVeiculoPosRem:
		beq $t6, $t2, moverModeloVeiculoConcluido	#if ($t6 == $t2) -> moverModeloVeiculoConcluido

    		lb $t8, 0($t1)		#$t8 = $t1[i]
    		sb $t8, 0($t0)		#$t0[i] = $t8

    		addi $t0, $t0, 1	#$t0 = $t0 + 1
    		addi $t1, $t1, 1	#$t1 = $t1 + 1
    		addi $t6, $t6, 1	#$t6 = $t6 + 1

	j moverModeloVeiculoPosRem
	
	moverModeloVeiculoConcluido:
	li $t6, 0			#$t6 = 0
	addi $t0, $t0, 32		#$t0 = $t0 + 32
	addi $t1, $t1, 16		#$t1 = $t1 + 16

	moverCorVeiculoPosRem:
		beq $t6, $t7, limparBytesVeiculo	#Continua após mover cor
		
		lb $t8, 0($t1)		#$t8 = $t1[i]
		sb $t8, 0($t0)		#$t0[i] = $t8

    		addi $t0, $t0, 1	#$t0 = $t0 + 1
    		addi $t1, $t1, 1	#$t1 = $t1 + 1
    		addi $t6, $t6, 1	#$t6 = $t6 + 1
		j moverCorVeiculoPosRem
		
	limparBytesVeiculo:
	quebra_linha			#executa macro
	la $a0, apartamentos		#$a0 = apartamentos
	lw $t1, indiceApartamento	#$t1 = indiceApartamento
	add $a0, $a0, $t1		#$a0 = $a0 + $t1
	addi $t0, $a0, 332		#$t0 = $a0 + 332 
	add $t0, $t0, $t2		#$t0 = $t0 + $t2 (Posição modelo)
	addi $t1, $a0, 396		#$t1 = $a0 + 396
	add $t1, $t1, $t7		#$t1 = $t1 + $t7 (Posição cor)
	li $t6, 0			#$t6 = 0
	li $t7, 32			#$t7 = 32
	
	loopLimparBytesVeiculo:
		beq $t6, $t7, byteRemovidoSuc 	#if ($t6 == $t7) -> pessoaRemovidaSuc
	
		sb $0, 0($t0)		#$t0[i] = 0 (limpeza)
		
    		addi $t0, $t0, 1	#$t0 = $t0 + 1
		addi $t6, $t6, 1	#$t6 = $t6 + 1
		
	j loopLimparBytesVeiculo
	
	byteRemovidoSuc:
	beq $t7, 16, corRemovidaSuc
		li $t6, 0			#$t6 = 0
		li $t7, 16			#$t7 = 16
		move $t0, $t1			#$t0 = $t1
		j loopLimparBytesVeiculo
	
	corRemovidaSuc:
	lw $s0, 328($a0)		#$s0 = $a0[328] (inteiroVeiculo)
	li $t6, 3			#$t6 = 3
	bne $s0, $t6, removeMoto	#$identifica se é carro ou moto
	li $s0, 1
	removeMoto:
	subi $s0, $s0, 1		#$s0 = $s0 - 1
	sw $s0, 328($a0)		#Nomo inteiroVeiculo		

veiculoRemocaoConcluida:
	la $a0, veiculoRemovido	#$a0 = pessoaExiste
	printString		#executa macro
	quebra_linha		#executa macro
	
	j main			#volta para o main
	
veiculoNaoExisteRem:
	la $a0, veiculoNaoExiste	#$a0 = pessoaNaoExiste
	printString		#executa macro
	quebra_linha		#executa macro
	j main			#volta para o main
	
	

	
	
	


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
			beq $t0, $t1, concluiAptEncontrado	#if $t0 == $t1 concluiAptEncontrado
			lw $t3, 0($a0)				#$t3 = $a0[0]
			beq $t3, $t2, retornaIndiceApt
			
			addi $t0, $t0, 4			#$t0 = $t0 + 4
			addi $a0, $a0, 4			#$a0 = $a0 + 4
			
			j loopIndiceApt
		
		retornaIndiceApt:
			sw $t0, indiceApartamento		#indiceApartamento = $t0
		
		concluiAptEncontrado:
		jr $ra					#volta para inserirPessoaApt
	
	apartamentoNaoEncontradoC:
		quebra_linha				#executa macro
		la $a0, aptNumNaoEncontrado		#$a0 = aptNumNaoEncontrado
		printString				#executa macro
		li $t0, -1				#$t0 = -1
		sw $t0, indiceApartamento		#indiceApartamento = -1
		quebra_linha				#executa macro
		jr $ra					#Volta para $ra
		#j inserirPessoaApt			#volta para inserirPessoaApt no começo
	
	
infoCadastradaApartamento:
	li $s1, 0			#$s1 = 0
	li $t3, 101			#$t3 = 101
	quebra_linha			#executa macro
	la $a0, qtdAP		#$a0 = qtdAp
	printString			#executa macro
	quebra_linha			#executa macro
	readInt				#executa macro
	add $s0, $0, $v0		#$s0 = $0 + $v0
	li $t0, 2			#$v0 = 2
	quebra_linha			#executa macro
	beq $s0, $t0, iniciarTodosAPs	#if $s0 == $t0 iniciarTodosAPs
	
	la $a0, digiteNumApartamento	#$a0 = digiteNumApartamento
	printString			#executa macro
	readInt				#executa macro:
	add $t3, $0, $v0		#$t3 = $0 + $v0
	iniciarTodosAPs:
	jal buscarApartamentoCondominio	#faz a busca
	
	move $a0, $t3			#$a0 = $t3
	
	lw $t4, indiceApartamento	#$t4 = indiceApartamento (indice memória, ex: 0, 428, 856...)
	quebra_linha			#executa macro
	la $a1, apartamentos		#$a1 = apartamentos
	add $a1, $a1, $t4		#$a1 = $a1 + $t4
	todosAPs:
	li $t2, 64			#$t2 = 64
	
	loopVerificarInfoApartamento:
		la $a0, textAP		#$a0 = textAP
		printString		#executa macro
		lw $a0,	0($a1)		#$a0 = $a1[0] (Nº AP)
		printInt		#executa macro
		quebra_linha		#executa macro
		
		lw $t4, 4($a1)		#$t4 = $a1[4]
		addi $a1, $a1, 8	#$a1 = $a1 + 8
		beq $t4, 0, naoHaMoradoresApartamento	#if ($t4 == 0) -> naoHaMoradoresApt
		bne $t4, 0, temMoradoresApartamento	#if ($t4 != 0) -> temMoradoresApt
		
		naoHaMoradoresApartamento:
			la $a0, textNaoTemMoradores
			printString		#executa macro
			quebra_linha		#executa macro
			j verificarVeiculosApartamento	#vai para verificarVeiculosApt
		
		temMoradoresApartamento:
		la $a0, textMoradores	#$a0 = textMoradores
		printString		#executa macro
		quebra_linha		#executa macro
		tab			#executa macro
		li $t3, 0		#$t3 = 0 (iterador)
		la $t5, nomePessoa	#$t5 = nomePessoa
		li $t6, 0		#$t6 = 0 (contador de pessoas (1, 2, .. 5)
		
		loopNomeMoradorApartamento:
			lb $t0, 0($a1)		#$t0 = $a1[i]
			sb $t0, 0($t5)		#$t5[i] = $t0
			
			beq $t3, $t2, proximoMoradorApartamento	#if ($t3 == $t2) -> proximoMorador
			
			addi $a1, $a1, 1	#$a1 = $a1 + 1
			addi $t3, $t3, 1	#$t3 = $t3 + 1
			addi $t5, $t5, 1	#$t5 = $t5 + 1
			
			j loopNomeMoradorApartamento	#loopNomeMorador
		
		proximoMoradorApartamento:
			addi $t6, $t6, 1	#$t6 = $t6 + 1
			la $a0, nomePessoa	#$a0 = nomePessoa
			printString		#executa macro
			la $t5, nomePessoa	#$t5 = nomePessoa
			add $t3, $0, $0		#$t3 = 0
			beq $t6, $t4, verificarVeiculosApartamento	#if($t6 == $t4) -> verificarVeiculosApt
			tab			#executa macro
			j loopNomeMoradorApartamento	#volta loopNomeMorador
		
		
	verificarVeiculosApartamento:
		li $t5, 5			#$t5 = 5
		sub $t5, $t5, $t4		#$t5 = $t5 - $t4
		mul $t5, $t5, 64		#$t5 = $t5 * 64
		add $a1, $a1, $t5		#$a1 = $a1 + $t5
		quebra_linha			#executa macro

		
		
		lw $t3, 0($a1)			#se (0 - nada; 1 - uma moto; 2 - duas motos; 3 - um carro)
		li $t4, 0			#$t4 = 0
		beq $t3, $t4, naoExisteVeiculoApartamento	#if ($t3 == $t4) -> naoExisteVeiculoApt
		addi $a1, $a1, 4		#$a1 = $a1 + 4
		j imprimirVeiculoApt
		
		
	
	naoExisteVeiculoApartamento:
		addi $a1, $a1, 100		#$a1 = $a1 + 100
		j verificarFinalApartamento	#vai para verificarFinalApt
	
	imprimirVeiculoApt:
		li $t2, 32		#$t2 = 32
		li $t4, 0		#$t3 = 0 (iterador)
		la $t5, modeloVeiculo	#$t5 = modeloVeiculo
		li $t6, 0		#$t6 = 0 (contador de pessoas (1, 2, .. 5)
		
		loopImprimirVeiculoApt:
			beq $t4, $t2, continuaLoopImprimirVeiculo	#if ($t3 == $t2) -> proximoMorador
			lb $t0, 0($a1)		#$t0 = $a1[i]
			sb $t0, 0($t5)		#$t5[i] = $t0
			
			addi $a1, $a1, 1	#$a1 = $a1 + 1
			addi $t4, $t4, 1	#$t3 = $t3 + 1
			addi $t5, $t5, 1	#$t5 = $t5 + 1
			
			j loopImprimirVeiculoApt	#loopImprimirVeiculoApt
			
		continuaLoopImprimirVeiculo:
		li $t4, 32			#$t3 = 32
		bne $t2, $t4, concluiLoopImprimirVeiculo		#if ($t2 != $t3) -> concluiLoopImprimirVeiculo
		li $t2, 16			#$t2 = 16
		li $t4, 0			#$t3 = 0
		la $t5, corVeiculo		#$t5 = corVeiculo
		addi $a1, $a1, 32		#$a1 = $a1 + 32
		j loopImprimirVeiculoApt
		
		concluiLoopImprimirVeiculo:
		li $t4, 3			#$t4 = 3
		beq $t3, $t4, imprimeCarro	#Identifica se é carro
		la $a0, textMoto		#$a0 = textMoto
		j continuaImprimirVeiculo
		imprimeCarro:
		la $a0, textCarro		#$a0 = textCarro
		j continuaImprimirVeiculo
		continuaImprimirVeiculo:
		printString			#executa macro
		quebra_linha			#executa macro
		tab				#executa macro
		la $a0, textModeloVeiculo	#$a0 = textModeloVeiculo
		printString			#executa macro
		la $a0, modeloVeiculo		#$a0 = $a1[0] Modelo carro
		printString			#executa macro
		tab				#executa macro
		la $a0, textCorVeiculo		#$a0 = textCorVeiculo
		printString			#executa macro
		la $a0,corVeiculo		#$a0 = corVeiculo
		printString			#executa macro
		quebra_linha			#executa macro
		li $t4, 2			#$t4 = 2
		beq $t3, $t4, imprimirMotoApt
		addi $a1, $a1, 16		#$a1 = $a1 + 96
		j verificarFinalApartamento	#vai para verificarFinalApt
		
	imprimirMotoApt:
		subi $a1, $a1, 48
		li $t2, 32		#$t2 = 32
		li $t4, 0		#$t3 = 0 (iterador)
		la $t5, modeloVeiculo	#$t5 = modeloVeiculo
		li $t6, 0		#$t6 = 0 (contador de pessoas (1, 2, .. 5)
		
		loopImprimirMotoApt:
			beq $t4, $t2, continuaLoopImprimirMoto	#if ($t3 == $t2) -> proximoMorador
			
			lb $t0, 0($a1)		#$t0 = $a1[i]
			sb $t0, 0($t5)		#$t5[i] = $t0
			
			
			addi $a1, $a1, 1	#$a1 = $a1 + 1
			addi $t4, $t4, 1	#$t3 = $t3 + 1
			addi $t5, $t5, 1	#$t5 = $t5 + 1
			
			j loopImprimirMotoApt	#loopImprimirCarro
			
		continuaLoopImprimirMoto:
		li $t4, 32			#$t3 = 32
		bne $t2, $t4, concluiLoopImprimirMoto		#if ($t2 != $t3) -> concluiLoopImprimirCarro
		li $t2, 16			#$t2 = 16
		li $t4, 0			#$t3 = 0
		la $t5, corVeiculo		#$t5 = corVeiculo
		addi $a1, $a1, 16		#$a1 = $a1 + 16
		j loopImprimirMotoApt
		
		concluiLoopImprimirMoto:

		quebra_linha			#executa macro
		tab				#executa macro
		la $a0, textModeloVeiculo	#$a0 = textModeloVeiculo
		printString			#executa macro
		la $a0, modeloVeiculo		#$a0 = $a1[0] Modelo carro
		printString			#executa macro
		tab				#executa macro
		la $a0, textCorVeiculo		#$a0 = textCorVeiculo
		printString			#executa macro
		la $a0,corVeiculo		#$a0 = corVeiculo
		printString			#executa macro
		quebra_linha			#executa macro
		j verificarFinalApartamento	#vai para verificarFinalApt
	
	verificarFinalApartamento:
		quebra_linha			#executa macro
		addi $s1, $s1, 1		#$s1 = $s1 + 1
		li $t0, 2			#$t0 = 2
		bne $s0, $t0, finalizaVisualizarInformacoes	#checa se foi selecianada a opção "all"
		li $t0, 40			#$t0 = 40
		beq $s1, $t0, finalizaVisualizarInformacoes	#checa se já passou pelos 40
		j todosAPs			#retorna ao loop
		finalizaVisualizarInformacoes:	#finaliza
		j programaPrincipal
	

verificarInfoApartamentos:
	la $a1, apartamentos		#$a1 = apartamentos
	li $t0, 428			#$t0 = 428
	li $t1, 0			#$t1 = 0
	li $t2, 64			#$t2 = 64
	
	loopVerificarInfoApt:
		la $a0, textApt		#$a0 = textApt
		printString		#executa macro
		lw $t4, 0($a1)		#$t4 = $a1[0]
		add $a0, $t4, $0	#$a0 = $t4
		printInt		#executa macro
		quebra_linha		#executa macro
		quebra_linha		#executa macro
		
		lw $t4, 4($a1)		#$t4 = $a1[4]
		beq $t4, 0, naoHaMoradoresApt	#if ($t4 == 0) -> naoHaMoradoresApt
		bne $t4, 0, temMoradoresApt	#if ($t4 != 0) -> temMoradoresApt
		
		naoHaMoradoresApt:
			la $a0, textNaoTemMoradores
			printString		#executa macro
			quebra_linha		#executa macro
			addi $a1, $a1, 328	#$a1 = $a1 + 328
			j verificarVeiculosApt	#vai para verificarVeiculosApt
		
		temMoradoresApt:
		la $a0, textMoradores	#$a0 = textMoradores
		printString		#executa macro
		quebra_linha		#executa macro
		addi $a1, $a1, 8	#$a1 = $a1 + 8

		li $t3, 0		#$t3 = 0 (iterador)
		la $t5, nomePessoa	#$t5 = nomePessoa
		li $t6, 0		#$t6 = 0 (contador de pessoas (1, 2, .. 5)
		
		loopNomeMorador:
			lb $t4, 0($a1)		#$t4 = $a1[i]
			sb $t4, 0($t5)		#$t5[i] = $t4
			
			beq $t3, $t2, proximoMorador	#if ($t3 == $t2) -> proximoMorador
			
			addi $a1, $a1, 1	#$a1 = $a1 + 1
			addi $t3, $t3, 1	#$t3 = $t3 + 1
			addi $t5, $t5, 1	#$t5 = $t5 + 1
			
			j loopNomeMorador	#loopNomeMorador
		
		proximoMorador:
			addi $t6, $t6, 1	#$t6 = $t6 + 1
			la $a0, nomePessoa	#$a0 = nomePessoa
			printString		#executa macro
		
			la $t5, nomePessoa
			sub $a1, $a1, $t3	#$a1 = $a1 - $t3
			add $t3, $0, $0		#$t3 = 0
			addi $a1, $a1, 64	#$a1 = $a1 + 64

			beq $t6, 5, verificarVeiculosApt	#if($t6 == 5) -> verificarVeiculosApt
			j loopNomeMorador	#volta loopNomeMorador
		
		
	verificarVeiculosApt:
		lw $t3, 0($a1)		#se (0 - nada; 1 - uma moto; 2 - duas motos; 3 - um carro)
		
		li $t4, 0	#$t4 = 0
		beq $t3, $t4, naoExisteVeiculoApt	#if ($t3 == $t4) -> naoExisteVeiculoApt	
		
	
	naoExisteVeiculoApt:
		addi $a1, $a1, 100		#$a1 = $a1 + 100
		j verificarFinalApt		#vai para verificarFinalApt
	
	verificarFinalApt:
		addi $t1, $t1, 428		#$t1 = $t1 + 428
		li $t9, 17120
		beq $t1, $t9, voltaMain	#if ($t1 == 17120) -> voltaMain
		
		quebra_linha		#executa macro
		j loopVerificarInfoApt	#volta loop
	
voltaMain:
	j main
