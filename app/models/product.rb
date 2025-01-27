# frozen_string_literal: true

# Product class definition
class Product < ActiveRecord::Base
  belongs_to :product_type

  validates :name, presence: true, uniqueness: true
  validates :kcal, presence: true
  validates :fat, presence: true
  validates :carbohydrates, presence: true
  validates :proteins, presence: true
  validates :product_type_id, presence: true
end
