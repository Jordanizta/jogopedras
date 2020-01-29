
def gera_pontuacao(resultado_partidas, pontos)
  resultado_partidas.each_with_index { |partida|
    pulos_A = partida[1].to_i
    pulos_B = partida[3].to_i
    pontos_A = 0
    pontos_B = 0
    #O jogador que obtiver o maior número de pulos de pedra na partida, recebe 3 pontos.
    pulos_A == pulos_B ? pontos_B += 2 : pontos_B += pontos_B
    #Em caso de empate, o jogador que jogar fora de casa, recebe 2 pontos.
    if pulos_A > pulos_B
      pontos_A+=3
    else
      pontos_B+=3
    end
    #O jogador que obtiver quantidade de pulos menor que 3 na partida, será punido com 1 ponto a menos.
    if pulos_A < 3
      pontos_A-=1
    end
    if pulos_B < 3
      pontos_B-=1
    end
    pontos.push(popula_array_pontos(partida, 0, pontos_A))
    pontos.push(popula_array_pontos(partida, 2, pontos_B))
  }
end

def soma_pontos(pontos)
  pontuacao = 0
  pontos.each_with_index { |ponto|
    if ponto[:nome] == "Egio"
      pontos = ponto[:pontos]
      pontuacao+=pontos
    end
  }
  puts "---------------"
  puts pontuacao
end

private
  def popula_array_pontos(partida, index_nome, pontos)
    jogador = {nome:partida[0].split[index_nome], pontos:pontos}
  end