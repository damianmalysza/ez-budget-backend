class BudgetsController < ApplicationController
  def index
    budgets = Budget.all
    render json: BudgetSerializer.new(budgets)
  end

  def create
    budget = Budget.new(budget_params)
    if budget.save
      render json: BudgetSerializer.new(budget), status: :created 
    else
      render json: {errors: budget.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :budget_max)
  end

  
end
