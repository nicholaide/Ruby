class Patient < ActiveRecord::Base

  #order
  default_scope :order => 'last_name'
  
  #relationships
  belongs_to :doctor
  belongs_to :diagnosis
 
  #validations
  validates :first_name, :last_name, :presence => true
  validates :age, :numericality => {:greater_than_or_equal_to =>0}
  

end
