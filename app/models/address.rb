class Address < ApplicationRecord

    belongs_to :user, optional: true

    # validates :street_address, presence: true
    
    # validates :username, uniqueness: true, presence: true
    # validates :password, presence: true, length: { minimum: 5 }
    # validates :first_name, presence: true
    # validates :last_name, presence: true
    # validates :email, uniqueness: true, presence: true
    # validates :phone, presence: true
    # validates :dob, presence: true
end
