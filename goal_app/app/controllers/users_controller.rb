class UsersController < ApplicationController
    # before_action :ensure_logged_in, except: [:new, :create]
    # before_action :ensure_logged_out, only: [:new, :create]

    def new 
        @user = User.new
        render :new
    end 

    def index 
        @users = User.all
        render :index
    end 

    def show 
        @user = User.find(params[:id])
        render :show
    end 

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            login!(@user)
            redirect_to user_url(@user)
        else 
            flash.now[:errors] = @user.errors.full_messages
            render :new 
        end 
    end 

    private 
    def user_params
        params.require(:user).permit(:username, :password) 
    end 
    
end