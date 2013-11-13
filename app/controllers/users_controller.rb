class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    #@karma = User.karma(@user.id)
    #@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    #@sentences = @user.sentences
    #@answers_count = Answer.where(user_id: @user.id).count

    #@sentences_json = render_to_string('sentences/index.json')

    @user = User.find params[:id]
    render json: @user, root: false
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_path(@user), notice: 'User was successfully updated.' }
        format.json { render json: @user }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def ensure_correct_user
      if current_user.id != @user.id
        redirect_to profile_path(@user), notice: 'You are not this user'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :info)
    end
end
