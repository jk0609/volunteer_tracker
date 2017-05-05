require('spec_helper')

describe('Volunteer') do
  describe('#==') do
    it('returns true if two compared volunteer objects share the same id') do
      volunteer1 = Volunteer.new({:id=>nil, :name=>'volunteer1'})
      volunteer2 = Volunteer.new({:id=>nil, :name=>'volunteer2'})
      expect(volunteer1==volunteer2).to(eq(true))
    end
  end

  describe('.all') do
    it('returns array of all volunteers in hash format') do
      volunteer1 = Volunteer.new({:id=>nil, :name=>'volunteer1'})
      volunteer2 = Volunteer.new({:id=>nil, :name=>'volunteer2'})
      volunteer1.save
      volunteer2.save
      expect(Volunteer.all).to(eq([{'id'=>volunteer1.id, 'name'=>volunteer1.name, 'project_id'=>'0'},{'id'=>volunteer2.id, 'name'=>volunteer2.name, 'project_id'=>'0'}]))
    end
  end

  describe('#save') do
    it('adds self to database and updates id on app object') do
      volunteer1 = Volunteer.new({:id=>nil, :name=>'volunteer1'})
      volunteer1.save
      expect(Volunteer.all).to(eq([{'id'=>volunteer1.id, 'name'=>volunteer1.name, 'project_id'=>'0'}]))
    end
  end

  describe('.find') do
    it('returns volunteer object in hash form with matching id as argument') do
      volunteer1 = Volunteer.new({:id=>nil, :name=>'volunteer1'})
      volunteer1.save
      expect(Volunteer.find(volunteer1.id)).to(eq({'id'=>volunteer1.id, 'name'=>volunteer1.name, 'project_id'=>'0'}))
    end
  end

  describe('.add_project') do #remove project works the same but sets project_id = 0
    it('updates project_id attribute of self') do
      volunteer1 = Volunteer.new({:id=>nil, :name=>'volunteer1'})
      project1 = Project.new({:id=>nil, :name=>'project1'})
      volunteer1.save
      project1.save
      volunteer1.add_project(project1.id)
      expect(Volunteer.find(volunteer1.id)).to(eq({'id'=>volunteer1.id, 'name'=>volunteer1.name, 'project_id'=>project1.id}))
    end
  end
end
