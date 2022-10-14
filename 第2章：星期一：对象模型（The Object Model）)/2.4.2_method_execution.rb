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

# private 私有方法
class C
  def public_method
    puts 'public_method()'
    private_method
  end

  private

  def private_method
    'private_method()'
  end
end

C.new.public_method
# 会提示no_method, 私有方法的规则之一：只能通过隐性的接受者调用（这一规则决定私有方法，只能在自身中调用）
C.new.private_method

# 顶层上下文：Ruby程序开始时，解释器会创建一个名为main的对象作为当前对象，这个对象就叫顶层上下文；

# irb 直接输入self可返回当前对象

# 类定义与self： 在类和模块中（且在任何方法定义之外），self的角色由这个类或模块本身担任；
class Myclass
  self
end
