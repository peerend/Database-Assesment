require 'spec_helper'

describe 'Expense' do
  describe '#initialize' do
    it 'creates an expense' do
      test_expense = Expense.new({:name => "truing stand"})
      expect(test_expense).to be_an_instance_of Expense
    end
  end

  describe '.all' do
    it 'returns an empty array' do
      expect(Expense.all).to eq []
    end
  end

  describe '#save' do
    it 'saves an expense to the expenses table' do
      test_expense = Expense.new({:name => "Wheel"})
      test_expense.save
      expect(Expense.all).to eq [test_expense]
    end
  end

  describe '#add_expense' do
    it 'associates a cost with an Expense' do
      test_expense = Expense.new({:name => "Bearings"})
      test_expense.save
      test_cost = Cost.new({:name => "20"})
      test_cost.save
      test_expense.add_expense(test_cost.id)
      expect(test_expense.cost_of_expense).to eq ["20"]
    end
  end

  describe '#edit' do
    it 'edits Expense' do
      test_expense = Expense.new({:name => "700c Wheel"})
      test_expense.save
      test_expense.edit("26")
      expect(Expense.all[0]).to eq "26"
    end
  end

  describe '#list_expenses' do
    it 'lists costs with associated expenses' do
      test_expense = Expense.new({:name => "Bearings"})
      test_expense.save
      test_cost = Cost.new({:name => "20"})
      test_cost.save
      test_expense.add_expense(test_cost.id)
      expect(test_cost.list_expenses).to eq ["Bearings"]
    end
  end
end

