class SessionsController < ApplicationController

    # User Session
    def new
        @user = User.new
    end

    def create 
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user&.authenticate(params[:password])
        # raise params.inspect
        # session[:admin_name] = params[:admin_name]
        # user = User.find_by(username: params[:username])
        # user = user.try(authenticate, params[:username][:password])
        # return head(:forbidden) unless user
        # raise params.inspect
        # return head(:forbidden) unless user.authenticate(params[:password])
        session[:user_id] = @user.id

        redirect_to items_path
    end

    def destroy
        # session.delete :admin_name
        session.delete :username
        redirect_to items_path  #gotta fix this. 
      end


    #STORE SESSIONS
    # def new
    #     redirect_to '/store/login'
    # end

    # def create
    #     if !params[:name] || params[:name].empty?
    #         redirect_to '/store/login'
    #     else
    #         session[:name] = params[:name]
    #         redirect_to '/stores'
    #     end
    # end
end