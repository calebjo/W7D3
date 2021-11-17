class UsersController < ApplicationController
    # before_action :ensure_logged_in, except: [:new, :create]
    before_action :ensure_logged_out, only: [:new, :create]

    def new 
        @user = User.new
        render :new
    end 

    def index 

    end 

    def show 
    end 

    def destroy
    end 

    def create 
    end 

    def edit 
    end 

    def update 
    end 
    
end