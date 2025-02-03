# frozen_string_literal: true

# Weight class definition
class Weight < ActiveRecord::Base
  belongs_to :user

  validates :weight, presence: true
  validates :date, presence: true
end
