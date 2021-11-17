class SessionsController < ApplicationController
#    before_action :ensure_logged_in, except: [:new, :create]
#    before_action :ensure_logged_out, only: [:new, :create]


    def new 
        render :new 
    end
    
   def create
        @user = User.find_by_credentials(
        params[:user][:username],
        params[:user][:password]
        )
        if @user
            login(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = ['Invalid Credentials']
            render :new
        end
    end 

    def destroy 
        logout! 
        flash[:messages] = ["Successfully Logged Out"]
        redirect_to new_session_url
    end 
end 