class Home < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :zone

  with_options presence: true do
    validates :home_name
    validates :age
    validates :name
    validates :tel
    validates :email
    validates :prefecture_id
    validates :zone_id
    validates :address
    validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 }
    validates :rate, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 }
    validates :rent, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 }
    validates :management, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 }
    validates :images
  end
  validates :prefecture_id, :zone_id, numericality: { other_than: 1 }
end
