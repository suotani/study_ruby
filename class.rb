# classは簡単にいうとhashの強化版
# hashはデータだけだったが、classはデータ+挙動

# クラスは、データに対してどのような動作を実行させるのかを決める場所

class Book
  # どんなデータを持つのか決める
  # railsでは不要
  attr_accessor :title, :auther, :published_at

  # newメソッドでデータを入れるときにはこれが必須
  # キーワード引数についてはdef.rbを参照
  # railsでは不要
  def initialize(title: "no title", auther: "", published_at: "")
    @title = title
    @auther = auther
    @published_at = published_at
  end

  def update_title(value)
    self.title = value
  end
end

# newもメソッドの一つ
# ここでは、キーワード引数を使っている
# キーワード引数についてはdef.rbを参照
book = Book.new(title: "Ruby入門", auther: "Minatomi", published_at: "2020-8-10")
book.update_title("Ruby超入門")
puts book
p book

# 初期データを入れないとinitializeメソッドの初期値(titleだけはno titleになる)が使われる
book2 = Book.new
p book2