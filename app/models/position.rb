class Position < ApplicationRecord
  belongs_to :user

  validates :isin, presence: true
  validates :emetteur, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
end
