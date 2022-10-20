# 再一再二，不能再三再四

# 把DS封装到一个对象中
class Computer
  def initialize(computer_id, date_source)
    @id = computer_id
    @date_source = date_source
  end

  def cpu
    info = @date_source.get_cpu_info(@id)
    price = @date_source.get_cpu_price(@id)
    result = "CPU: #{info} ($#{price})"
    price >= 100 ? "* #{result}" : result
  end

  def mouse
    info = @date_source.get_mouse_info(@id)
    price = @date_source.get_mouse_price(@id)
    result = "Mouse: #{info} ($#{price})"
    price >= 100 ? "* #{result}" : result
  end
end

date_source = DS.new
computer = Computer.new(42, date_source)
computer.cpu
computer.mouse

# 写到这里，发现这次封装只不过是不断的拷贝，而且方法越多，工作量越大，单元测试也越多，需要一个更好的重构

# 有两个办法来解决代码繁复的问题：

# 1.dynamic_methods 动态方法

# 2.method_missing
