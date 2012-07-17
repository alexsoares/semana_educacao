class CreateInscricaos < ActiveRecord::Migration
  def self.up
    create_table :inscricaos do |t|
      t.integer :documento
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :inscricaos
  end
end
