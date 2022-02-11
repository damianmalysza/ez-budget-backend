class Expense < ApplicationRecord
  belongs_to :budget
  validates :amount, numericality: {greater_than: 0}
end
