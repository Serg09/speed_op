class UsersController < ApplicationController
  before_create :create_activation_digest

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.needs_verification!
      # session[:user_id] = @user.id
      # redirect_to root_path,
      #   notice: "Welcome to Speed Op #{@user.first_name.titleize} "
      redirect_to login_path,
        notice: "#{@user.first_name.titleize}, Please check your email for a verification link"
    else
      render :new
    end

  end

  private
  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email,
      :password, :password_confirmation
    )
  end

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end
