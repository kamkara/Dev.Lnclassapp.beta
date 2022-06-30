class BacsController < ApplicationController
  before_action :set_bac, only: %i[ show edit update destroy ]

  # GET /bacs or /bacs.json
  def index
    @bacs = Bac.all
  end

  # GET /bacs/1 or /bacs/1.json
  def show
  end

  # GET /bacs/new
  def new
    @bac = Bac.new
  end

  # GET /bacs/1/edit
  def edit
  end

  # POST /bacs or /bacs.json
  def create
    @bac = Bac.new(bac_params)

    respond_to do |format|
      if @bac.save
        format.html { redirect_to bac_url(@bac), notice: "Bac was successfully created." }
        format.json { render :show, status: :created, location: @bac }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bac.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bacs/1 or /bacs/1.json
  def update
    respond_to do |format|
      if @bac.update(bac_params)
        format.html { redirect_to bac_url(@bac), notice: "Bac was successfully updated." }
        format.json { render :show, status: :ok, location: @bac }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bac.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bacs/1 or /bacs/1.json
  def destroy
    @bac.destroy

    respond_to do |format|
      format.html { redirect_to bacs_url, notice: "Bac was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bac
      @bac = Bac.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bac_params
      params.require(:bac).permit(:title, :content, :slug, :linked)
    end
end
