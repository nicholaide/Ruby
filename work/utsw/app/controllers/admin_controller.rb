class AdminController < ApplicationController
  def index
    @total_patients = Patient.count
    @t = Time.now
  end
end
