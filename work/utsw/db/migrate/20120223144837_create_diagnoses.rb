class CreateDiagnoses < ActiveRecord::Migration
  def change
    create_table :diagnoses do |t|
      t.string :name
      t.string :description
      t.string :reference_number

      t.timestamps
    end
  end
end
