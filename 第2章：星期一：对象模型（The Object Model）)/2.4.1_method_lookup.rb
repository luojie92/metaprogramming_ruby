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

# 祖先链是从类开始，其超类结束；
# 祖先链也包含模块；

module M1
  def my_method
    'M1#my_method()'
  end
end

# include时，Ruby会把模块加入到该类的祖先链中，位置在包含他的类之上；
class C
  include M1
end
C.ancestors

class D < C
end
D.ancestors

# prepend时，Ruby会把模块加入到该类的祖先链中，位置在包含他的类之下；
class C2
  prepend M1
end
C2.ancestors

# 所以前面的Kernel模块出现在祖先链中，实际是：
=begin

  class Object < BasicObject
    include Kernel
  end

=end

# 如果试图在某个类中，多次加入同一模块，会发生什么

module M2
  include M1
end
M2.ancestors

module M3
  include M2
end
M3.ancestors

module M4
  prepend M1
end
M4.ancestors

module M5
  prepend M1
  include M2
end
M5.ancestors
# 会发现，每次include和prepend时，如果该模块已经存在于祖先链中，那么Ruby会忽略这个include和prepend命令；

# Kernel模块 内核方法 如：print

Kernel.private_instance_methods.grep(/^pr/)

# 如print方法可以随时随地的进行调用，是因为Object类包含了Kernel模块

# irb中当前对象的类是Object
self.class

# 可以尝试添加一个内核方法
module Kernel
  def tt
    puts 'tt()'
  end
end
