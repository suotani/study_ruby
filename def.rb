# defというキーワードでメソッドを定義できる
# メッセージともいう
def speak_hello
  puts "hello"
end

def speak_goodby
  puts "goodby"
end

# メソッドの数を減らす

def speak(message)
  puts message
end

speak("hello")
speak("goodby")

def speak_to_ken(message)
  puts "hi ken #{message}"
end

def speak_to_mike(message)
  puts "hi mike #{message}"
end

# 複数の引数を渡す事ができる

def speak_to(person, message)
  puts "hi #{person} #{message}"
end

speak_to("ken", "goodby")
#speak_to("ken")これはエラー

def speak_with_default_to(person, message="nothing")
  speak_to(person, message)
end

speak_with_default_to("ken")

# 二つともにデフォルトがある
def default_speak(person = "mike", message = "just only tell")
  speak_to(person, message)
end

default_speak

# default_speakにメッセージだけ渡したい時は？
def speak_keyword(person: "mike", message: "just only tell")
  speak_to(person, message)
end

speak_keyword(message: "can i ask you?")
speak_keyword(message: "can i ask you?", person: "bob")