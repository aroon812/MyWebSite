class Projects < ActiveRecord::Migration[5.2]
  def self.up
    create_table :projects do |t|
      t.column :title, :string, :null => false
      t.column :description, :text, :null => false
      t.column :created_at, :timestamp
    end
  end

  def self.down
    drop_table :projects
  end

  def change
  end
end
