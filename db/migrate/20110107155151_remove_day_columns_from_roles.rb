class RemoveDayColumnsFromRoles < ActiveRecord::Migration
  def self.up
    remove_column :roles, :wednesday_night
    remove_column :roles, :sunday_morning
    remove_column :roles, :sunday_night
    remove_column :roles, :all_month
    add_column    :roles, :period, :string
  end

  def self.down
  end
end
