class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :product_types do |t|
      t.string :name, null: false
    end

    create_table :products do |t|
      t.string :name, null: false
      t.integer :kcal, null: false
      t.integer :fat, null: false
      t.integer :carbohydrates, null: false
      t.integer :proteins, null: false
      t.belongs_to :product_type, null: false
      t.timestamps
    end

    add_index :product_types, :name, unique: true
    add_index :products, :name, unique: true
  end
end
