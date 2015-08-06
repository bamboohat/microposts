class UsersController < ApplicationController
  
  def show
    @method = __method__.to_s
    @user = User.find(params[:id])
    @microposts = @user.microposts
    
    respond_to do |format|
      format.html
      format.csv { send_data @user.microposts.to_csv, filename: "microposts.txt" }
    end
      
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def followings
    @method = __method__.to_s
    @user = User.find(params[:id])
    @followings = @user.following_users
    render 'users/show'
  end
  
  def followers
    @method = __method__.to_s
    @user = User.find(params[:id])
    @followers = @user.followed_users
    render 'users/show'
  end
    
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
      
end
