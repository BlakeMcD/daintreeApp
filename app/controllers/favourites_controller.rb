class FavouritesController < ApplicationController 

    def index
        user = User.find(params[:user_id])
        @favourites = user.favourite_items
    end

end