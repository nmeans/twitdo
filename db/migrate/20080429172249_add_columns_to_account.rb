class AddColumnsToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :param, :string
    add_column :accounts, :avatar_url, :string
  end

  def self.down
    remove_column :accounts, :param
    remove_column :accounts, :avatar_url
  end
end
