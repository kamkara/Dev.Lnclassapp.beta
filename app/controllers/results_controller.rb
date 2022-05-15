class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_result, only: %i[ show edit update destroy ]

  def new
    @result = Exercice.friendly.find(params[:exercice_id]).build_result()
  end
    
  def create
    @result = Result.new(result_params.merge({user: current_user}))
    redirect_to course_path(@result.exercice.course) and return if @result.save
    render :new
  end


  # GET /results or /results.json
  def index
    @results = Result.all
  end

  # GET /results/1 or /results/1.json
  def show
  end


  # GET /results/1/edit
  def edit
  end

  # PATCH/PUT /results/1 or /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to result_url(@result), notice: "Result was successfully updated." }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1 or /results/1.json
  def destroy
    @result.destroy

    respond_to do |format|
      format.html { redirect_to results_url, notice: "Result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def result_params
      params.require(:result).permit(:user_id, :exercice_id, answered_questions_attributes: [:answer_id, :question_id])
    end
end
