class Diagnosis < ActiveRecord::Base

  #relationships
  has_many :patients

  #validations
  validates :name, :description, :reference_number, :presence => true
  validates :reference_number, :format => { :with => %r{\A[0-9]{3}-[A-Z]{3}$},
    :message => 'Format must be similar to 123-ABC' }
 

end
