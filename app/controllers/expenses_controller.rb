class ExpensesController < ApplicationController

  def create
    budget =  Budget.find(params[:budget_id])
    if budget
      budget.expenses.build(expense_params)
      if budget.save
        render json: BudgetSerializer.new(budget), status: :created
      else
        render json: {errors: budget.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    budget = Budget.find(params[:budget_id])
    expense = Expense.find(params[:id])
    if expense && budget
      expense.destroy
      render json: BudgetSerializer.new(budget), status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end

end
