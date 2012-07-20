class FormulariosController < ApplicationController
  def index
    @formularios = Formulario.all
  end

  def show
    @formulario = Formulario.find(params[:id])
    session[:ip] = request.remote_ip
    if session[:ip] == '192.168.1.2'
      system("lpr -P semana1 #{@formulario.path}")
    else
      if request.remote_ip == '192.168.1.3'
        system("lpr -P semana2 #{@formulario.path}")
      else
        if request.remote_ip == '192.168.1.4'
          system("lpr -P semana3 #{@formulario.path}")
        else
          if request.remote_ip == '192.168.1.5'
            system("lpr -P semana4 #{@formulario.path}")
          else
            if request.remote_ip == '192.168.1.6'
              system("lpr -P semana5 #{@formulario.path}")
            else
              if request.remote_ip == '192.168.1.7'
                system("lpr -P semana6 #{@formulario.path}")
              end
            end
          end
        end
      end
    end
      #redirect_to new_formulario_path
  end

  def exibe
    @formulario = Formulario.find(params[:id])
  end
  def busca
    if params[:busca].present?
      i = params[:periodo].present?
      t = params[:dia].present?
      if params[:periodo].present? and params[:dia].present?
        @busca = Formulario.find_all_by_codigo(params[:busca], :conditions => ["periodo = ? and horario between ? and ?",params[:periodo],Formulario.define_dia_inicial(params[:dia]),Formulario.define_dia_final(params[:dia])])
      else
        if params[:dia].present?
          @busca = Formulario.find_all_by_codigo(params[:busca], :conditions => ["periodo = ?",Formulario.define_dia(params[:dia])])
        else
          if params[:periodo].present?
            @busca = Formulario.find_all_by_codigo(params[:busca], :conditions => ["periodo = ?",params[:periodo]])
          else
            @busca = Formulario.find_all_by_codigo(params[:busca])
          end
        end
      end
    end
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
