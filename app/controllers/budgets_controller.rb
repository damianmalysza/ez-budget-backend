class BudgetsController < ApplicationController
  def index
    budgets = Budget.all
    render json: BudgetSerializer.new(budgets)
  end

  def create

  end

  
end
