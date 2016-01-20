class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, length: 45
      t.string :register_number, length: 45, unique: true
      t.integer :status

      t.timestamps null: false
    end
  end
end
