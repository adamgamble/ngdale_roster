class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.boolean :wednesday_night
      t.boolean :sunday_morning
      t.boolean :sunday_night
      t.boolean :all_month
      t.integer :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end
