class StoresController < ApplicationController
    before_action :require_admin_login, :except => [:index, :show]
    # skip_before_action :require_admin_login, only: [:index]



    def index
        @stores = Store.all
        # return head(:forbidden) unless session.include? :admin_name
    end

    def show
        @store = Store.find(params[:id])
    end

    def new
        @store = Store.new
        # raise session.inspect
    end

    def create
        @store = Store.new(store_params)
        @store.save
        redirect_to stores_path
    end

    def edit
        @store = Store.find(params[:id])
    end

    def update
        @store = Store.find(params[:id])
        @store.update(store_params)
        redirect_to stores_path
    end

    private

    def require_admin_login
        return head(:forbidden) unless session.include? :admin_name
    end

    def store_params
        params.require(:store).permit(:name, :description)
    end


end
