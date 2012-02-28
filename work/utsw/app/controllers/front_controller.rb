class FrontController < ApplicationController

  def index
    @patients = Patient.find(:all, :include => [:diagnosis, :doctor ] )
  end

end
