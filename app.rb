require('sinatra')
require('sinatra/reloader')
require('./lib/volunteer')
require('./lib/project')
require('pry')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => 'volunteer_tracker'})

#all projects
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

delete('/') do
  Project.find(params[:project_id]).delete
  @projects = Project.all
  erb(:index)
end

#individual project
get('/projects/:project_id') do
  @project = Project.find(params[:project_id])
  @volunteers = Volunteer.all
  erb(:one_project)
end

post('/projects/:project_id') do
  @project = Project.find(params[:project_id])
  @project.update_volunteers(params[:volunteer_ids])

  @volunteers = Volunteer.all
  erb(:one_project)
end

patch('/projects/:project_id') do
  @project = Project.find(params[:project_id])
  @project.update(params[:new_name])
  @volunteers = Volunteer.all
  erb(:one_project)
end

#all volunteers
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

delete('/volunteers') do
  Volunteer.find(params[:volunteer_id]).delete
  @volunteers = Volunteer.all
  erb(:all_volunteers)
end

#individual volunteer
get('/volunteers/:volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id])
  @project = Project.find(@volunteer.project_id)
  erb(:one_volunteer)
end

patch('/volunteers/:volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id])
  @volunteer.update(params[:new_name])
  @project = Project.find(@volunteer.project_id)
  erb(:one_volunteer)
end
