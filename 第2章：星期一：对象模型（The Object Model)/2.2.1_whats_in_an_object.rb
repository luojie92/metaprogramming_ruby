# 对象中有什么

class MyClass
  def my_method
    @v = 1
  end
end

obj = MyClass.new
obj.class

# 实例变量
obj.instance_variables

obj.my_method
obj.instance_variables
# 会发现和java静态语言不同，ruby中对象的类和实例没有关系；
# 当给实例赋值时，他们才会出现；
# 因此，同一个类，可以创建具有不同实例变量的对象；

# 方法
obj.methods

# 通过数组的grep筛选需要的方法
obj.methods.grep(/my/)

# 结论
# 实例变量存放在对象中, 而方法存在于类中

# 实例方法和类方法的区分
MyClass.instance_methods.eql? obj.methods
MyClass.methods.eql? obj.methods
