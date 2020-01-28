
pontos_3_CONST = 3
fora_Casa_CONST = 2
menor_3_CONST = -1 

def gera_pontuacao(resultado_partidas, index)
  pulos_A = resultado_partidas[index][1].to_i
  pulos_B = resultado_partidas[index][3].to_i
  pontos_A = 0
  pontos_B = 0
  puts "----------------- #{index} ------------------"
  puts pulos_A > pulos_B ? pontos_A = dar_3_pontos(pontos_A) : pontos_B = dar_3_pontos(pontos_B)
  if pulos_A == pulos_B 
    puts "EMPATE: #{empate(pontos_B)}" 
  end
  if pulos_A < 3
    puts "PUNIÇAO A: #{punicao(pontos_A)}"
  end
  if pulos_B < 3
    puts "PUNIÇAO B: #{punicao(pontos_B)}"
  end
  puts "----------------- #{index} ------------------"
end

private

  #O jogador que obtiver o maior número de pulos de pedra na partida, recebe 3 pontos.
  def dar_3_pontos(pontos)
    pontos = pontos + 3
  end 

  #Em caso de empate, o jogador que jogar fora de casa, recebe 2 pontos.
  def empate(pontos)
    pontos+=2
  end

  #O jogador que obtiver quantidade de pulos menor que 3 na partida, será punido com 1 ponto a menos.
  def punicao(pontos)
    pontos-=1
  end
