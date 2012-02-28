class FrontController < ApplicationController

  def index
    #@patients = Patient.find(:all, :include => [:diagnosis, :doctor ] )
     @patients = Patient.paginate :page=>params[:page], :order=>'last_name desc',
        :per_page => 3
  end

end
