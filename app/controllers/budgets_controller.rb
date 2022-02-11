class BudgetsController < ApplicationController
  def index
    budgets = Budget.all
    render json: BudgetSerializer.new(budgets)
  end

  def create
    budget = Budget.new(budget_params)
    if budget.save
      render json: BudgetSerializer.new(budget), status: :ok
    else
      render json: {errors: budget.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    budget = Budget.find(params[:id])
    if budget
      budget.expenses.destroy_all
      budget.destroy
      render json: BudgetSerializer.new(budget), status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :budget_max)
  end

  
end
