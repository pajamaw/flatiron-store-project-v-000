class ChangeQuantityInLineItems < ActiveRecord::Migration
  def change
    rename_column :line_items, :quanity, :quantity
  end
end
