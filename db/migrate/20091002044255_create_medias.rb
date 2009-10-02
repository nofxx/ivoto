class CreateMedias < ActiveRecord::Migration
  def self.up
    create_table :medias do |t|
      t.string :name
      t.string :kind

      t.timestamps
    end
  end

  def self.down
    drop_table :medias
  end
end
