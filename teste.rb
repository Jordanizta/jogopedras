#Geração do DV da inscrição do IMÓVEL 
def gera_digito inscricao
  Rails.logger.info "GERAÇÃO DO DÍGITO VERIFICADOR DA INSCRIÇÃO".blue
  num_calc = [7,6,5,4,3,2]
  inscricao_string = inscricao.to_s
  q = 0
  while q < (num_calc.size-inscricao.to_s.size) do
    inscricao_string = "0"+"#{inscricao_string}"
    q+=1
  end
  insc_arr = (inscricao_string).split("")
  insc_calc = ""
  calc_tot = 0
  i = 0
  insc_arr.each do |num|
    insc_calc = (num.to_i*num_calc[i])
    calc_tot = calc_tot + insc_calc.to_i
    i = i+1
  end
  resto_div = calc_tot % 11
  resto_div = resto_div.to_i
  if resto_div > 1
    return 11 - resto_div.to_i
  else
    return 0
  end
end	

def gera_digito_refact inscricao
  Rails.logger.info "GERAÇÃO DO DÍGITO VERIFICADOR DA INSCRIÇÃO".blue
  base_calculo = [7,6,5,4,3,2] # Padrão do Simat
  inscricao = inscricao.to_s (base_calculo.size - inscricao.size).times { inscricao.prepend('0') }		
  calculo_total = inscricao.chars.map.with_index { |char, index| char.to_i*base_calculo[index] }.sum		
  resto_divisao = (calculo_total % 11).to_i		
  return resto_divisao > 1 ? (11 - resto_divisao).to_i : 0
end