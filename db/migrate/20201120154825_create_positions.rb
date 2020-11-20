class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.string :emetteur
      t.string :isin
      t.integer :quantity

      t.timestamps
    end
  end
end
