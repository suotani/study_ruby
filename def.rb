# defというキーワードでメソッドを定義できる
# メソッドとは、いくつかの処理をまとめて、名前をつけたもの
# メッセージともいう
# speak_hello, speak_goodbyなどがメソッドの名前
def speak_hello
  puts "hello"
end

def speak_goodby
  puts "goodby"
end


# メソッドの数を減らすために、引数を使う
def speak(message)
  puts message
end

# ()の中に書いたもじが、メソッドの中でmessageという変数に入り、使われる
speak("hello")
speak("goodby")

def speak_to_ken(message)
  puts "hi ken #{message}"
end

def speak_to_mike(message)
  puts "hi mike #{message}"
end

# 引数は一つじゃなくても良い
# 複数ある場合は「,」で区切る

def speak_to(person, message)
  puts "hi #{person} #{message}"
end

speak_to("ken", "goodby")
#speak_to("ken")は引数の数が少なくてエラーが出る
#def speak_to(person, message)のように書くと、実行するときも必ず引数は２個必要


# デフォルト値を渡しておけば、実行するときに必須となる引数の数がへる
def speak_with_default_to(person, message="nothing")
  speak_to(person, message)
end

#messageはデフォルト値があるので、省略できる
speak_with_default_to("ken")

# 二つともにデフォルトがあるパターンもある
def default_speak(person = "mike", message = "just only tell")
  speak_to(person, message)
end

# 二つともにデフォルト値があるので、引数を全く渡さなくても実行できる
puts default_speak


# default_speakにメッセージだけ渡したい時、
# default_speak("just only tell")のようにしても、personとして使われてしまう
#引数の順番を気にしないようにするには、次のキーワード引数が便利
# 特にrailsではキーワード引数をよく見かける
def speak_keyword(person: "mike", message: "just only tell")
  speak_to(person, message)
end

puts speak_keyword(message: "can i ask you?")
puts speak_keyword(message: "can i ask you?", person: "bob")
puts speak_keyword(person: "bob")