class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
before_action :admin? , only: [:index, :edit,  :update]
before_action :authenticate_user!, only: [:history]

def index
  @users= User.all
end

def history
  @request = Request.where requestor_id: current_user.id
  @request.order(created_at: :asc)
  @standin = Request.where standin_id: current_user.id
  @standin.order(created_at: :asc)
  @event = Event.all
end

 def update
   if @user.update(user_params)
     redirect_to users_path
   else
     render 'index'
   end
 end

private

def admin?
  if !current_user.is_Admin
    redirect_to root_path, :alert => "Hi there, it seems that you might be lost!"
  if !current_user
    redirect_to :new_user_registration, :notice => "Hi there, we invite you to sign up with us"
  end
end
end

def set_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:is_Admin)
end
end
