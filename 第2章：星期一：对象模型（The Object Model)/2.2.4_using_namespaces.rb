# 使用命名空间

# 定义类
class MyClass
  def my_method
    @v = 1
  end
end
my_class = MyClass.new
my_class.my_method

# 打开类
class MyClass
  def test
    @v = 2
  end
end
my_class.test

# 命名空间
module MyModule
  class MyClass
    def test_v1
      @v = 3
    end
  end
end
my_class.test_v1

my_class_v1 = MyModule::MyClass.new
my_class_v1.test_v1
