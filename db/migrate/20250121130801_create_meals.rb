class CreateMeals < ActiveRecord::Migration[7.2]
  def change
    create_table :meal_types do |t|
      t.string :name, null: false
    end

    create_table :meals do |t|
      t.timestamps
      t.integer :portion
      t.belongs_to :meal_type, null: false
      t.belongs_to :product, null: false
      t.belongs_to :user, null: false
    end

    add_index :meal_types, :name, unique: true
  end
end
