class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.integer     :account_id, :null => false
      t.string      :description, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :todos
  end
end
