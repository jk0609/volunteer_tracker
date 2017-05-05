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
      all_projects.push(project)
    end
    all_projects
  end

  def save
    add = DB.exec("INSERT INTO projects (name) VALUES ('#{@name}') RETURNING id;")
    @id = add.first['id']
  end

  def self.find(id)
    puts(@id)
    DB.exec("SELECT * FROM projects WHERE id=#{id.to_i}").first
  end
end
