#class定義
# hashの強化版
# hashはデータだけだったが、classはデータ+挙動

#文字という概念と実際の「aaa」という文字の違い
# 概念がclassで実物がインスタンス


# bookを更新するメソッドだが、第一引数にはbook以外のものもいれる事ができる
# 更新するオブジェクトと、メソッドがゆるーく結びついている
# classを使うと、オブジェクトと対応するメソッドが強固に結びつく
def update(book, key, value)
  book[key] = value
  book
end

book = {title: "A", auther: "aaa", published_at: "1990-4-20"}
puts book

new_book = update(book, :auther, "bbb")

puts new_book