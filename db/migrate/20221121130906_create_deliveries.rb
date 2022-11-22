class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string     :postcode,     null: false
      t.integer    :prace_id,     null: false
      t.string     :city,         null: false
      t.string     :address,      null: false
      t.string     :building
      t.string     :phone_number, null: false
      t.references :purchase,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
