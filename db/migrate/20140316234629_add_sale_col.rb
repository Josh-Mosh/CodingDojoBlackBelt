class AddSaleCol < ActiveRecord::Migration
  def change
  	add_column :sales, :buyer_id, :integer
  end
end
