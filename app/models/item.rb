class Item < ApplicationRecord
  belongs_to :payment_type

  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories

  validates_presence_of :name, :amount
end
