class Item < ApplicationRecord
    belongs_to :store, optional:true
    belongs_to :user, optional:true

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
