class Expense < ApplicationRecord
  belongs_to :budget
  valdates :amount, numericality: {greater_than: 0}
end
