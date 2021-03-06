class PatientsController < ApplicationController
  # GET /patients
  # GET /patients.json
  def index
    #@patients = Patient.all
    @patients = Patient.paginate :page=>params[:page], :order=>'last_name asc',
        :per_page => 3
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    begin
      @patient = Patient.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid patient #{params[:id]}"
      redirect_to front_url, :notice => 'Patient does not exist'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @patient }
      end
    end
  end

  # GET /patients/new
  # GET /patients/new.json
  def new

      @patient = Patient.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @patient }
      end
 
  end

  # GET /patients/1/edit
  def edit
    begin
      @patient = Patient.find(params[:id], :include => [:diagnosis, :doctor ] )
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid patient #{params[:id]}"
      redirect_to front_url, :notice => 'Patient does not exist'
    else
      @patient
    end
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(params[:patient])

    respond_to do |format|
      if @patient.save
        #format.html { redirect_to @patient, :notice => 'Patient was successfully created.' }
        format.html { redirect_to front_url, :notice => 'Patient was successfully created.' }
        format.json { render :json => @patient, :status => :created, :location => @patient }
      else
        format.html { render :action => "new" }
        format.json { render :json => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        #format.html { redirect_to @patient, :notice => 'Patient was successfully updated.' }
        format.html { redirect_to front_url, :notice => 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end
end
