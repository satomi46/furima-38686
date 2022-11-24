class RenamePraceIdColumnToDeliveries < ActiveRecord::Migration[6.0]
  def change
    rename_column :deliveries, :prace_id, :place_id
  end
end
