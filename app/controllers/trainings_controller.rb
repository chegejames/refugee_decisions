class TrainingsController < ApplicationController
  before_filter :authenticate_user!, :except => ["index", "show"]
  load_and_authorize_resource :except => [:index, :show]
  # GET /trainings
  # GET /trainings.json
  def publish
    @training = Training.find(params[:id])
    @training.publish
    respond_to do |format|
      format.html { redirect_to @training, notice: 'Training was successfully published.' }
    end
  end

  def retract
    @training = Training.find(params[:id])
    @training.retract
    respond_to do |format|
      format.html { redirect_to @training, notice: 'Training was successfully retracted.' }
    end
  end
  def participants
    @training = Training.find(params[:id])
    @date = params[:date]
    @location = params[:location]
    @training_sessions = @training.training_sessions.where(:date => params[:date], :location => params[:location])
    @judges = @training_sessions.map{|x| x.judge}
  end

  def index
    if user_signed_in?
      @search = Training.search(params[:q])
      @trainings = @search.result.paginate(:page => params[:page], :per_page => 10).order("id ASC")
    else
      @search = Training.search(params[:q])
      @trainings = @search.result.paginate(:page => params[:page], :per_page => 10).order("id ASC").publish?
    end
    if request.xhr?
        render :partial => 'trainings', :object => @trainings, :content_type => 'text/html'
      else
        respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @trainings }
      end
      end
  end

  # GET /trainings/1
  # GET /trainings/1.json
  def show
    @training = Training.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @training }
    end
  end

  # GET /trainings/new
  # GET /trainings/new.json
  def new
    @training = Training.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @training }
    end
  end

  # GET /trainings/1/edit
  def edit
    @training = Training.find(params[:id])
  end

  # POST /trainings
  # POST /trainings.json
  def create
    @training = Training.new(params[:training])

    respond_to do |format|
      if @training.save
        format.html { redirect_to @training, notice: 'Training was successfully created.' }
        format.json { render json: @training, status: :created, location: @training }
      else
        format.html { render action: "new" }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trainings/1
  # PUT /trainings/1.json
  def update
    @training = Training.find(params[:id])

    respond_to do |format|
      if @training.update_attributes(params[:training])
        format.html { redirect_to @training, notice: 'Training was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.json
  def destroy
    @training = Training.find(params[:id])
    @training.destroy

    respond_to do |format|
      format.html { redirect_to trainings_path }
      format.json { head :no_content }
    end
  end
end
