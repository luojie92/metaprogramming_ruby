# 打开类

# 字符串转字母方法
def to_alphanumeric(s)
  s.gsub(/[^\w\s]/, '')
end

str = 'asd../asd'
to_alphanumeric(str)

# to_alphanumeric方法其实不太符合`面向对象`的规范
# 尝试在String类植入to_alphanumeric方法
class String
  def to_alphanumeric
    gsub(/[^\w\s]/, '')
  end
end
str = 'asd../asd'
str.to_alphanumeric
