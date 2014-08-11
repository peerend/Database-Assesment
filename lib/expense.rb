class Expense < Wallet

  def add_expense cost_id
      DB.exec("INSERT INTO expense_cost (expense_id, cost_id) VALUES (#{self.id}, #{cost_id});")
  end

  def cost_of_expense
    expenses = []
    results = DB.exec("SELECT costs.name FROM
      costs JOIN expense_cost ON (expense_cost.cost_id = costs.id)
      WHERE expense_id = '#{self.id}';")
    results.each do |exp|
      expenses << exp['name']
    end
    expenses
  end

  def list_costs
    all_costs = []
    results = DB.exec("SELECT costs.name FROM costs JOIN expense_cost ON (expense_cost.cost_id = costs.id) WHERE expense_id = '#{self.id}';")
    results.each do |cost|
      all_costs << cost['name']
    end
    all_costs
  end
end