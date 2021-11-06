class UsersController < ApplicationController
    before_action :require_admin_login, :only => [:index]

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @address = Address.where(user_id: @user.id)

        unless session[:admin] == true || session[:user_id] == @user.id
            flash[:alert] = "You don't have permission to access this, ya swine!"
            redirect_to items_path
        end
    end

    def new
        @user = User.new
        # Create Stubs
        @user.build_address(address_type: 'work')
    end

    def create
        # @user = User.new(user_params)
        # @user.save
        User.create(user_params)
        redirect_to users_path
    end

    def edit
        @user = User.find(params[:id])
        # raise @user.inspect
        @address = @user.address
        # raise @address.inspect

        unless session[:admin] == true || session[:user_id] == @user.id
            flash[:alert] = "You don't have permission to access this, ya swine!"
            redirect_to items_path
        end
    end

    def update
        # raise params.inspect
        @user = User.find(params[:id])
        @user.update(user_params)

        redirect_to users_path
    end

    # def destroy
    #     redirect_to stores_path
    # end

    private 

    def require_admin_login
        if session[:admin] == false
            return head(:forbidden)
        end
    end

    def user_params
        params.require(:user).permit(
            :username, 
            :password,
            :first_name, 
            :last_name, 
            :email, 
            :phone, 
            :dob,
            address_attributes: [
                :street_address,
                :city,
                :state,
                :postcode,
                :address_type
                ]
        )
    end
end
