require "csv"

def gerar_classificacao(classificacao)
  classificacao.each { |jogador|
    inserir = ["#{jogador[:nome]}","#{jogador[:pontos]}"]
    puts inserir
    CSV.open('classificacao.csv', 'a+') {|csv| 
      csv << inserir
    }  
  }
end