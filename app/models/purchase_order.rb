class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :postal_code, :city, :address, :phone_number, :token
  end
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'code Input correctly' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input only number' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  def save
    @purchase = Purchase.create(item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: @purchase.id)
  end
end