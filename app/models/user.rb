class User < ApplicationRecord
    has_secure_password
    has_many :items
    has_many :stores, through: :items
    has_one :address
    
    accepts_nested_attributes_for :address

    # accepts_nested_attributes_for :address, reject_if: :address_is_blank

    validates :username, uniqueness: true, presence: true
    validates :password, presence: true, length: { minimum: 5 }
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, uniqueness: true, presence: true
    validates :phone, presence: true
    validates :dob, presence: true


    # def number_not_allowed
    #     # raise params.inspect
    #     # if params[:user][:first_name].include?('/[0-9]/')
    #         if first_name.include?('/[0-9]/')
    #         errors.add(:first_name, "Name cannot contain numbers")
    #     end  
    # end

    # def address_is_blank(attributes)
    #     raise session.inspect
    #     attributes['street_address'].empty?
    # end 

end
