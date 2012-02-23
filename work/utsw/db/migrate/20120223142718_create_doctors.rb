class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :degrees
      t.string :portrait

      t.timestamps
    end
  end
end
