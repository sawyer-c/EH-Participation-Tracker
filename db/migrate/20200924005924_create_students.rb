class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :user_id
      t.string :firstName
      t.string :lastName
      t.string :email
      t.integer :uin
      t.integer :year
      t.float :gpa
      t.string :major
      t.string :status

      t.timestamps
    end
  end
end
