# 打开类的问题

# 自定义数组替代的方法
def replace(array, original, replacement)
  array.map { |e| e == original ? replacement : e }
end

original_array = %w[one two three]
replaced_array = replace(original_array, 'one', 'two')
puts replaced_array

# array自带的replace方法
original_array = %w[one two three]
original_array.replace([1, 2, 3])

# 尝试打开类，自定义replace方法
class Array
  def replace(original, replacement)
    map { |e| e == original ? replacement : e }
  end
end
original_array = %w[one two three]
original_array.replace('one', 'two')

# 重写成功，但此时会发现原来用法：original_array.replace([1, 2, 3]) 异常
# 这就是打开类的问题，如果粗心地为某个类添加方法，可能会出现这种bug：
# "猴子不定" "Monkeypatch"
