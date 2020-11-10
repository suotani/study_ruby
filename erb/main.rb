# railsで使われているerbだが、実はrails無し、インストールも不要で使えるrubyの拡張機能
require 'erb'

# File.openでファイルを開く。もしファイルが存在していなければ作る
# 「開く」というのは、このプログラムで、ファイルを占有する事
# fというローカル変数には、ファイルを操作できるインスタンスが入っている
# ./index.htmlはこのファイル(main.rb)から見て、同じフォルダのindex.htmlを指している
File.open("./index.html", "w") do |f|
  # puts f.class
  #とかをすると、fの正体をみる事ができる

  # 今回は簡単に、ハッシュでユーザーを表現する。
  # 実際にはクラスで行うのが普通
  user = {
    name: "Uotani",
    last_logged_in: "2020/12/1 13:00:12",
    favorited_blog_titles: [ "Ruby超入門", "Rails詳解", "データベースを極める" ]
  }

  # erbファイルの読み込み
  erb_file = File.read("./index.html.erb")

  # erbファイルから、htmlを生成
  # bindingはこのファイルで定義した変数を、erbファイルでも使えるようにする記述
  html = ERB.new(erb_file).result(binding)

  # index.htmlへ書き込み
  f.puts(html)

# endが来ると、開いたファイルを閉じる
end
