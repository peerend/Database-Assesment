require 'spec_helper'

describe 'Category' do
  describe '#initialize' do
    it 'creates a category' do
      test_category = Category.new({:name => 'parts'})
      expect(test_category).to be_an_instance_of Category
    end
  end

  describe '.all' do
    it 'returns an empty array' do
      expect(Category.all).to eq []
    end
  end

  describe '#save' do
    it 'saves a category to the categorys table' do
      test_category = Category.new({:name => 'parts'})
      test_category.save
      expect(Category.all).to eq [test_category]
    end
  end

  describe '#add_category' do
    it 'gives the expenses in a category' do
      test_expense = Expense.new({:name => "Bearings"})
      test_expense.save
      test_category = Category.new({:name => "parts"})
      test_category.save
      test_category.add_category(test_expense.id)
      expect(test_category.in_category).to eq ["Bearings"]
    end
  end

  describe '#edit' do
    it 'edits category' do
      test_category = Category.new({:name => 'parts'})
      test_category.save
      test_category.edit('tools')
      expect(Category.all[0].name).to eq 'tools'
    end
  end
end
