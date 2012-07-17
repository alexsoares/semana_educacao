require 'test_helper'

class FormularioTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Formulario.new.valid?
  end
end
