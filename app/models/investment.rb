class Investment < ApplicationRecord

  validates :name, :isin, :emetteur, :quantity, :price, presence: true

end
