class ItemsController < ApplicationController
    before_action :initialize_session
    before_action :increment_visit_count
    before_action :load_cart
    before_action :require_admin_login, :except => [:index, :show, :men, :women, :home]

    def about
    end

    def home
        @stores = Store.all
    end

    def new
        # raise session.inspect
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        if @item.valid?
            @item.save
            redirect_to "/items"
        else
            render :new
        end
        # @item.save
        # redirect_to items_path

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
   
        @stores = Store.all #for the stores filter



        #change what @stores is based on the route
        if params[:store_id]

    
            pc = params[:category]
            psi = params[:size]
            pg = params[:gender]
            #The mega-if statement...god forgive me
            #The mega-if statement...god forgive me
            if !pg.blank? && !pc.blank? && !psi.blank?
                items = Item.sub_category_is_selected(pc).size_is_selected(psi).gender_is_selected(pg)
            elsif !pg.blank? && !psi.blank?
                items = Item.size_is_selected(psi).gender_is_selected(pg)
            elsif !pg.blank? && !pc.blank?
                items = Item.sub_category_is_selected(pc).gender_is_selected(pg)
            elsif !pc.blank? && !psi.blank?
                items = Item.sub_category_is_selected(pc).size_is_selected(psi)
            elsif !pg.blank? && !pc.blank?
                items = Item.sub_category_is_selected(pc).gender_is_selected(pg)
            elsif !pg.blank? 
                items = Item.gender_is_selected(pg)
            elsif !pc.blank?
                items = Item.sub_category_is_selected(pc)
            elsif !psi.blank?
                items = Item.size_is_selected(psi)
            else
                items = Item.all
            end

            @store = params[:store_id]
            @items = items.where(store_id: @store)

            @store_route = true
        else
            
            pst = params[:store]
            pc = params[:category]
            psi = params[:size]
            pg = params[:gender]
            #The mega-if statement...god forgive me
            if !pst.blank? && !pc.blank? && !psi.blank? && !pg.blank?
                items = Item.store_is_selected(pst).sub_category_is_selected(pc).size_is_selected(psi).gender_is_selected(pg) 
            elsif !pst.blank? && !pc.blank? && !psi.blank?
                items = Item.store_is_selected(pst).sub_category_is_selected(pc).size_is_selected(psi)
            elsif !pst.blank? && !psi.blank? && !pg.blank?
                items = Item.store_is_selected(pst).size_is_selected(psi).gender_is_selected(pg)
            elsif !pst.blank? && !pc.blank? && !pg.blank?
                items = Item.store_is_selected(pst).sub_category_is_selected(pc).gender_is_selected(pg)
            elsif !pc.blank? && !psi.blank? && !pg.blank?
                items = Item.sub_category_is_selected(pc).size_is_selected(psi).gender_is_selected(pg)
            elsif !pst.blank? && !pc.blank?
                items = Item.store_is_selected(pst).sub_category_is_selected(pc)
            elsif !pst.blank? && !psi.blank?
                items = Item.store_is_selected(pst).size_is_selected(psi)
            elsif !pst.blank? && !pg.blank?
                items = Item.store_is_selected(pst).gender_is_selected(pg)
            elsif !pc.blank? && !psi.blank? 
                items = Item.sub_category_is_selected(pc).size_is_selected(psi)
            elsif !pc.blank? && !pg.blank?
                items = Item.sub_category_is_selected(pc).gender_is_selected(pg)
            elsif !psi.blank? && !pg.blank?
                items = Item.size_is_selected(psi).gender_is_selected(pg)
            elsif !pst.blank?
                items = Item.store_is_selected(pst)
            elsif !pc.blank?
                items = Item.sub_category_is_selected(pc)
            elsif !psi.blank?
                items = Item.size_is_selected(psi)
            elsif !pg.blank?
                items = Item.size_is_selected(pg)
            else
                items = Item.all
            end

            @items = items

            @store_route = false
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

    def remove_from_cart_in_cart
        id = params[:id].to_i
        session[:cart] -= [id]

        redirect_to '/cart'
    end

    

    def men
        @stores = Store.all #for the stores filter

        pst = params[:store]
        pc = params[:category]
        psi = params[:size]

        #The mega-if statement...god forgive me
        if !pst.blank? && !pc.blank? && !psi.blank?
           items = Item.store_is_selected(pst).sub_category_is_selected(pc).size_is_selected(psi)
        elsif !pst.blank? && !psi.blank?
           items = Item.store_is_selected(pst).size_is_selected(psi)
        elsif !pst.blank? && !pc.blank?
           items = Item.store_is_selected(pst).sub_category_is_selected(pc)
        elsif !pc.blank? && !psi.blank?
           items = Item.sub_category_is_selected(pc).size_is_selected(psi)
        elsif !pst.blank? && !pc.blank?
           items = Item.store_is_selected(pst).sub_category_is_selected(pc)
        elsif !pst.blank? 
           items = Item.store_is_selected(pst)
        elsif !pc.blank?
           items = Item.sub_category_is_selected(pc)
        elsif !psi.blank?
           items = Item.size_is_selected(psi)
        else
           items = Item.all
        end
        @items = items.where(gender: 'M')
    end

    def women
        @stores = Store.all #for the stores filter

        pst = params[:store]
        pc = params[:category]
        psi = params[:size]

        #The mega-if statement...god forgive me
        if !pst.blank? && !pc.blank? && !psi.blank?
           items = Item.store_is_selected(pst).sub_category_is_selected(pc).size_is_selected(psi)
        elsif !pst.blank? && !psi.blank?
           items = Item.store_is_selected(pst).size_is_selected(psi)
        elsif !pst.blank? && !pc.blank?
           items = Item.store_is_selected(pst).sub_category_is_selected(pc)
        elsif !pc.blank? && !psi.blank?
           items = Item.sub_category_is_selected(pc).size_is_selected(psi)
        elsif !pst.blank? && !pc.blank?
           items = Item.store_is_selected(pst).sub_category_is_selected(pc)
        elsif !pst.blank? 
           items = Item.store_is_selected(pst)
        elsif !pc.blank?
           items = Item.sub_category_is_selected(pc)
        elsif !psi.blank?
           items = Item.size_is_selected(psi)
        else
           items = Item.all
        end
        @items = items.where(gender: 'F')
    end

    def cart
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
    
        if session[:admin] != true
            return head(:forbidden)
        end

    end
    

end
