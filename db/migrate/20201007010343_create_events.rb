class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :description
      t.string :eventID
      t.string :type
      t.string :service

      t.timestamps
    end
  end
end
