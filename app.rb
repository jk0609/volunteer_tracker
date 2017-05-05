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

get('/projects/:project_id') do
  @project = Project.find(params[:project_id].to_i)
  @volunteers = Volunteer.all
  erb(:one_project)
end

get('/volunteers') do
  @volunteers = Volunteer.all
  erb(:all_volunteers)
end

post('/volunteers') do
  new_volunteer = Volunteer.new({:id=>nil, :name=>params[:volunteer_name]})
  new_volunteer.save
  @volunteers = Volunteer.all
  erb(:all_volunteers)
end

get('/volunteers/:volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i)
  @project = Project.find(@volunteer['project_id'].to_i)
  erb(:one_volunteer)
end
