class AddGpaToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :gpa, :float
  end
end
