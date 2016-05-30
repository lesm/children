class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @teacher = User.new
  end

  def edit
    @teacher = Post.find(params[:id])
  end

  def create
  end

  def show
    @teacher = User.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name,:email)    
  end
end
