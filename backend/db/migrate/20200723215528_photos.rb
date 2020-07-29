class Photos < ActiveRecord::Migration[5.2]
  def self.up
    create_table :photos do |t|
      t.column :project_id, :integer, :null => false
      t.column :attachment, :bytea, :null => false
      t.column :description, :text, :null => false
    end
  end

  def self.down
    drop_table :photos
  end

  def change
  end
end
