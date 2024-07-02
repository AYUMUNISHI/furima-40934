class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone, :order, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :postcode, :prefecture_id, :city, :block, :token
    validates :phone, format: {with: /\A^0[789]0\d{7,8}\z/}
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id,numericality: { other_than: 1 }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: "", phone: phone, order_id: order.id)
  end
end