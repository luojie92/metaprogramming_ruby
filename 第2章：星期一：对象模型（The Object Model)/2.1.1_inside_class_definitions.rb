# 揭秘类的定义

# 定义类的语句和其他没有很大区别，可以任意操作；
3.times do
  class C
    puts 'hello'
  end
end

# 打开类，class关键字更像一个作用域
class D
  def x
    'x'
  end
end

class D
  def y
    'y'
  end
end

d = D.new
d.x
d.y
d.class.instance_methods(false)
