# 重构Computer类

# 原Computer类见 3.1.2

# 1.使用动态派发
class Computer
  def initialize(computer_id, date_source)
    @id = computer_id
    @date_source = date_source
  end

  def cpu
    component :cpu
  end

  def mouse
    component :mouse
  end

  def component(name)
    info = @date_source.send("get_#{name}_info", @id)
    price = @date_source.send("get_#{name}_price", @id)
    result = "#{name.capitalize}: #{info} ($#{price})"
    price >= 100 ? "* #{result}" : result
  end
end

# 原DS类见 3.1.1
date_source = DS.new
computer = Computer.new(42, date_source)
computer.cpu
computer.mouse

# 2.动态创建方法
class Computer
  def initialize(computer_id, date_source)
    @id = computer_id
    @date_source = date_source
  end

  def self.define_component(name)
    define_method(name) do
      info = @date_source.send("get_#{name}_info", @id)
      price = @date_source.send("get_#{name}_price", @id)
      result = "#{name.capitalize}: #{info} ($#{price})"
      price >= 100 ? "* #{result}" : result
    end
  end

  define_component :cpu
  define_component :mouse
end

date_source = DS.new
computer = Computer.new(42, date_source)
computer.cpu
computer.mouse