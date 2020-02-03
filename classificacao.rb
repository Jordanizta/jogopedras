require "csv"

#responsável por gerar o arquivo csv final de classificação
def gerar_classificacao(classificacao)
  classificacao.each { |jogador|
    inserir = ["#{jogador[:nome]}","#{jogador[:pontos]}"]
    CSV.open('classificacao.csv', 'a+') {|csv| 
      csv << inserir
    }  
  }
end