class CreateDeliveryAdderesses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_adderesses do |t|

      t.string  :post_code,           null: false
      t.integer :shipping_area_id,    null: false
      t.string  :city,                null: false
      t.string  :address,             null: false
      t.string  :building_name
      t.string  :phone_number,        null: false
      t.references :order,            foreign_key: true

      t.timestamps
    end
  end
end
