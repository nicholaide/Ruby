class Doctor < ActiveRecord::Base
  #relationships
  has_many :patients
  
  #validations
  validates :first_name, :last_name, :presence => true
  #add validation for email here
  

end
