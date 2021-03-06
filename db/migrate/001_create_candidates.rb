class CreateCandidates < ActiveRecord::Migration
  def self.up
    create_table :candidates do |t|
      t.string :name
      t.string :nick
      t.date :bourne_at
      t.string :slogan

      t.timestamps
    end
  end

  def self.down
    drop_table :candidates
  end
end
