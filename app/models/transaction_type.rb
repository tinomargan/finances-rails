class TransactionType < ApplicationRecord
  has_many :items

  validates_presence_of :name
end
