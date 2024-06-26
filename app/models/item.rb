class Item < ApplicationRecord
 belongs_to :user
#  has_one :order
 has_one_attached :image
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :category
 belongs_to :status
 belongs_to :freight
 belongs_to :prefecture
 belongs_to :shipping_date
 



 validates :product, :description, :price, :image, presence: true 
 validates :category_id, :status_id, :freight_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 1 } 
 validates :price, numericality: {
  only_integer: true,
  greater_than_or_equal_to: 300,
  less_than_or_equal_to: 9999999
}
end
