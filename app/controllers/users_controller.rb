class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def mypage
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
    if params[:image]
      #データベースに保存するファイル名はユーザーのid.jpgとする
      @user.profile_image_id = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.profile_image_id}",image.read)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
