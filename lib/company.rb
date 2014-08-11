class Company < Wallet

  def add_company expense_id
    DB.exec("INSERT INTO expense_company (expense_id, company_id) VALUES (#{expense_id}, #{self.id});")
  end

  def bought_from
    expenses = []
    results = DB.exec("SELECT expenses.name FROM expenses JOIN expense_company ON (expense_company.expense_id = expenses.id) WHERE expense_company.company_id = #{self.id};")
  results.each do |exp|
    expenses << exp['name']
  end
  expenses
  end
end