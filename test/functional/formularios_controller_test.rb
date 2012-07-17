require 'test_helper'

class FormulariosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Formulario.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Formulario.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Formulario.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to formulario_url(assigns(:formulario))
  end

  def test_edit
    get :edit, :id => Formulario.first
    assert_template 'edit'
  end

  def test_update_invalid
    Formulario.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Formulario.first
    assert_template 'edit'
  end

  def test_update_valid
    Formulario.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Formulario.first
    assert_redirected_to formulario_url(assigns(:formulario))
  end

  def test_destroy
    formulario = Formulario.first
    delete :destroy, :id => formulario
    assert_redirected_to formularios_url
    assert !Formulario.exists?(formulario.id)
  end
end
