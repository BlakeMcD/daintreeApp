class ItemsController < ApplicationController
    before_action :initialize_session
    before_action :increment_visit_count
    before_action :load_cart
    before_action :require_admin_login, :except => [:index, :show]

    def about
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        @item.save
        redirect_to items_path
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        redirect_to items_path
    end

    def index

        # @items = Item.all
        @stores = Store.all #for the stores filter
        
        pst = params[:store]
        pc = params[:category]
        psi = params[:size]
        pg = params[:gender]

        #The mega-if statement...god forgive me
        if !pst.blank? && !pc.blank? && !psi.blank? && !pg.blank?
            @items = Item.store_is_selected(pst).sub_category_is_selected(pc).size_is_selected(psi).gender_is_selected(pg)
        elsif !pst.blank? && !pc.blank? && !psi.blank?
            @items = Item.store_is_selected(pst).sub_category_is_selected(pc).size_is_selected(psi)
        elsif !pst.blank? && !psi.blank? && !pg.blank?
            @items = Item.store_is_selected(pst).size_is_selected(psi).gender_is_selected(pg)
        elsif !pst.blank? && !pc.blank? && !pg.blank?
            @items = Item.store_is_selected(pst).sub_category_is_selected(pc).gender_is_selected(pg)
        elsif !pc.blank? && !psi.blank? && !pg.blank?
            @items = Item.sub_category_is_selected(pc).size_is_selected(psi).gender_is_selected(pg)
        elsif !pst.blank? && !pc.blank?
            @items = Item.store_is_selected(pst).sub_category_is_selected(pc)
        elsif !pst.blank? && !psi.blank?
            @items = Item.store_is_selected(pst).size_is_selected(psi)
        elsif !pst.blank? && !pg.blank?
            @items = Item.store_is_selected(pst).gender_is_selected(pg)
        elsif !pc.blank? && !psi.blank? 
            @items = Item.sub_category_is_selected(pc).size_is_selected(psi)
        elsif !pc.blank? && !pg.blank?
            @items = Item.sub_category_is_selected(pc).gender_is_selected(pg)
        elsif !psi.blank? && !pg.blank?
            @items = Item.size_is_selected(psi).gender_is_selected(pg)
        elsif !pst.blank?
            @items = Item.store_is_selected(pst)
        elsif !pc.blank?
            @items = Item.sub_category_is_selected(pc)
        elsif !psi.blank?
            @items = Item.size_is_selected(psi)
        elsif !pg.blank?
            @items = Item.size_is_selected(pg)
        else
            @items = Item.all
        end
    end

    def add_to_cart
        id = params[:id].to_i
        # raise params.inspect
        session[:cart] << id unless session[:cart].include?(id)
        redirect_to '/items'
    end

    def remove_from_cart    
        id = params[:id].to_i
        session[:cart] -= [id]

        redirect_to '/items'

    end

    private

    def initialize_session
        session[:visit_count] ||= 0
        session[:visit_count] += 1

        session[:cart] ||= []
    end

    def increment_visit_count
        @visit_count = session[:visit_count] #for learning, will remove later
    end

    def load_cart
        @cart = Item.find(session[:cart])
    end

    def item_params
        params.require(:item).permit(:name, :category, :sub_category, :stock, :price_cents, :description,:size, :gender, :img_url, :store_id)
    end

    def require_admin_login
        return head(:forbidden) unless session.include? :admin_name
    end

    

end
