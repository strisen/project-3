class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :description
      t.float :price
      t.string :picture
      t.integer :status, :default => 0
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
