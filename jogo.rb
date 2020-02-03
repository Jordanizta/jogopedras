require_relative "partida"
require_relative "pulos"
require_relative "pontos"
require_relative "classificacao"

#abre arquivo e cria arrays que serão usados
arquivo = File.open("jogadas.txt")
jogadas = Array.new #cria array de jogadas
partidas = Array.new #cria array de partidas(3 jogadas = 1 partida)
resultado_partidas = Array.new #cria array de resultado das partidas
pontos = Array.new #cria array para guardar pontos das partidas
classificacao = Array.new #cria array de classificação

#preenche array de jogadas removendo espaçamentos 
while ! arquivo.eof?
  linha_arquivo = arquivo.gets.chomp.split
  jogadas << linha_arquivo
end

#organiza/monta o array de partidas a partir do array de jogadas
#partida.rb
organiza_partidas(jogadas, partidas)

#calcula o total de pulos por partida e insere no array de 'resultado_partidas'
#pulos.rb
partidas.size.times { |i|
  total_pulos(partidas, i, resultado_partidas)
}

#insere o nome dos jogadores no array de 'resultado_partidas'
#partida.rb
popula_resultado_partidas(resultado_partidas, partidas)

#gera a pontuação populando o array de pontos
#pontos.rb
gera_pontuacao(resultado_partidas, pontos)
#faz a soma de pontos dos jogadores e insere no array de classificação
#pontos.rb
soma_pontos(pontos, classificacao)

#ordena o array de classificação (maior pro menor)
classificacao.sort_by!{ |k| -k[:pontos] }
#define nome das colunas no CSV
cabecalho = {nome:"Jogador", pontos:"Pontuação"}
classificacao.prepend(cabecalho)

#gera CSV com a classificação geral
gerar_classificacao(classificacao)

arquivo.close