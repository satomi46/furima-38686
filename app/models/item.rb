class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, presence: true
  validates :title, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :explanation,      presence: true

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :shipping_cost_id
    validates :category_id
    validates :status_id
    validates :place_id
    validates :days_to_ship_id
  end

  belongs_to :user
  belongs_to :shipping_cost
  belongs_to :category
  belongs_to :status
  belongs_to :place
  belongs_to :days_to_ship
  has_one_attached :image
end
