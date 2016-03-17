class CreateAttributeOverrides < ActiveRecord::Migration
  def change
    create_table :attribute_overrides do |t|
      t.string :type
      t.string :scope
      t.string :attr_value
      t.integer :attr_entity_id
      t.integer :start_date
      t.integer :end_date
      t.text :comment

      t.timestamps
    end
  end
end
