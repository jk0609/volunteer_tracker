require('spec_helper')

describe('Project') do
  describe('#==') do
    it('returns true if two compared project objects share the same id') do
      project1 = Project.new({:id=>nil, :name=>'project1'})
      project2 = Project.new({:id=>nil, :name=>'project2'})
      expect(project1==project2).to(eq(true))
    end
  end

  describe('.all') do
    it('returns array of all projects in hash format') do
      project1 = Project.new({:id=>nil, :name=>'project1'})
      project2 = Project.new({:id=>nil, :name=>'project2'})
      project1.save
      project2.save
      expect(Project.all).to(eq([project1, project2]))
    end
  end

  describe('#save') do
    it('adds self to database and updates id on app object') do
      project1 = Project.new({:id=>nil, :name=>'project1'})
      project1.save
      expect(Project.all).to(eq([project1]))
    end
  end

  describe('.find') do
    it('returns project object in hash form with matching id as argument') do
      project1 = Project.new({:id=>nil, :name=>'project1'})
      project1.save
      expect(Project.find(project1.id)).to(eq(project1))
    end
  end

  describe('#volunteers') do
    it('returns list of volunteers assigned to this project') do
      volunteer1 = Volunteer.new({:id=>nil, :name=>'volunteer1'})
      project1 = Project.new({:id=>nil, :name=>'project1'})
      volunteer1.save
      project1.save
      project1.add_volunteers([volunteer1.id])
      expect(project1.volunteers).to(eq([volunteer1]))
    end
  end

  describe('#add_volunteers') do #remove project works the same but sets project_id = 0
    it('updates project_id attribute of all volunteer ids in argument array') do
      volunteer1 = Volunteer.new({:id=>nil, :name=>'volunteer1'})
      project1 = Project.new({:id=>nil, :name=>'project1'})
      volunteer1.save
      project1.save
      project1.add_volunteers([volunteer1.id])
      expect(project1.volunteers).to(eq([volunteer1]))
    end
  end

  describe('.delete') do
    it('deletes self from database and sets project_id for all associated volunteers to 0') do
      project1 = Project.new({:id=>nil, :name=>'project1'})
      project1.save
      project1.delete
      expect(Project.all).to(eq([]))
    end
  end

end
