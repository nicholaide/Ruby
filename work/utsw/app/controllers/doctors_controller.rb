class DoctorsController < ApplicationController
  # GET /doctors
  # GET /doctors.json
  def index
    #@doctors = Doctor.all
    @doctors = Doctor.paginate :page=>params[:page], :order=>'last_name asc',
        :per_page => 3

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @doctors }
    end
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    begin
      @doctor = Doctor.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid doctor #{params[:id]}"
      redirect_to front_url, :notice => 'Doctor does not exist'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @doctor }
      end
    end
  end

  # GET /doctors/new
  # GET /doctors/new.json
  def new
 
      @doctor = Doctor.new(:degrees => "MD")
    

      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @doctor }
       end
  end

  # GET /doctors/1/edit
  def edit
    begin
      @doctor = Doctor.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid doctor #{params[:id]}"
      redirect_to front_url, :notice => 'Doctor does not exist'
    else
      @doctor 
     end
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @doctor = Doctor.new(params[:doctor])

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, :notice => 'Doctor was successfully created.' }
        format.json { render :json => @doctor, :status => :created, :location => @doctor }
      else
        format.html { render :action => "new" }
        format.json { render :json => @doctor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doctors/1
  # PUT /doctors/1.json
  def update
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      if @doctor.update_attributes(params[:doctor])
        format.html { redirect_to @doctor, :notice => 'Doctor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @doctor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor = Doctor.find(params[:id])
    begin
      @doctor.destroy
      flash[:notice] = "Doctor #{@doctor.first_name} deleted."
    rescue Exception => e
      flash[:notice] = e.message +  " (" + @doctor.first_name + " " + @doctor.last_name + ")"
    end
    respond_to do |format|
      format.html { redirect_to doctors_url }
      format.json { head :no_content }
    end
  end

end
