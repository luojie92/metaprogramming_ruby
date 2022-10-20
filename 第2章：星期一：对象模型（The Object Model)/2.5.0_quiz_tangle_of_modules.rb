# 小测试：混乱的模块

module Printable
  def print
    'Printable#print()'
  end

  def prepare_cover
    'Printable#prepare_cover()'
  end
end

module Document
  def print_to_screen
    prepare_cover
    format_for_screen
    print
  end

  def format_for_screen
    'Document#format_for_screen()'
  end

  def print
    'Document#print()'
  end
end

class Book
  include Document
  include Printable
end

Book.ancestors
#  => [Book, Printable, Document, Object, Kernel, BasicObject]

book = Book.new
book.print_to_screen
# => "Printable#print()"
