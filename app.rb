require('sinatra')
require('sinatra/reloader')
require('./lib/volunteer')
require('./lib/project')
require('pry')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => 'volunteer_tracker'})

get('/') do
  @projects = Project.all
  erb(:index)
end

post('/') do
  new_project = Project.new({:id=>nil, :name=>params[:project_name]})
  new_project.save
  @projects = Project.all
  erb(:index)
end

get('/volunteers') do

end
