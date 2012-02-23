class Patient < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :diagnosis
end
