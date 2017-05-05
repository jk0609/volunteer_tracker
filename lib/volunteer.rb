class Volunteer
  attr_accessor(:id, :name, :project_id)

  def initialize(attrib)
    @id = attrib[:id]
    @name = attrib[:name]
    @project_id = 0
  end

  define_method(:==) do |volunteer2|
   self.id == volunteer2.id
  end

  def self.all
    all_volunteers = []
    DB.exec("SELECT * FROM volunteers").each do |volunteer|
      all_volunteers.push(volunteer)
    end
    all_volunteers
  end

  def save
    add = DB.exec("INSERT INTO volunteers (name, project_id, hours) VALUES ('#{@name}',0,0) RETURNING id;")
    @id = add.first['id']
  end

  def self.find(id)
    puts(@id)
    DB.exec("SELECT * FROM volunteers WHERE id=#{id.to_i}").first
  end

  def add_project(project_id)
    DB.exec("UPDATE volunteers SET project_id=#{project_id} WHERE id=#{@id};")
  end

  def remove_project(project_id)
    DB.exec("UPDATE volunteers SET project_id=0 WHERE id=#{@id};")
  end
end
