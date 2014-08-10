require 'spec_helper'

describe 'Cost' do
  describe '#initialize' do
    it 'creates a cost' do
      test_cost = Cost.new({:name => '200'})
      expect(test_cost).to be_an_instance_of Cost
    end
  end

  describe '.all' do
    it 'returns an empty array' do
      expect(Cost.all).to eq []
    end
  end

  describe '#save' do
    it 'saves a cost to the costs table' do
      test_cost = Cost.new({:name => '200'})
      test_cost.save
      expect(Cost.all).to eq [test_cost]
    end
  end

  describe '#edit' do
    it 'edits cost' do
      test_cost = Cost.new({:name => 200})
      test_cost.save
      test_cost.edit('260')
      expect(Cost.all[0].name).to eq '260'
    end
  end
end
