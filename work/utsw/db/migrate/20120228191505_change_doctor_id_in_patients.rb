class ChangeDoctorIdInPatients < ActiveRecord::Migration
  def up
  change_column :patients, :doctor_id, :integer, :default => 5
  change_column :patients, :diagnosis_id, :integer, :default => 4
  end

  def down
  end
end
