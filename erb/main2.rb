require 'erb'

# main.rbでは、index.html.erbの内容をERBライブラリの機能を使ってHTMLへと変換していました。
# ここでも同じですが、せっかくなのでメソッド化して、データとerbファイルを後から指定できるようにしましょう。
# そうすることで、メインのプログラムを変えなくても、様々なファイルをrubyで生成することができます


# まずはメソッド化ですね。引数としては、データとerbファイルの名前を渡します。
# erbファイル自体はmain2.rbと同じフォルダへ入れておきます。
# erbのファイル名は、xx.erbです。xxには出力時のファイル名を書いておきます。
# index.htmlが出力ファイルなら、index.html.erbが入力するerbファイル名です


#引数のdataは様々なデータに対応するために、汎用的な名前にしています。
def render_template(data, file_name)
  # file_name.split(".") => ["index", "html", "erb"]
  # file_name.split(".")[0..-2] => ["index", "html"]
  # file_name.split(".")[0..-2].join(".") => "index.html"
  output_file_name = file_name.split(".")[0..-2].join(".")
  #あるいは、
  #output_file_name = file_name.gsub(".erb", "")
  #として、.erbを消す

  File.open(output_file_name, "w") do |f|
  
    erb_file = File.read(file_name)
    html = ERB.new(erb_file).result(binding)
    f.puts(html)
  
  end
end

user = {
  name: "Uotani",
  last_logged_in: "2020/12/1 13:00:12",
  favorited_blog_titles: [ "Ruby超入門", "Rails詳解", "データベースを極める" ]
}
data = {user: user}

render_template(data, "user.html.erb")