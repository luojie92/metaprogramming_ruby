# 细化：细化技巧可以解决全局性的猴子补丁问题

# String类自带的reverse方法
str = 'abc'
str.reverse

# 全局性修改
class String
  def reverse
    'new_method_deal'
  end
end
str.reverse

# 细化技巧
module StringExtensions
  refine String do
    def reverse
      'new_method_deal'
    end
  end
end

# 和打开类类似，但是细化不是全局性的，细化只在两种场合有效：1refine代码块内部；useing语句位置开始到模块结束
module StringStuff
  using StringExtensions
  'abc'.reverse
end
str.reverse

# 细化的缺陷
class MyClass
  def my_method
    'original my_method()'
  end

  def another_method
    my_method
  end
end

module MyClassExtensions
  refine MyClass do
    def my_method
      'refined my_method()'
    end
  end
end
# 不使用refine时
MyClass.new.my_method
MyClass.new.another_method
# 使用refine：现在无法在顶层目录使用细化
module Test
  using MyClassExtensions

  puts MyClass.new.my_method
  puts MyClass.new.another_method
end
# 可以发现another_method还是返回original my_method()
# 尽管another_method调用是在using之后，但是another_method中对my_method的调用是在using之前；
# 总结：细化在规避猴子补丁的副作用很有潜力，但是存在一些风险，要慎用；

