class Store < ApplicationRecord
    # validates :description, presence: true
    has_many :items
    has_many :users, through: :items

    validates :name, presence: true
    validates :description, presence: true
    validates :logo_url_square, presence: true
    validates :logo_url_landscape, presence: true

end
