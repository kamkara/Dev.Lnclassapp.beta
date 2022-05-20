class CityEreasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_city_erea, only: %i[ show edit update destroy ]

  # GET /city_ereas or /city_ereas.json
  def index
    @city_ereas = CityErea.all
  end

  # GET /city_ereas/1 or /city_ereas/1.json
  def show
  end

  # GET /city_ereas/new
  def new
    @city_erea = CityErea.new
  end

  # GET /city_ereas/1/edit
  def edit
  end

  # POST /city_ereas or /city_ereas.json
  def create
    @city_erea = current_user.city_ereas.build(city_erea_params)

    respond_to do |format|
      if @city_erea.save
        format.html { redirect_to city_ereas, notice: "City erea was successfully created." }
        format.json { render :show, status: :created, location: @city_erea }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city_erea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /city_ereas/1 or /city_ereas/1.json
  def update
    respond_to do |format|
      if @city_erea.update(city_erea_params)
        format.html { redirect_to city_erea_url(@city_erea), notice: "City erea was successfully updated." }
        format.json { render :show, status: :ok, location: @city_erea }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city_erea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /city_ereas/1 or /city_ereas/1.json
  def destroy
    @city_erea.destroy

    respond_to do |format|
      format.html { redirect_to city_ereas_url, notice: "City erea was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city_erea
      @city_erea = CityErea.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def city_erea_params
      params.require(:city_erea).permit(:title, :slug, :user_id)
    end
end
