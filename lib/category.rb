class Category < Wallet

  def add_category expense_id
    DB.exec("INSERT INTO expense_category (expense_id, category_id) VALUES (#{expense_id}, #{self.id});")
  end

  def in_category
    expenses = []
    results = DB.exec("SELECT expenses.name FROM expenses JOIN expense_category ON (expense_category.expense_id = expenses.id) WHERE expense_category.category_id = #{self.id};")
  results.each do |exp|
    expenses << exp['name']
  end
  expenses
  end


end