class Item < ApplicationRecord
    belongs_to :store, optional:true
    belongs_to :user, optional:true

    has_many :favourites
    has_many :users, through: :favourites

    validates :name, presence: true
    validates :category, presence: true
    validates :sub_category, presence: true
    validates :stock, presence: true
    validates :price_cents, presence: true
    validates :description, presence: true
    validates :size, presence: true
    validates :gender, presence: true
    validates :img_url, presence: true
    validates :store_id, presence: true

    scope :store_is_selected, ->(store_id) { where(store: store_id)}
    scope :sub_category_is_selected, ->(category) { where(sub_category: category)}
    scope :size_is_selected, ->(size) { where(size: size)}
    scope :gender_is_selected, ->(gender) { where(gender: gender)}

    def self.by_store(store_id)
        where(store: store_id) 
    end


    def self.by_sub_category(sub_category)
        if sub_category == "Jeans"
            where(sub_category: "jeans")
        elsif sub_category == "Shirts"
            where(sub_category: "shirt")
        else #sub_category == jacket
            where(sub_category: "jacket")
        end
    end

    def self.jeans
        where(sub_category: "jeans")
    end

    def self.shirt
        where(sub_category: "shirt")
    end

    def self.jacket
        where(sub_category: "jacket")
    end

    
end
