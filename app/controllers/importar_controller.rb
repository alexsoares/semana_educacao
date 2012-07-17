class ImportarController < ApplicationController
  def index
    @import = Temp.all
  end

  def uploadFile
    post = DataFile.save(params[:upload])
    flash[:notice] = "Upload bem sucedido. Efetive a importação "
    redirect_to(importar_index_path)
  end

  def efetivar_importacao
    temp = Temp.all
    temp.each do |f|
      importacao = Inscricao.new
      importacao.documento = f.documento
      importacao.nome = f.nome
      importacao.save
      f.destroy
    end
    flash[:notice] = "Importação realizada com sucesso!."
    redirect_to(importar_index_path)
  end


end
