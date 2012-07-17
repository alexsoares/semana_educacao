class FormulariosController < ApplicationController
  def index
    @formularios = Formulario.all
  end

  def show
    @formulario = Formulario.find(params[:id])
    session[:ip] = request.remote_ip
    #if session[:ip] == '192.168.0.66'
      system("lpr -P zd-suporte1 #{@formulario.path}")
    #else
      #if request.remote_ip == '127.0.0.1'
        #system("lpr -P lex #{@formulario.path}")
      #end
    #end
      redirect_to new_formulario_path
  end

  def exibe
    @formulario = Formulario.find(params[:id])
  end

  def new
    @formulario = Formulario.new
  end

  def create
    @formulario = Formulario.new(params[:formulario])
    @formulario.cria_arquivo(@formulario.codigo,@formulario.emite_datahora.strftime("%m/%d/%Y"),@formulario.emite_datahora.strftime("%H:%M:%S"),@formulario.busca_nome)
    if @formulario.save
      flash[:notice] = "Comprovante Gerado."
      redirect_to @formulario
    else
      render :action => 'new'
    end
  end

  def edit
    @formulario = Formulario.find(params[:id])
  end

  def update
    @formulario = Formulario.find(params[:id])
    if @formulario.update_attributes(params[:formulario])
      flash[:notice] = "Comprovante atualizado."
      redirect_to @formulario
    else
      render :action => 'edit'
    end
  end

  def destroy
    @formulario = Formulario.find(params[:id])
    @formulario.destroy
    flash[:notice] = "Comprovante excluído."
    redirect_to formularios_url
  end
end
