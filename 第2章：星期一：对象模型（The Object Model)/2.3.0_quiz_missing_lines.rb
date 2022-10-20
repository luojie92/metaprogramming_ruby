# 小测试：缺失的连接线

# 定义类
class MyClass
  def my_method
    @v = 1
  end
end

obj1 = MyClass.new
obj2 = MyClass.new

obj1.eql? obj2
obj1.class.eql? MyClass
obj2.class.eql? MyClass

MyClass.class.eql? Class
MyClass.superclass.eql? Object

# Class的类是自己（自我引用的逻辑）
Class.class.eql? Class
# Class的超类是模块；
Class.superclass.eql? Module
