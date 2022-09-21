# 进入元编程世界

# 补充知识：active_record
# 使用ActiveRecord::Base前，需要将activerecord依赖加入到Gemfile
# 使用命令：`bundle init` 创建Gemfile文件
# 使用命令：`bundle install` 安装Gemfile依赖

require 'active_record'

# 创建数据库metaprogramming
META_DATABASE_URL = 'postgres://root:123456@localhost:5432/metaprogramming'.freeze

# 创建movies表
CREATE_TABLE_SQL = "CREATE TABLE movies(
  id serial,
  title varchar(255) not null default '',
  created_at timestamp not null default now()
)".freeze

# 连接数据库
ActiveRecord::Base.establish_connection(ENV['META_DATABASE_URL'])

# Bob开始尝试元编程，开始使用类：ActiveRecord，重构之前的Moive类；
class Movie < ActiveRecord::Base
end

movie = Movie.create
movie.title = 'Doctor StrangeLove'
movie.title

# title title=这两个的方法（简称访问器）：
# 是ActiveRecord在运行时读取数据库的表模式，找到表字段，从而定义的；
