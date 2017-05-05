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
      expect(Volunteer.all).to(eq([volunteer1,volunteer2]))
    end
  end

  describe('#save') do
    it('adds self to database and updates id on app object') do
      volunteer1 = Volunteer.new({:id=>nil, :name=>'volunteer1'})
      volunteer1.save
      expect(Volunteer.all).to(eq([volunteer1]))
    end
  end

  describe('.find') do
    it('returns volunteer object in hash form with matching id as argument') do
      volunteer1 = Volunteer.new({:id=>nil, :name=>'volunteer1'})
      volunteer1.save
      expect(Volunteer.find(volunteer1.id)).to(eq(volunteer1))
    end
  end

  describe('.delete') do
    it('deletes self from database') do
      volunteer1 = Volunteer.new({:id=>nil, :name=>'volunteer1'})
      volunteer1.save
      volunteer1.delete
      expect(Volunteer.all).to(eq([]))
    end
  end

  describe('.update') do
    it('changes attributes of an existing database entry') do
      volunteer1 = Volunteer.new({:id=>nil, :name=>'volunteer1'})
      volunteer1.save
      volunteer1.update(:name=>'volunteer2')
      expect(volunteer1.name).to(eq('volunteer2'))
    end
  end

end
