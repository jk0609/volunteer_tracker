require('./lib/volunteer')
require('./lib/project')
require('rspec')
require('capybara')
require('pg')

DB = PG.connect({:dbname=>'volunteer_tracker_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM volunteers *;")
    DB.exec("DELETE FROM projects *;")
  end
end
