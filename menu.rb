require './lib/wallet'
require './lib/category'
require './lib/company'
require './lib/cost'
require './lib/expense'
require 'pg'
require 'pry'
DB = PG.connect({:dbname => 'expenses'})

def main_menu

  loop do
    puts "Press 'a' to add an expense"
    puts "Press 'l' to list expenses"
    puts "Press 'c' to list categorys"
    puts "Press 'x' to exit"


  user_input = gets.chomp.downcase

  case user_input
    when 'a'
      add_expense
    when 'l'
      list_expenses_all_info
    when 'c'
      list_categorys
    when 'clear'
    DB.exec("DELETE FROM categorys *;")
    DB.exec("DELETE FROM companys *;")
    DB.exec("DELETE FROM costs *;")
    DB.exec("DELETE FROM expenses *;")
    DB.exec("DELETE FROM expense_cost *;")
    DB.exec("DELETE FROM expense_company *;")
    DB.exec("DELETE FROM expense_category *;")
    when 'x'
      puts "Goodbye"
      exit
    else
      puts "please enter a valid option"
    end
  end
end


def add_expense
  puts "Please enter an expense"
  expense_name = gets.chomp
  new_expense = Expense.new({:name => expense_name})
  new_expense.save  
  puts "Enter Cost" 
  input_cost = gets.chomp 
  new_cost = Cost.new({:name => input_cost})
  new_cost.save
  puts "Enter company purchased from"
  input_company = gets.chomp
  new_company = Company.new({:name => input_company})
  new_company.save
  puts "Enter category of purchase"
  input_category = gets.chomp
  new_category = Category.new({:name => input_category})
  new_category.save
  new_expense.add_company(new_company.id)
  new_expense.add_expense(new_cost.id)
  new_expense.add_category(new_category.id)
end

def list_categorys_costs
  Expense.all.each do |expense|
  puts 'Category: ' + "#{expense.list_categorys}" + ', Cost: ' +"#{expense.list_costs}"
  end
end

def list_expenses_all_info
  Expense.all.each do |expense|
    puts 'Item: ' + "#{expense.name}" + ', Cost: ' +"#{expense.list_costs}" +', Company: ' + "#{expense.list_companys}" + ', Category: ' + "#{expense.list_categorys}"
  end
end

def list_categorys
  categories = []
  Expense.all.each do |expense|
    result = "#{expense.list_categorys}" + "#{expense.list_costs}"
    categories << result
    puts categories
  end
  puts "Sort categories (y or n)?"
  answer = gets.chomp.downcase
  if answer ='y' || 'yes'
    puts categories.sort
  end
end


main_menu
