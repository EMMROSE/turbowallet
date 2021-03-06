class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments do |t|
      t.string :emetteur
      t.string :isin
      t.string :name
      t.integer :quantity
      t.float :price
      t.float :value, default: 0.00

      t.timestamps
    end
  end
end
