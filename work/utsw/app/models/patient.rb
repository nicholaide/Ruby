class Patient < ActiveRecord::Base
  
  #relationships
  belongs_to :doctor
  belongs_to :diagnosis
 
  #validations
  validates :first_name, :last_name, :presence => true
  validates :age, :numericality => {:greater_than_or_equal_to =>0}
  

end
