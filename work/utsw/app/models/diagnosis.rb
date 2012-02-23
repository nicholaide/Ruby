class Diagnosis < ActiveRecord::Base
  has_many :patients
end
