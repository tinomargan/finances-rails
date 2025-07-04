class Item < ApplicationRecord
  belongs_to :payment_type
  belongs_to :transaction_type
  belongs_to :category

  validates_presence_of :amount
end
