programa
{
	// Função para transformar os números 10, 20 e 0 em B, P e . 
	funcao cadeia converterPeca(inteiro valorPeca) 
	{
		se (valorPeca == 10) { retorne "B" }
		se (valorPeca == 11) { retorne "D" }
		se (valorPeca == 20) { retorne "P" }
		se (valorPeca == 21) { retorne "M" }
		retorne "."
	}
	funcao inteiro converterLetra(cadeia letra)
	{
		se (letra == "A" ou letra == "a") { retorne 0 }
		se (letra == "B" ou letra == "b") { retorne 1 }
		se (letra == "C" ou letra == "c") { retorne 2 }
		se (letra == "D" ou letra == "d") { retorne 3 }
		se (letra == "E" ou letra == "e") { retorne 4 }
		se (letra == "F" ou letra == "f") { retorne 5 }
		se (letra == "G" ou letra == "g") { retorne 6 }
		se (letra == "H" ou letra == "h") { retorne 7 }

		retorne -1
	}
	funcao exibirErro(cadeia mensagem)
	{
		escreva("\nMovimento inválido! ", mensagem, "\n")
		escreva("Pressione ENTER para tentar novamente...")
		cadeia pausa
		leia(pausa)
		limpa()
	}
	funcao inteiro lerColunaSegura()
	{
		cadeia entrada
		leia(entrada)
		// Se o usuário apenas apertou ENTER sem digitar nada
		se(entrada=="") {retorne -1}
		// Valida se o que foi digitado é um número válido de 0 a 7
		se (entrada == "0") { retorne 0 }
		se (entrada == "1") { retorne 1 }
		se (entrada == "2") { retorne 2 }
		se (entrada == "3") { retorne 3 }
		se (entrada == "4") { retorne 4 }
		se (entrada == "5") { retorne 5 }
		se (entrada == "6") { retorne 6 }
		se (entrada == "7") { retorne 7 }
		// Se for qualquer outra coisa (letras ou números errados)
		retorne -1
	}

	funcao inicio()
	{
		// Declaração das variáveis utilitárias
		inteiro n0, n1, n2, n3, n_vazio, l, c
		inteiro Casa_branca, Casa_preta, Peca_branca, Peca_preta 
		cadeia letras[8]={"A", "B", "C", "D", "E", "F", "G", "H"}

		// Variáveis normais de peças para o tabuleiro
		inteiro peca[8][8]

		// Atribuição de valores
		n0 = 1 
		n1 = 2 
		n2 = 10 
		n3 = 20 
		Casa_branca = n0  
		Casa_preta = n1  
		Peca_branca = n2  
		Peca_preta = n3  
		n_vazio = 0 

		// Inicializando todas as peças como vazias (uma por linha, sem ponto e vírgula)
		para (l = 0; l < 8; l++)
		{
			para (c = 0; c < 8; c++)
			{
				peca[l][c] = n_vazio
			}
		}
		// Posicionando as Peças Iniciais
		peca[0][1] = n2
		peca[0][3] = n2
		peca[0][5] = n2
		peca[0][7] = n2

		peca[1][0] = n2
		peca[1][2] = n2
		peca[1][4] = n2
		peca[1][6] = n2

		peca[2][1] = n2
		peca[2][3] = n2
		peca[2][5] = n2
		peca[2][7] = n2

		peca[5][0] = n3
		peca[5][2] = n3
		peca[5][4] = n3
		peca[5][6] = n3

		peca[6][1] = n3
		peca[6][3] = n3
		peca[6][5] = n3
		peca[6][7] = n3

		peca[7][0] = n3
		peca[7][2] = n3
		peca[7][4] = n3
		peca[7][6] = n3

		inteiro linha_origem, coluna_origem
		inteiro linha_destino, coluna_destino
		logico jogo_rodando = verdadeiro
		inteiro turno_atual = 10
		 
		enquanto (jogo_rodando == verdadeiro)
		{
			// Sistema de conceder vitória
			inteiro total_brancas = 0
			inteiro total_pretas = 0

			para(l=0;l<8;l++)
			{
				para(c=0;c<8;c++)
				{
					se (peca[l][c]==10 ou peca[l][c]==11) {total_brancas++}
					se (peca[l][c]==20 ou peca[l][c]==21) {total_pretas++}
				}
			}

			se (total_brancas==0)
			{
				limpa()
				escreva("FIM DE JOGO! As PRETAS (P) venceram o jogo!\n")
				jogo_rodando = falso
				pare
			}
			senao se (total_pretas==0)
			{
				limpa()
				escreva("FIM DE JOGO! As BRANCAS (B) venceram o jogo!\n")
				jogo_rodando = falso
				pare
			}
			
			
			limpa()
			// Exibindo o resultado final na tela
			escreva("TABULEIRO INICIAL DE DAMAS:\n") 
			escreva("-------------------\n") 
			escreva("   0 1 2 3 4 5 6 7\n")
			para (l = 0; l < 8; l++)
			{
				escreva(letras[l], ": ") // Escreve a letra da linha atual (A, B, C...)
				
				para (c = 0; c < 8; c++)
				{
					escreva(converterPeca(peca[l][c]), " ")
				}
				escreva(":", letras[l])
				escreva("\n") // Pula para a próxima linha do tabuleiro
			}
			escreva("   0 1 2 3 4 5 6 7\n")
			escreva("-------------------\n")

			escreva("PEÇAS RESTANTES: ")
			escreva("Brancas: ", total_brancas, " | Pretas: ", total_pretas, "\n")
			escreva("-------------------\n")

			cadeia letra_origem, letra_destino
			// Escolhe a peça que vai se mover
			escreva("\n--- VEZ DE JOGAR: ")
			se(turno_atual==10) {escreva("BRANCAS (B = Comum / D = Dama) ---\n")}
			senao {escreva("PRETAS (P = Comum / M = Dama) ---\n")}

			
			escreva("Escolha a LINHA da peça (A a H): ")
			leia(letra_origem)
			linha_origem = converterLetra(letra_origem)
			escreva("Escolha a COLUNA da peça (0 a 7): ")
			coluna_origem = lerColunaSegura()
			
			
			se(linha_origem<0 ou linha_origem>7 ou coluna_origem<0 ou coluna_origem>7)
			{
				exibirErro("Coordenadas de origem inválidas ou fora do tabuleiro.")
			}
			senao se(peca[linha_origem][coluna_origem]==0)
				{
				exibirErro("Não há peça de origem.")
				}
				senao se((turno_atual == 10 e peca[linha_origem][coluna_origem] != 10 e peca[linha_origem][coluna_origem] != 11) ou
						(turno_atual == 20 e peca[linha_origem][coluna_origem] != 20 e peca[linha_origem][coluna_origem] != 21))
					{
						exibirErro("Você não pode mexer nas peças do adversário!")
					}
					senao
					{
						// Escolhe aonde a peça vai se mover
						escreva("Escolha a NOVA LINHA (A a H): ")
						leia(letra_destino)
						linha_destino = converterLetra(letra_destino)
						escreva("Escolha a NOVA COLUNA (0 a 7): ")
						coluna_destino = lerColunaSegura()

						se(linha_destino < 0 ou linha_destino > 7 ou coluna_destino < 0 ou coluna_destino > 7)
						{
							exibirErro("Coordenadas de destino inválidas ou fora do tabuleiro.")
						}
						senao
						{
							// Guardamos a direção real (com sinal positivo ou negativo_
							inteiro direcao_real = linha_destino - linha_origem
			
							// Criamos as distrâncias que serão transformadas em absoluto (sempre positivas)
							inteiro distancia_linha = linha_destino - linha_origem
							inteiro distancia_coluna = coluna_destino - coluna_origem
							
							// Convertendo distâncias negativas em positivas
							se (distancia_linha<0) {distancia_linha = distancia_linha*-1}
							se (distancia_coluna<0) {distancia_coluna = distancia_coluna*-1}
	
							inteiro linha_meio = (linha_origem+linha_destino)/2
							inteiro coluna_meio = (coluna_origem+coluna_destino)/2

							inteiro peca_atual = peca[linha_origem][coluna_origem]
							
							// Validamos se o movimento é diagonal e de apenas 1 casa de distância
							//Movimento normal
							se(distancia_linha==1 e distancia_coluna==1)
							{
								logico eh_dama = (peca_atual==11 ou peca_atual==21)
								logico movimento_valido = falso

								se (eh_dama) {movimento_valido=verdadeiro}
								se (peca_atual==10 e direcao_real==1) {movimento_valido=verdadeiro} // Branca descendo
								se (peca_atual==20 e direcao_real==-1) {movimento_valido=verdadeiro} // Preta subindo
								
								se (movimento_valido == verdadeiro)
								{
									se(peca[linha_destino][coluna_destino]==0)
									{
										// Move o valor da posição antiga para a nova
										peca[linha_destino][coluna_destino] = peca[linha_origem][coluna_origem]
										// Apaga a peça da posição antiga
										peca[linha_origem][coluna_origem] = 0

										se (peca_atual == 10 e linha_destino == 7) { peca[linha_destino][coluna_destino] = 11 }
										se (peca_atual == 20 e linha_destino == 0) { peca[linha_destino][coluna_destino] = 21 }
										
										se(turno_atual==10) {turno_atual=20}
										senao {turno_atual=10}
									}
								senao
								{
									exibirErro("A casa de destino já está ocupada.")
								}
								}
								senao
								{
									exibirErro("Peças comuns não podem andar para trás.")
								}
							}
							// Movimento de captura com peças comuns podendo capturar para trás
							senao se(distancia_linha==2 e distancia_coluna==2)
							{
								se(peca[linha_destino][coluna_destino]==0)
								{
									inteiro peca_comida = peca[linha_meio][coluna_meio]
									logico inimigo_no_meio = falso

									se (turno_atual == 10 e (peca_comida == 20 ou peca_comida == 21)) { inimigo_no_meio = verdadeiro }
									se (turno_atual == 20 e (peca_comida == 10 ou peca_comida == 11)) { inimigo_no_meio = verdadeiro }
									
									se(inimigo_no_meio == verdadeiro)
									{
										peca[linha_destino][coluna_destino] = peca[linha_origem][coluna_origem]
										peca[linha_origem][coluna_origem] = 0
										
										peca[linha_meio][coluna_meio]=0

										// --- Promoção na captura ---
										se (peca_atual == 10 e linha_destino == 7) { peca[linha_destino][coluna_destino] = 11 }
										se (peca_atual == 20 e linha_destino == 0) { peca[linha_destino][coluna_destino] = 21 }
										
										se(turno_atual==10) {turno_atual=20}
										senao {turno_atual=10}
									}
									senao
									{
										exibirErro("Você só pode pular se houver uma peça adversária no meio.")
									}
								}
								senao
								{
									exibirErro("A casa de destino para a captura já está ocupada.")
								}
							}
							senao
							{
								exibirErro("Peças comuns só andam 1 casa ou pulam 2 casas para capturar.")
							}
						}
					}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 9212; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */