class DiagnosesController < ApplicationController
  # GET /diagnoses
  # GET /diagnoses.json
  def index
    #@diagnoses = Diagnosis.all
     @diagnoses = Diagnosis.paginate :page=>params[:page], :order=>'name asc',
        :per_page => 3
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @diagnoses }
    end
  end

  # GET /diagnoses/1
  # GET /diagnoses/1.json
  def show
    begin
      @diagnosis = Diagnosis.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid diagnosis #{params[:id]}"
      redirect_to front_url, :notice => 'Diagnosis does not exist'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @diagnosis }
      end
    end
  end

  # GET /diagnoses/new
  # GET /diagnoses/new.json
  def new
    @diagnosis = Diagnosis.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @diagnosis }
    end
  end

  # GET /diagnoses/1/edit
  def edit
    begin
      @diagnosis = Diagnosis.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid diagnosis #{params[:id]}"
      redirect_to front_url, :notice => 'Diagnosis does not exist'
    else
      @diagnosis
    end
  end

  # POST /diagnoses
  # POST /diagnoses.json
  def create
    @diagnosis = Diagnosis.new(params[:diagnosis])

    respond_to do |format|
      if @diagnosis.save
        format.html { redirect_to @diagnosis, :notice => 'Diagnosis was successfully created.' }
        format.json { render :json => @diagnosis, :status => :created, :location => @diagnosis }
      else
        format.html { render :action => "new" }
        format.json { render :json => @diagnosis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /diagnoses/1
  # PUT /diagnoses/1.json
  def update
    @diagnosis = Diagnosis.find(params[:id])

    respond_to do |format|
      if @diagnosis.update_attributes(params[:diagnosis])
        format.html { redirect_to @diagnosis, :notice => 'Diagnosis was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @diagnosis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /diagnoses/1
  # DELETE /diagnoses/1.json
  def destroy
    @diagnosis = Diagnosis.find(params[:id])
    @diagnosis.destroy

    respond_to do |format|
      format.html { redirect_to diagnoses_url }
      format.json { head :no_content }
    end
  end
end
