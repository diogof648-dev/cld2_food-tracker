# frozen_string_literal: true

# Meal class definition
class Meal < ActiveRecord::Base
  belongs_to :user
  belongs_to :meal_type
  belongs_to :product

  validates :portion, presence: true
end
