class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.integer :gradYear
      t.string :major
      t.string :status

      t.timestamps
    end
  end
end
