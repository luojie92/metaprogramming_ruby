# 方法查找

# 简单的方法查找：Ruby会在对象的类中找那个方法

# 新的概念：接受者[receiver]和祖先链[ancestors chain]

# 接受者就是调用方法所在的对象

class MyClass
  def my_method
    'my_method()'
  end
end

class MySubClass < MyClass
end

obj = MySubClass.new
obj.my_method

# MyClass没有明确指定他的超类，默认为Object
MyClass.superclass

# MySubClass有指定超类，就是MyClass
MySubClass.superclass

# 方法查找，祖先连
MySubClass.ancestors

# Kernel为什么会在祖先链，Kernel.class是Module
Kernel.class
