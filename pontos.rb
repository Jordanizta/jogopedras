
PONTOS_CONST = 3
fora_Casa_CONST = 2
menor_3_CONST = -1 

def gera_pontuacao(resultado_partidas, index)
  pulos_A = resultado_partidas[index][1].to_i
  pulos_B = resultado_partidas[index][3].to_i
  pontos_A = 0
  pontos_B = 0
  puts "----------------- #{index} ------------------"
    #O jogador que obtiver o maior número de pulos de pedra na partida, recebe 3 pontos.
  pulos_A > pulos_B ? pontos_A += 3 : pontos_B += 3
  #Em caso de empate, o jogador que jogar fora de casa, recebe 2 pontos.
  if pulos_A == pulos_B
    pontos_B+=2
    puts "EMPATE: #{pontos_B}" 
  end
  #O jogador que obtiver quantidade de pulos menor que 3 na partida, será punido com 1 ponto a menos.
  if pulos_A < 3
    pontos_A-=1
    puts "PUNIÇAO A: #{pontos_A}"
  end
  if pulos_B < 3
    pontos_B-=1
    puts "PUNIÇAO B: #{pontos_B}"
  end
  puts "PONTOS A: #{pontos_A} - PONTOS B: #{pontos_B}"
end
