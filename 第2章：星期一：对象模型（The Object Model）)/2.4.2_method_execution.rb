# 方法执行

# self关键字
class MyClass
  def testing_self
    @val = 10
    my_method
    self
  end

  def my_method
    @val += 1
  end
end

obj = MyClass.new
obj.testing_self
obj.my_method
