class Home < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :zone
  belongs_to :resident

  with_options presence: true do
    validates :home_name
    validates :age
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :tel, format: { with: /\A\d{10,11}\z/ }
    validates :email, format: {with: /\A\S+@\S+\.\S+\z/}
    validates :prefecture_id
    validates :zone_id
    validates :address
    validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 }
    validates :rate, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 }
    validates :rent, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 }
    validates :management, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 }
    validates :resident_id
    validates :images
  end
  validates :prefecture_id, :zone_id, :resident_id, numericality: { other_than: 1 }
end
