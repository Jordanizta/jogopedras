#file = "/home/e06124643/projetos/jogopedras/jogadas.txt"
require_relative "partida"
require_relative "pulos"
require_relative "pontos"

#abre arquivo e cria arrays que serão usados
arquivo = File.open("jogadas.txt")
jogadas = Array.new #cria array de jogadas
partidas = Array.new #cria array de partidas(3 jogadas = 1 partida)
resultado_partidas = Array.new #cria  array de resultado das partidas
classificacao = Array.new #cria array de classificação

#preenche array de jogadas removendo espaçamentos 
while ! arquivo.eof?
  linha_arquivo = arquivo.gets.chomp.split
  jogadas << linha_arquivo
end

#organiza/monta o array de partidas a partir do array de jogadas
organiza_partidas(jogadas, partidas)

#calcula o total de pulos por partida e insere no array de 'resultado_partidas'
partidas.size.times { |i|
  total_pulos(partidas, i, resultado_partidas)
}
#insere o nome dos jogadores no array de 'resultado_partidas'
popula_resultado_partidas(resultado_partidas, partidas)

#gera pontuação para posteriormente ser adicionada no array de classificação
resultado_partidas.size.times { |i|
  gera_pontuacao(resultado_partidas, i)
}

arquivo.close
