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
      expect(Project.all).to(eq([{'id'=>project1.id, 'name'=>project1.name},{'id'=>project2.id, 'name'=>project2.name}]))
    end
  end

  describe('#save') do
    it('adds self to database and updates id on app object') do
      project1 = Project.new({:id=>nil, :name=>'project1'})
      project1.save
      expect(Project.all).to(eq([{'id'=>project1.id, 'name'=>project1.name}]))
    end
  end

  describe('.find') do
    it('returns project object in hash form with matching id as argument') do
      project1 = Project.new({:id=>nil, :name=>'project1'})
      project1.save
      expect(Project.find(project1.id)).to(eq({'id'=>project1.id, 'name'=>project1.name}))
    end
  end
end
