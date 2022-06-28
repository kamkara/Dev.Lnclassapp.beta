class LandpagesController < ApplicationController
  before_action :set_landpage, only: %i[ show edit update destroy ]

  # GET /landpages or /landpages.json
  def index
    @landpages = Landpage.all
  end

  # GET /landpages/1 or /landpages/1.json
  def show
  end

  # GET /landpages/new
  def new
    @landpage = Landpage.new
  end

  # GET /landpages/1/edit
  def edit
  end

  # POST /landpages or /landpages.json
  def create
    @landpage = Landpage.new(landpage_params)

    respond_to do |format|
      if @landpage.save
        format.html { redirect_to landpage_url(@landpage), notice: "Landpage was successfully created." }
        format.json { render :show, status: :created, location: @landpage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @landpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landpages/1 or /landpages/1.json
  def update
    respond_to do |format|
      if @landpage.update(landpage_params)
        format.html { redirect_to landpage_url(@landpage), notice: "Landpage was successfully updated." }
        format.json { render :show, status: :ok, location: @landpage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @landpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landpages/1 or /landpages/1.json
  def destroy
    @landpage.destroy

    respond_to do |format|
      format.html { redirect_to landpages_url, notice: "Landpage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landpage
      @landpage = Landpage.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def landpage_params
      params.require(:landpage).permit(:title, :content, :slug, :status)
    end
end
