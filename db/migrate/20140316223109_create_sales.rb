class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :user, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
