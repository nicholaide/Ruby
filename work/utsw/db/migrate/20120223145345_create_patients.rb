class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :doctor_id
      t.string :diagnosis_id

      t.timestamps
    end
  end
end
