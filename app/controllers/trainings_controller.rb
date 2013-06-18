class TrainingsController < ApplicationController
  # GET /trainings
  # GET /trainings.json
  def index
    @judge = Judge.find(params[:judge_id])
    @trainings = @judge.trainings

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trainings }
    end
  end

  # GET /trainings/1
  # GET /trainings/1.json
  def show
    @judge = Judge.find(params[:judge_id])
    @training = Training.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @training }
    end
  end

  # GET /trainings/new
  # GET /trainings/new.json
  def new
    @judge = Judge.find(params[:judge_id])
    @training = Training.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @training }
    end
  end

  # GET /trainings/1/edit
  def edit
    @judge = Judge.find(params[:judge_id])
    @training = Training.find(params[:id])
  end

  # POST /trainings
  # POST /trainings.json
  def create
    @judge = Judge.find(params[:judge_id])
    @training = @judge.trainings.build(params[:training])

    respond_to do |format|
      if @training.save
        format.html { redirect_to [@judge, @training], notice: 'Training was successfully created.' }
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
    @judge = Judge.find(params[:judge_id])
    @training = Training.find(params[:id])

    respond_to do |format|
      if @training.update_attributes(params[:training])
        format.html { redirect_to [@judge, @training], notice: 'Training was successfully updated.' }
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
    @judge = Judge.find(params[:judge_id])
    @training = Training.find(params[:id])
    @training.destroy

    respond_to do |format|
      format.html { redirect_to judge_trainings_path(@judge) }
      format.json { head :no_content }
    end
  end
end
