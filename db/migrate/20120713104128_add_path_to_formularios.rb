class AddPathToFormularios < ActiveRecord::Migration
  def self.up
    add_column :formularios, :path, :string
  end

  def self.down
    remove_column :formularios, :path
  end
end
