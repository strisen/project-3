class AddPurchaseIdToProduct < ActiveRecord::Migration[5.1]
  def change
    change_table :products do |t|
      t.references :purchase, foreign_key: true
    end
  end
end
