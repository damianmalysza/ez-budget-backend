class BudgetSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :budget_max 

  attributes :expenses do |budget|
    return_array = []
    budget.expenses.each do |expense|
      expense_hash = {}
      expense_hash[:name] = expense.name
      expense_hash[:amount] = expense.amount
      return_array << expense_hash
    end
    return_array
  end
end
