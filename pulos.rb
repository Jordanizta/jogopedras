#calcula o total de pulos por partida e insere no array de 'resultado_partidas'
def total_pulos(partidas, index, resultado_partidas)
  #soma os 3 pulos jogador A
  pulos_A=(partidas[index][0][3].to_i + partidas[index][1][3].to_i + partidas[index][2][3].to_i)
  #soma os 3 pulos jogador B
  pulos_B=(partidas[index][0][5].to_i + partidas[index][1][5].to_i + partidas[index][2][5].to_i)
  if pulos_iguais?(partidas, index, 3)
    pulos_A = pulos_A*1.1
    pulos_A = pulos_A.round
  end
  if pulos_iguais?(partidas, index, 5)
    pulos_B = pulos_B*1.1
    pulos_B = pulos_B.round
  end
  if pulos_A > 10
    pulos_A +=2
  end
  if pulos_B > 10
    pulos_B +=2
  end
  #insere os pulos no array de resultado de partidas
  insere_pulos(resultado_partidas, pulos_A, pulos_B)
end

private

  #checa se pulos do jogador são iguais recebendo array e índice
  def pulos_iguais?(partidas, index, index_pulos)
    if(partidas[index][0][index_pulos].to_i == partidas[index][1][index_pulos].to_i) && 
      (partidas[index][0][index_pulos].to_i == partidas[index][2][index_pulos].to_i)
      return true
    end
  end

  #insere os pulos do jogador no array de 'resultado_partidas'
  def insere_pulos(resultado_partidas, pulos_A, pulos_B)
    resultado_partidas.push("#{pulos_A} x #{pulos_B}".split)
  end