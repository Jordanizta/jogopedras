#Insere o resultado de jogadas em array de partidas
def organiza_partidas(jogadas, partidas)
  jogadas.drop(1).each_slice(3) { |partida|
    partidas.push(partida)
  }
end

def popula_resultado_partidas(resultado_partidas, partidas)
  resultado_partidas.size.times { |i|
    resultado_partidas[i].prepend("#{partidas[i][0][0]} x #{partidas[i][0][2]}")
  }
end


#teste.each_with_index do |value, index|
#  answers.push("#{index}" => value)
#end