# 动态定义方法

# Module#define_method()方法可以随时定义一个方法，只需要提供方法名和充当方法主体的块

class Myclass
  define_method :my_method do |my_arg|
    my_arg * 3
  end
end

obj = Myclass.new
obj.my_method(3)

# 相对于def关键字，最重要的原因是：my_method 允许运行时决定方法的名字（见 3.2.3重构Computer类）