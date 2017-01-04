class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :id_number
      t.string :fname
      t.string :lname
      t.string :email

      t.timestamps
    end
  end
end
