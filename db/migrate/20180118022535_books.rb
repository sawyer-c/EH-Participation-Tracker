class Books < ActiveRecord::Migration[5.1]
  def change
      create_table :books do |t|
           t.column :title, :string, :limit => 32, :null => false
           t.column :price, :float
           t.column :subject_id, :integer
           t.column :author, :string
           t.column :created_at, :timestamp
      end
  end
end
