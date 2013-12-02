class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @answer = Answer.new(answer_params)
    @answer.sentence_id = params[:answer][:sentence]

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Sentence was successfully created.' }
        format.json { render action: 'show'}
      else
        format.html { render action: 'new' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:answer, :explanation)
    end
end
