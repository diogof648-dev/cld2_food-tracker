# frozen_string_literal: true

# MealType class definition
class MealType < ActiveRecord::Base
  has_many :meals

  validates :name, presence: true, uniqueness: true
end
