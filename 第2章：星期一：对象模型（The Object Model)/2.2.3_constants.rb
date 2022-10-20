# 常量

# 任何以大写开头的引用（包括类名和模块名）都是常量

# 但区别于其他语言，ruby常量可以修改，但解释器会给你警告

# 如果常量可以修改，是否和变量一样？（主要是作用域不同）
# 类似文件系统，模块和类就是目录，常量就是文件，只要不在同一目录下，文件名就可以重复；
module MyModule
  MY_CONSTANT = 'Outer constant'.freeze

  class MyClass
    MY_CONSTANT = 'Inner constant'.freeze
  end
end

# 常量的路径：像文件路径一样，常量也可以通过路径来访问

MyModule::MY_CONSTANT
MyModule::MyClass::MY_CONSTANT

# 根路径常量可以用双冒号访问

Y = 'a root-level constant'.freeze

module M
  X = 'a x constant in M'.freeze
  Y = 'a y constant in M'.freeze
  ::Y
end

Y
M::Y

# Module类还有一个实例方法和类方法，都叫constants

# Module#constants 返回当前范围内所有常量
M.constants

# Module.constants 返回当前程序中所有顶层的常量
Module.constants
Module.constants.include? :Y
Module.constants.include? :M

# 如果想知道当前代码所在的路径，可以使用：
Module.nesting

module M
  class C
    module M2
      Module.nesting
    end
  end
end
