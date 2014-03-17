class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :product, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
