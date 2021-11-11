class SessionsController < ApplicationController

    # User Session
    def new
        @user = User.new
    end

    def create 

        # ORIGINAL CODE - PASSWORD LOGIN
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user&.authenticate(params[:password])
        session[:user_id] = @user.id
        session[:admin] = @user.admin

        redirect_to items_path

        # #OMNIAUTH
        # @user = User.find_or_create_by(uid: auth['uid']) do |u|
        #     u.name = auth['info']['name']
        #     u.email = auth['info']['email']
        #     u.image = auth['info']['image']
        # end
      
        # session[:user_id] = @user.id
      
        # redirect_to items_path
    end

    def create_facebook
        #OMNIAUTH
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
        end
      
        session[:user_id] = @user.id
        session[:admin] = @user.admin

        p session
      
        redirect_to items_path
    end

    def destroy
        # session.delete :admin_name
        session.delete :user_id
        session.delete :admin
        p session
        redirect_to items_path  #gotta fix this. 
      end

    private

    def auth
        request.env['omniauth.auth']
    end

end