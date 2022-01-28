class CreateBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :budgets do |t|
      t.string :name
      t.float :budget_max

      t.timestamps
    end
  end
end
