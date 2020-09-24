class RemoveFieldpasswordFromStudent < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :password, :string
  end
end
