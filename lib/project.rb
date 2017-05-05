class Project
  attr_accessor(:id, :name)

  def initialize(attrib)
    @id = attrib[:id]
    @name = attrib[:name]
  end

  define_method(:==) do |project2|
   self.id == project2.id
  end

  def self.all
    all_projects = []
    DB.exec("SELECT * FROM projects").each do |project|
      id = project["id"]
      name = project["name"]
      project_rm = Project.new({:id=>id,:name=>name})
      all_projects.push(project_rm)
    end
    all_projects
  end

  def save
    add = DB.exec("INSERT INTO projects (name) VALUES ('#{@name}') RETURNING id;")
    @id = add.first['id']
  end

  def self.find(id)
    found = nil
    Project.all.each() do |project|
      if project.id == id
        found = project
      end
    end
    found
  end

  def add_volunteers(volunteer_id_array)
    if volunteer_id_array!=nil
      volunteer_id_array.each do |volunteer_id|
        DB.exec("UPDATE volunteers SET project_id=#{@id} WHERE id=#{volunteer_id};")
      end
    end
  end

  def remove_volunteers(volunteer_id_array)
    if volunteer_id_array!=nil
      volunteer_id_array.each do |volunteer_id|
        DB.exec("UPDATE volunteers SET project_id=0 WHERE id=#{volunteer_id};")
      end
    end
  end

  def volunteers
    found_volunteers = []
    Volunteer.all.each do |volunteer|
      puts(volunteer.project_id)
      if volunteer.project_id == @id
        found_volunteers.push(volunteer)
      end
    end
    found_volunteers
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
    DB.exec("UPDATE volunteers SET project_id=0 WHERE project_id=#{@id}")
  end
end
