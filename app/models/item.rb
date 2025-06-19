class Item < ApplicationRecord
  belongs_to :payment_type
  has_and_belongs_to_many :categories

  validates_presence_of :name, :amount
end
