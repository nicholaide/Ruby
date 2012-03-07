class AdminController < ApplicationController
  def index
    @total_patients = Patient.count
  end
end
