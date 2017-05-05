require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add and update a new project', {:type => :feature}) do
  it('allows a user to use "Add Project" field to create a new project and "Update Project" field to change the name') do
    visit('/')
    fill_in('project_name', :with =>'Test Project')
    click_button('add')
    click_on('Test Project')
    fill_in('new_name', :with =>'Real Project')
    click_button('update')
    expect(page).to have_content('Real Project')
  end
end

describe('delete a project', {:type => :feature}) do
  it('allows a user to use the "Delete Project" button to remove a project and return to the home page') do
    project = Project.new({:id=>nil, :name=>'project1'})
    project.save
    visit('/projects/'+project.id)
    click_button('delete')
    expect(page).to have_content('All Projects')
  end
end

describe('add and update a new volunteer', {:type => :feature}) do
  it('allows a user to use "Add Volunteer" field to create a new volunteer and "Update Volunteer" field to change the name') do
    visit('/volunteers')
    fill_in('volunteer_name', :with =>'Steve')
    click_button('Add Volunteer')
    click_on('Steve')
    fill_in('new_name', :with =>'Bob')
    click_button('Update Volunteer')
    expect(page).to have_content('Bob')
  end
end

describe('delete a volunteer', {:type => :feature}) do
  it('allows a user to use the "Delete Volunteer" button to remove a volunteer and return to the list of volunteers') do
    volunteer = Volunteer.new({:id=>nil, :name=>'Bob'})
    volunteer.save
    visit('/volunteers/'+volunteer.id)
    click_button('Delete Volunteer')
    expect(page).to have_content('All Volunteers')
  end
end

describe('add volunteer to a project', {:type => :feature}) do
  it('allows a user to use checkboxes to add or remove volunteers from a project') do
    volunteer = Volunteer.new({:id=>nil, :name=>'Bob'})
    volunteer.save
    project = Project.new({:id=>nil, :name=>'project1'})
    project.save
    visit('/projects/'+project.id)
    page.check('open')
    click_button('Update Volunteers')
    expect(page).to have_content('Bob')
  end
end
