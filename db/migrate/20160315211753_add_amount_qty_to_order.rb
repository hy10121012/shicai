class AddAmountQtyToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :quantity, :integer
    add_column :orders, :amount, :integer
  end
end
