class UsersController < ApplicationController

  def index
    users = User.all
    render json: { users: users }
  end
  def create
    user = User.new(create_params)

    if user.save
      render json: { user: user }
    else
      render json: { message: user.errors.full_messages.join(", ")}
    end
  end

  private
  def create_params
    params.require(:user).permit(:name, :email, :password)
  end
end
