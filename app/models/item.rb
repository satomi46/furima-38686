class Item < ApplicationRecord

  validates :title,            presence: true
  validates :price,            presence: true
  validates :explanation,      presence: true
  # validates :shipping_cost_id, presence: true
  # validates :category_id,      presence: true
  # validates :status_id,        presence: true
  # validates :place_id,         presence: true
  # validates :days_to_ship_id,  presence: true
  
  validates :shipping_cost_id, numericality: { other_than: 1 }
  validates :category_id,      numericality: { other_than: 1 }
  validates :status_id,        numericality: { other_than: 1 }
  validates :place_id,         numericality: { other_than: 1 }
  validates :days_to_ship_id,  numericality: { other_than: 1 }
  
  belongs_to :user
  belongs_to :shipping_cost
  belongs_to :category
  belongs_to :status
  belongs_to :place
  belongs_to :days_to_ship
end
