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
    # selfというのは、ここでは実際に動いているインスタンスが入っている
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

# オブジェクト指向
# クラスとインスタンスは、概念と具体の関係に似ている
# 例えば、「文字」というのは、「不特定多数の人へ情報を伝達するための手段」という概念。
# 実際の文字は概念を具体的に表現した「あああ」や「こんにちは」などのもの

#classメソッドで、インスタンスが属するクラスを調べる事ができる。
puts "aaa".class

# 数値の具体は1や1.5と言ったインスタンス
puts 1.class
# 数値の概念(足算や掛け算ができる)というのはクラスとして表現されている


#インスタンスというのは、実際のところただのデータ部分なので、何かしら動作をすることはない
# 動作自体はクラスに記述されていて、インスタンスは自分が属しているクラスに動かしてもらうイメージ
