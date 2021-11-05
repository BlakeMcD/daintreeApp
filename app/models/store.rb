class Store < ApplicationRecord
    # validates :description, presence: true
    has_many :items
    has_many :users, through: :items

end
