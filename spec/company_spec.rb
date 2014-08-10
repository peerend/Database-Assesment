require 'spec_helper'

describe 'Company' do
  describe '#initialize' do
    it 'creates a company' do
      test_company = Company.new({:name => "SBS"})
      expect(test_company).to be_an_instance_of Company
    end
  end

  describe '.all' do
    it 'returns an empty array' do
      expect(Company.all).to eq []
    end
  end

  describe '#save' do
    it 'saves an Company to the Companys table' do
      test_company = Company.new({:name => "SBS"})
      test_company.save
      expect(Company.all).to eq [test_company]
    end
  end

  describe '#add_company' do
    it 'associates an expense with a company' do
      test_company = Company.new({:name => "SBS"})
      test_company.save
      test_expense = Expense.new({:name => "Bearings"})
      test_expense.save
      test_company.add_company(test_expense.id)
      expect(test_company.bought_from).to eq ["Bearings"]
    end
  end

  describe '#edit' do
    it 'edits company' do
      test_company = Company.new({:name => "SBS"})
      test_company.save
      test_company.edit("cyclone")
      expect(Company.all[0]).to eq "cyclone"
    end
  end
end
