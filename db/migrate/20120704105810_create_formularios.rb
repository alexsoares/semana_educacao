class CreateFormularios < ActiveRecord::Migration
  def self.up
    create_table :formularios do |t|
      t.integer :codigo
      t.datetime :horario
      t.timestamps
    end
  end

  def self.down
    drop_table :formularios
  end
end
