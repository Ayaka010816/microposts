class UsersController < ApplicationController
   before_action :set_user,       only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end
  
  def show 
     @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  
  def following
   @user  = User.find(params[:id])
   @following = @user.followed_users
  end  
 
 
 def followers
  @user  = User.find(params[:id])
  @followers = @user.follower_users
 end
    
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end
  
  def destroy
    @micropost = current_user.microposts.find_by(id: params[:id])
    return redirect_to root_url if @micropost.nil?
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end
    
  
  def edit
    @user = User.find(params[:id])
  end
  
    def update
    if @user.update(user_params)
      flash[:success] = "Change your profile"
      # 保存に成功した場合はユーザーページへリダイレクト
      redirect_to @user , notice: 'プロフィールを更新しました'
    else
      # 更新に失敗した場合は編集画面へ戻す
      render 'edit'
    end
    end


   private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:biography, :location)
  end

 def set_user
  @user = User.find(params[:id])
  
 end

end