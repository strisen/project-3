class AddAdminCheckToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.boolean :admin, :default => false
    end
  end
end
