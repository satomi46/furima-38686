class PurchaseDelivery
  extend ActiveHash::Associations::ActiveRecordExtensions

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :place_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :place_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A0\d{9,10}\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Delivery.create(postcode: postcode, place_id: place_id, city: city, address: address,
                    building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end