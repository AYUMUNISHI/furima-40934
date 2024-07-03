class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address
  has_many :comments, dependent: :destroy

end
