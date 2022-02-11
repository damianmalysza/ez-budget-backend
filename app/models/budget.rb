class Budget < ApplicationRecord
  has_many :expenses

  validates :name, presence: true

  def expense_total
    total = 0
    self.expenses.each {|expense| total += expense.amount}
    total
  end
end
