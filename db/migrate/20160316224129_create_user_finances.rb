class CreateUserFinances < ActiveRecord::Migration
  def change
    create_table :user_finances do |t|
      t.integer :overall_revenue
      t.integer :monthly_revenue
      t.integer :payable
      t.references :user, index: true

      t.timestamps
    end
  end
end
