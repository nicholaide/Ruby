class Doctor < ActiveRecord::Base
  #relationships
  has_many :patients
  
  #validations
  validates :first_name, :last_name, :presence => true
  #add validation for email here, or not

  def full_name
        "#{first_name} #{last_name}"
  end
  

end
