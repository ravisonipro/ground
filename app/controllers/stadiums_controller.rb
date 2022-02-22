class StadiumsController < ApplicationController
before_action :set_stadium, only: %i[ show edit update destroy ]
before_action :authenticate_user!
load_and_authorize_resource

  # GET /stadiums or /stadiums.json
  def index
    @stadiums = Stadium.all
  end

  # GET /stadiums/1 or /stadiums/1.json
  def show
    @stadium = Stadium.find(params[:id])
  end

  # GET /stadiums/new
  def new
    @stadium = current_user.stadiums.build
  end

  # GET /stadiums/1/edit
  def edit
  end

  # POST /stadiums or /stadiums.json
  def create
    @stadium = current_user.stadiums.build(stadium_params)
    
    respond_to do |format|
      if @stadium.save
        format.html { redirect_to @stadium, notice: "Stadium was successfully created." }
        format.json { render :show, status: :created, location: @stadium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stadium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stadiums/1 or /stadiums/1.json
  def update
    respond_to do |format|
      if @stadium.update(stadium_params)
        format.html { redirect_to @stadium, notice: "Stadium was successfully updated." }
        format.json { render :show, status: :ok, location: @stadium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stadium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stadiums/1 or /stadiums/1.json
  def destroy
    @stadium = Stadium.find(params[:id])
    @stadium.destroy
    respond_to do |format|
      format.html { redirect_to stadiums_url, notice: "Stadium was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or 4.2 JSON parameters
  def set_stadium
    @stadium = Stadium.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def stadium_params
    params.permit(:s_name, :s_type, :info, :location, :picture)
  end

end