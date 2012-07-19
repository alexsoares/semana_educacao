class CreateFormularios < ActiveRecord::Migration
  def self.up
    create_table :formularios do |t|
      t.string :codigo
      t.datetime :horario
      t.string :periodo
      t.timestamps
    end
  end

  def self.down
    drop_table :formularios
  end
end
