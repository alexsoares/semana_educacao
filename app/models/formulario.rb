class Formulario < ActiveRecord::Base
  attr_accessible :codigo, :horario
  DIAS = %w(Primeiro Segundo Terceiro)
  HORARIO = %w(Matutino Vespertino)

  def emite_datahora
    define_periodo(DateTime.current)
    self.horario = DateTime.current
  end


  def define_periodo(hora)
    hora_formatada = hora.strftime("%H:%M")
    if hora_formatada.between?("07:00","12:00")
      self.periodo = "Matutino"
    else
      self.periodo = "Vespertino"
    end
  end

  def busca_nome
    nome = Inscricao.find_by_documento(self.codigo.to_s).nome
    if nome.present?
      nome
    else
      "Inscrito não identificado"
    end
    
  end
  def cria_arquivo(identificacao,data,hora,pessoa)
    name = "#{identificacao}.txt"
    directory = "public/cupons"
    path = File.join(directory, name)
    texto = File.new(path,"w")
    texto.puts "I8,A,001"
    texto.puts ""
    texto.puts ""
    texto.puts "Q203,024"
    texto.puts "q831"
    texto.puts "rN"
    texto.puts "S4"
    texto.puts "D7"
    texto.puts "ZT"
    texto.puts "JF"
    texto.puts "OD"
    texto.puts "R212,0"
    texto.puts "f100"
    texto.puts "N"
    texto.puts 'A32,0,0,2,1,1,N,"XXIV Semana da Educação"'
    texto.puts 'A61,16,0,2,1,1,N,"Controle de acesso"'
    texto.puts 'A170,105,0,2,1,1,N,"' + hora +'"'
    texto.puts 'A35,105,0,2,1,1,N,"' + data +'"'
    texto.puts 'LO33,34,276,2'
    texto.puts 'A169,87,0,2,1,1,N,"Hora:"'
    texto.puts 'A34,64,0,2,1,1,N,"' + pessoa + '"'
    texto.puts 'A35,42,0,2,1,1,N,"Matricula:"'
    texto.puts 'A34,89,0,2,1,1,N,"Data:"'
    texto.puts 'A161,42,0,2,1,1,N,"' + (identificacao.to_s) +'"'
    texto.puts 'A35,178,0,2,1,1,N,"verso de seu crachá"'
    texto.puts 'A35,162,0,2,1,1,N,"Cole este comprovante no"'
    texto.puts 'A35,128,0,2,1,1,N,"Seja Bem vindo!"'
    texto.puts "P1"
    texto.close
    salva_path(path)
  end
  
  def salva_path(path)
    self.path = path
  end

  protected

  def self.define_dia_inicial(dia)
    if dia == "Primeiro"
      ("19-07-2012").to_date + 0.hour + 0.minute
    else
      if dia == "Segundo"
        ("24-07-2012").to_date + 0.hour + 0.minute
      else
        ("25-07-2012").to_date + 0.hour + 0.minute
      end
    end
  end

  def self.define_dia_final(dia)
    if dia == "Primeiro"
      ("23-07-2012").to_date + 23.hours + 59.minute
    else
      if dia == "Segundo"
        ("24-07-2012").to_date + 23.hours + 59.minute
      else
        ("25-07-2012").to_date + 23.hours + 59.minute
      end
    end
  end

end
