class CreateWeights < ActiveRecord::Migration[7.2]
  def change
    create_table :weights do |t|
      t.integer :weight, null: false
      t.date :date, null: false
      t.belongs_to :user, null: false
    end
  end
end
