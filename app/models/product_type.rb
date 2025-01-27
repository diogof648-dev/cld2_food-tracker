# frozen_string_literal: true

# ProductType class definition
class ProductType < ActiveRecord::Base
  has_many :products

  validates :name, presence: true, uniqueness: true
end
