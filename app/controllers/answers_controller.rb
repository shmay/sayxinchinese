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

  def toggle_starring
    starring = Starring.where(answer_id: params[:id], user_id: current_user.id).first
    respond_to do |format|
      if starring
        if starring.destroy
          format.json { render json: {starred: false} }
        else
          format.json { render json: starring.errors, status: :unprocessable_entity }
        end
      else
        starring = Starring.new(answer_id: params[:id], user_id: current_user.id)
        if starring.save
          format.json {render json: {starred: true} }
        else
          format.json { render json: starring.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def vote
    new_dir = params[:newDir].to_i
    needvote = new_dir != 0

    vote = Vote.where(answer_id: params[:id], user_id: current_user.id).first

    if needvote
      if vote
        vote.direction = new_dir
      else
        vote = Vote.new(answer_id: params[:id], user_id: current_user.id, direction: new_dir)
      end
    elsif vote
      vote.destroy
    end

    respond_to do |format|
      if !needvote
        format.json { render json: {dir: 0} }
      else
        if vote.save
          format.json { render json: {dir: vote.direction} }
        else
          format.json { render json: 'fail', status: :unprocessable_entity }
        end
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
