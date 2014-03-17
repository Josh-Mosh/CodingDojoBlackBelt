class AddProductColumn < ActiveRecord::Migration
  def change
  	add_column :products, :status, :bool
  end
end
