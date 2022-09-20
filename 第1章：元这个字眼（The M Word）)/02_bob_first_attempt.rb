# Bob的第一次尝试

class Entity
  attr_reader :table, :ident

  def initialize(table, ident)
    @table = table
    @ident = ident
    # DataBase.sql ("INSERT INTO #{@table} (id) VALUES (#{@ident})")
  end

  def set(col, val)
    # DataBase.sql ("UPDATE #{@table} SET #{col}='#{val}' WHERE id = #{@ident}")
  end

  def get(col)
    # DataBase.sql ("SELECT #{col} FROM #{@table} WHERE id = #{@ident}")[0][0]
  end
end

# attr_reader快捷增加两个实例方法 entity#ident entity#table
Entity.instance_methods(false)
entity = Entity.new('users', 1)
entity.ident
entity.table

# 继承
class Movie < Entity
  def initialize(ident)
    super 'movies', ident
  end

  def title
    get 'title'
  end

  def title=(value)
    set 'title', value
  end
end

# super 关键字用法
movie = Movie.new(1)
movie.ident
movie.table
