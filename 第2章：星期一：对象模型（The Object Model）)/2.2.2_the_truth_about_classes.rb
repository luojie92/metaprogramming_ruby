# 类的真相

# 类本身也是对象：String类的方法就是Class实例的方法
'hello'.class
String.class

# Class的三个方法： [:new, :allocate, :superclass]
Class.instance_methods(false)

# new和superclass经常使用到
Array.superclass
Object.superclass
BasicObject.superclass # 根节点BasicObject

# Class的超类:
Class.superclass
# 1.类的超类是模块，也就是说，每一个类都是模块
# 2.类是带有[:new, :allocate, :superclass]方法的增强模块
# 3.如果你希望代码inlcude到别的代码中，就用模块
# 4.如果你希望代码被实例化或者继承，就用类
