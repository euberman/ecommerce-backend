class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]
  attr_reader :headers

  def create
    @user = User.find_by(email: auth_params[:email])
    #User#authenticate comes from BCrypt
    if @user && @user.authenticate(auth_params[:password])
      # encode token comes from ApplicationController
      payload = {user_id: @user.id}
      token = encode_token({ user_id: @user.id })
      render json: {user: @user, token: token}
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def profile
    auth_h = request.headers[:Authorization]
    token = auth_h.split(' ')[1]
    de_token = JWT.decode(token, ENV["jwt_secret"])
    user_id = de_token[0]['user_id']
    @user = User.find_by(id: user_id)

    if @user
      render json: @user
    else
      render json: { message: 'Invalid username or password' }
    end    
  end

  private

  def auth_params
    params.require(:user).permit(:email, :password)
  end
end