class ProfsController < ApplicationController
  before_filter :authenticate_user!, :only => [:destroy, :edit ]
  # GET /profs
  # GET /profs.json
  def index
    @profs = Prof.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profs }
    end
  end

  # GET /profs/1
  # GET /profs/1.json
  def show
    @prof = Prof.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prof }
    end
  end

  # GET /profs/new
  # GET /profs/new.json
  def new
    @prof = Prof.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prof }
    end
  end

  # GET /profs/1/edit
  def edit
    @prof = Prof.find(params[:id])
  end

  # POST /profs
  # POST /profs.json
  def create
    @prof = Prof.new(params[:prof])

    respond_to do |format|
      if @prof.save
        format.html { redirect_to @prof, notice: 'Prof was successfully created.' }
        format.json { render json: @prof, status: :created, location: @prof }
      else
        format.html { render action: "new" }
        format.json { render json: @prof.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profs/1
  # PUT /profs/1.json
  def update
    @prof = Prof.find(params[:id])

    respond_to do |format|
      if @prof.update_attributes(params[:prof])
        format.html { redirect_to @prof, notice: 'Prof was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @prof.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profs/1
  # DELETE /profs/1.json
  def destroy
    @prof = Prof.find(params[:id])
    @prof.destroy

    respond_to do |format|
      format.html { redirect_to profs_url }
      format.json { head :ok }
    end
  end
end
