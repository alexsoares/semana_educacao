class Formulario < ActiveRecord::Base
  attr_accessible :codigo, :horario

  def emite_datahora
    self.horario = DateTime.current
  end

  def busca_nome
    Inscricao.find_by_documento(self.codigo).nome
  end
  def cria_arquivo(identificacao,data,hora,pessoa)
    name = "#{identificacao}.txt"
    directory = "public/horarios"
    path = File.join(directory, name)
    texto = File.new(path,"w")
    texto.puts "I8,A,001"
    texto.puts ""
    texto.puts ""
    texto.puts "Q240,024"
    texto.puts "q831"
    texto.puts "rN"
    texto.puts "S4"
    texto.puts "D7"
    texto.puts "ZT"
    texto.puts "JF"
    texto.puts "OD"
    texto.puts "R255,0"
    texto.puts "f100"
    texto.puts "N"
    texto.puts 'A304,230,2,2,1,1,N,"XXIV Semana da Educacao"'
    texto.puts 'A275,198,2,2,1,1,N,"Controle de acesso"'
    texto.puts 'A166,94,2,2,1,1,N,"' + hora +'"'
    texto.puts 'A301,94,2,2,1,1,N,"' + data +'"'
    texto.puts 'LO27,179,276,1'
    texto.puts 'A167,112,2,2,1,1,N,"Hora:"'
    texto.puts 'A302,138,2,2,1,1,N,"' + pessoa + '"'
    texto.puts 'A301,160,2,2,1,1,N,"Matricula:"'
    texto.puts 'A302,112,2,2,1,1,N,"Data:"'
    texto.puts 'A175,160,2,2,1,1,N,"' + (identificacao.to_s) +'"'
    texto.puts 'A302,21,2,2,1,1,N,"verso de seu cracha"'
    texto.puts 'A302,37,2,2,1,1,N,"Cole este comprovante no"'
    texto.puts 'A302,68,2,2,1,1,N,"Seja Bem vindo!"'
    texto.puts "P1"
    texto.close
    salva_path(path)
  end
  
  def salva_path(path)
    self.path = path
  end
end
