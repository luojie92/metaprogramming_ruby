# 鬼域与自由市场

# 鬼域：C++ 无法查看运行时的实例方法
# 自由市场：Ruby 运行时可以访问类的方法变量等（自省）

class Greeting
  def initialize(text)
    @text = text
  end

  def welcome
    @text
  end
end

my_object = Greeting.new('Hello')

# 查看类名
my_object.class

# 查看类的实例方法
my_object.class.instance_methods

# 查看类的实例方法（去掉继承的方法）
my_object.class.instance_methods(false)

# 查看实例的变量
my_object.instance_variables
