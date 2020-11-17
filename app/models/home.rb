class Home < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :home_name
    validates :age_id
    validates :name
    validates :tel
    validates :email
    validates :prefecture_id
    validates :class_id
    validates :city_id
    validates :address_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :rate, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :rent, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :management, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :images
  end
end
