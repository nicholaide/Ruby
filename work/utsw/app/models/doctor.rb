class Doctor < ActiveRecord::Base
  #relationships
  has_many :patients
  
  #validations
  validates :first_name, :last_name, :presence => true
  #add validation for email here, or not

  #callbacks
  after_destroy :check_patients


  def full_name
        "#{first_name} #{last_name}"
  end

  
  #private defs 
  private 

  def check_patients
    if patients.count > 0
      raise "Cannot delete a doctor assigned to patients."
    end
  end     

end
