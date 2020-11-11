require 'erb'
# main, main2とhtmlファイルを自動生成してきましたが、実はerbはhtmlファイル専用のものではありません
# ありとあらゆるファイル(画像やエクセルなどを除く)がerbで生成できるのです

# 以下の例では、一つのデータから、csvとcssファイルを生成しています。
# 先にデータだけみておきましょう。次のような、クラスと対応するcssプロパティのデータです。
#中身は、クラス名: {プロパティ名: 値, プロパティ名: 値...}となっています。

style = {
  "container": {
    "width": "80%",
    "margin": "auto"
  },
  "user-list": {
    "background-color": "#888",
    "margin-top": "50px",
    "padding": "20px"
  }
}

File.open("./style.css", "w") do |f|
  erb_file = File.read("./style.css.erb")
  css = ERB.new(erb_file, nil, "-").result(binding)
  f.puts(css)
end

File.open("./css.csv", "w") do |f|
  erb_file = File.read("./css.csv.erb")
  css = ERB.new(erb_file, nil, "-").result(binding)
  f.puts(css)
end

# ERB.new(erb_file, nil, "-")ここがいつもと少し違いますね
# ３つ目の引数はtrim_modeと呼ばれていて、<%- -%>という記法を有効にしてくれます。
# erbファイルで<%- -%>を記述すると、自動的についてしまう改行や空白を削除してくれます。
