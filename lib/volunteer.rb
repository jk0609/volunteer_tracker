class Volunteer
  attr_accessor(:id, :name, :project_id)

  def initialize(attrib)
    @id = attrib[:id]
    @name = attrib[:name]
    @project_id = attrib.fetch(:project_id, 0)
  end

  define_method(:==) do |volunteer2|
   self.id == volunteer2.id
  end

  def self.all
    all_volunteers = []
    DB.exec("SELECT * FROM volunteers").each do |volunteer|
      id = volunteer["id"]
      name = volunteer["name"]
      project_id = volunteer["project_id"]
      volunteer_rm = Volunteer.new({:id=>id,:name=>name,:project_id=>project_id})
      all_volunteers.push(volunteer_rm)
    end
    all_volunteers
  end

  def save
    add = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}',0) RETURNING id;")
    @id = add.first['id']
  end

  def self.find(id)
    found = nil
    Volunteer.all.each() do |volunteer|
      if volunteer.id == id
        found = volunteer
      end
    end
    found
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{@id};")
  end

  def update (name)
    if name != ""
      @name = name
      DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{@id};")
    end  
  end
end
