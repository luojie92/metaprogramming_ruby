# 动态调用方法

class Myclass
  def my_method(my_arg)
    my_arg * 2
  end
end

obj = Myclass.new
obj.my_method(3)

# 动态调用方法: 通过send方法实现
obj.send(:my_method, 4)

# 为什么用send方法，而不用原来的.标志符呢

# 因为在send方法里，方法名做为了一个参数，这样可以实现动态派发

# 技巧：动态派发 Dynamic Dispatch

# 补充：Ruby中，符号和字符串没有关系，属于完全不同的类
:x.class
# => Symbol
'x'.class
# => String

# 尽管如此，符号和字符串还是容易迷惑初学者，到底为什么需要符号呢，为什么不直接使用字符串？

# 大多数情况下，符号表示方法的名字，符号是不可修改的，字符串是可修改的，因此符号适合方法名

# 可以研究他们的object_id

'x'.object_id

:x.object_id

# 私有性的问题：send过于强大，Object#send方法可以调用任何方法，包括私有方法

class Myclass
  def my_method(my_arg)
    my_arg * 2
  end

  private

  def my_private_method(my_arg)
    my_arg * 3
  end
end
obj = Myclass.new
obj.my_method(2)
# => 4 
obj.my_private_method(2)
# NoMethodError (private method `my_private_method' calle for ..

obj.send(:my_method, 2)
# => 4 
obj.send(:my_private_method, 2)
# => 6

# 如果不想破坏封装，可以用 public_send
obj.public_send(:my_method, 2)
# => 4 
obj.public_send(:my_private_method, 2)
# NoMethodError (private method `my_private_method' calle for ..




