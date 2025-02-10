class UpdateProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :image, :string, null: true
    add_column :products, :active, :bool, null: false, default: 1
  end
end
