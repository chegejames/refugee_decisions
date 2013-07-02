class CasesController < ApplicationController
  # GET /cases
  # GET /cases.json
  def index
    @search = Case.search(params[:q])
    @cases = @search.result.paginate(:page => params[:page], :per_page => 10).order("id ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.mobile
      format.json { render json: @cases }
    end
  end

  # GET /cases/1
  # GET /cases/1.json
  def show
    @case = Case.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.mobile
      format.json { render json: @case }
    end
  end

  # GET /cases/new
  # GET /cases/new.json
  def new
    @case = Case.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @case }
    end
  end

  # GET /cases/1/edit
  def edit
    @case = Case.find(params[:id])
  end

  # POST /cases
  # POST /cases.json
  def create
    @judge = Judge.find(params[:case][:judge])
    @cause = Cause.find(params[:case][:cause])
    @case = Case.new(params[:case].except(:judge, :cause))

    respond_to do |format|
      if @case.save
        @judge.cases << @case
        @cause.cases << @case
        format.html { redirect_to @case, notice: 'Case was successfully created.' }
        format.json { render json: @case, status: :created, location: @case }
      else
        format.html { render action: "new" }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cases/1
  # PUT /cases/1.json
  def update
    @case = Case.find(params[:id])

    respond_to do |format|
      if @case.update_attributes(params[:case].except(:judge, :cause))
        format.html { redirect_to @case, notice: 'Case was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cases/1
  # DELETE /cases/1.json
  def destroy
    @case = Case.find(params[:id])
    @case.destroy

    respond_to do |format|
      format.html { redirect_to cases_url }
      format.json { head :no_content }
    end
  end
end
