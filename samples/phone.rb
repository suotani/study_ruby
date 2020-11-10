# 電話番号のリストに市外局番をつけるプログラム
# 配列、each, メソッド,を使っています
def append_phone_code(code, numbers)
  new_numbers = []
  numbers.each do |number|
    new_numbers << code + "-" + number
  end
  new_numbers
end


phone_numbers = ["333-906", "828-828", "111-111"]
puts append_phone_code("0120", phone_numbers)

#別解
# eachの代わりにmapを使うと、より短く書くことができます。
# eachはdo~endの繰り返しがメインでしたが、mapは、中の処理を集めて新しく配列を作ります。

def mapping_phone_code(code, numbers)
  #1行で書く場合はdo~endではなくて、{}を使う
  #このメソッドでは、最後に実行しているのはmapメソッドなので、
  # mapメソッドの返り値がmapping_phone_codeメソッドの返り値となる
  numbers.map { |number| code + "-" + number }
end

puts mapping_phone_code("0120", phone_numbers)
# mapping_phone_codeメソッドの中身は１行なので、実はメソッドにする意味もないですね。
# 次のように書いても大丈夫です。
puts phone_numbers.map { |number| "0120-#{number}" }

# このように、いきなり効率の良い、短いコードを書くのは難しいですが、
# 一度eachで実装してみてから、よりよい書き方を見つけて、書き直してみるのもいいと思います。
# すでに動くコードを、より良くするための作業をリファクタリングと言います。


# 別解2
# 以下は一見意味不明なコードですが、これまでと同様に動きます。
# 再帰と呼ばれる書き方です。実務ではほとんど使いませんが、
# 繰り返しメソッド(eachやmap)を使わなくても繰り返し処理ができる例です。
def ref_num(code, numbers)
  if numbers.size <= 0
    []
  else
    [code + "-" + numbers.first] + ref_num(code, numbers[1..-1])
  end
end
puts ref_num("090", phone_numbers)