require 'rspec'
require 'pg'
require 'pry'
require 'wallet'
require 'expense'
require 'company'
require 'category'
require 'cost'



DB = PG.connect({:dbname => 'expenses'})
RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM categorys *;")
    DB.exec("DELETE FROM companys *;")
    DB.exec("DELETE FROM costs *;")
    DB.exec("DELETE FROM expenses *;")
  end
end
