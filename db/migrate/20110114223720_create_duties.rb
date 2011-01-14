class CreateDuties < ActiveRecord::Migration
  def self.up
    create_table :duties do |t|
      t.integer :user_id
      t.integer :role_id
      t.datetime :date

      t.timestamps
    end
  end

  def self.down
    drop_table :duties
  end
end
