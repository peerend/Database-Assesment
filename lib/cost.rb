class Cost < Wallet

  def list_expenses
    all_expenses = []
    results = DB.exec("SELECT expenses.name FROM expenses JOIN expense_cost ON (expense_cost.expense_id = expenses.id) WHERE cost_id = '#{self.id}';")
    results.each do |expense|
      all_expenses << expense['name']
    end
    all_expenses
  end

  def total_expenditures
    
end