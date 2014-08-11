require './lib/wallet'
require './lib/category'
require './lib/company'
require './lib/cost'
require './lib/expense'
require 'pg'
DB = PG.connect({:dbname => 'expenses'})

def main_menu

  loop do
    puts "Press 'a' to add an expense"
    puts "Press 'l' to list expenses"
    puts "Press 'x' to exit"


  user_input = gets.chomp.downcase

  case user_input
    when 'a'
      add_expense
    when 'l'
      list_expenses
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
  puts "Expense Added"   
  puts "Enter Cost" 
  input_cost = gets.chomp 
  new_cost = Cost.new({:name => input_cost})
  new_cost.save
  new_expense.add_expense(new_cost.id)
end

def list_expenses
  Expense.all.each do |expense|
    puts 'Item: ' + "#{expense.name}" + ', Cost: ' +"#{expense.list_costs}"
  end
end

main_menu
