class Expense < Wallet

  def add_expense cost_id
    DB.exec("INSERT INTO expense_cost (expense_id, cost_id) VALUES (#{self.id}, #{cost_id});")
  end

  def add_company company_id
    DB.exec("INSERT INTO expense_company (expense_id, company_id) VALUES (#{self.id}, #{company_id});")
  end

  def add_category category_id
    DB.exec("INSERT INTO expense_category (expense_id, category_id) VALUES (#{self.id}, #{category_id});")
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

  def list_companys
    companies = []
    results = DB.exec("SELECT companys.name FROM companys JOIN expense_company ON (expense_company.company_id = companys.id) WHERE expense_company.expense_id = #{self.id};")
  results.each do |exp|
    companies << exp['name']
  end
  companies
  end

  def list_categorys
    categories = []
    results = DB.exec("SELECT categorys.name FROM categorys JOIN expense_category ON (expense_category.category_id = categorys.id) WHERE expense_category.expense_id = #{self.id};")
  results.each do |exp|
    categories << exp['name']
  end
  categories
  end
end