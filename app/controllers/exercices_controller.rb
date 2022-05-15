class ExercicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercice, only: %i[ show edit update destroy ]

  # GET /exercices or /exercices.json
  def index
    @exercices = Exercice.all
  end

  # GET /exercices/1 or /exercices/1.json
  def show
  end

  # GET /exercices/new
  def new
   @findCourse = Course.friendly.find(params[:course_id])
    @exercice = @findCourse.exercices.build()
  end

  # GET /exercices/1/edit
  def edit
  end

  # POST /exercices or /exercices.json
  def create
    @exercice = current_user.exercices.build(exercice_params)
    redirect_to new_exercice_question_path(@exercice) and return if @exercice.save
    render :new
  end

  
  def publish
    @exercice = Exercice.friendly.find(params[:id])
    redirect_to feeds_path and return if @exercice.update(published: true)
        
    flash.notice << [@exercice.errors.full_messages]
    redirect_back fallback_location: "/"
  end
  # PATCH/PUT /exercices/1 or /exercices/1.json
  def update
    respond_to do |format|
      if @exercice.update(exercice_params)
        format.html { redirect_to exercice_url(@exercice), notice: "Exercice was successfully updated." }
        format.json { render :show, status: :ok, location: @exercice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercices/1 or /exercices/1.json
  def destroy
    @exercice.destroy

    respond_to do |format|
      format.html { redirect_to exercices_url, notice: "Exercice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercice
      @exercice = Exercice.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercice_params
      params.require(:exercice).permit(:name, :published, :slug, :user_id, :course_id)
    end
end
