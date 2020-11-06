# array([])には、どんな値でも入れる事ができるが、できるだけ同じ種類のものがいい
numbers = [1,2,3,4,5,6]



# 値を取り出す
# 3を指定すると、前から0,1,2と数えての3なので、４番目の4が返ってくる
numbers[3]

# よく使う処理には専用のメソッドが用意されている事があります
# 配列から先頭の値を取り出すにはfirstというメソッドが用意されています。
puts numbers.first

#先頭からいくつか取る
# putsは勝手に展開されてしまう。配列のまま表示したい時はp
p numbers.take(2)

#最後の値
puts numbers.last

# each
# eachで繰り返し処理ができる
# numbersの中身から先頭の値を一つ取り出し、変数aに代入して、
# do~endの中身を実行する
# またnumbersから２番目の値を取り出しaに代入する
# do~endの中身を実行する
# というのを、numbersの終わりまで繰り返す
sum = 0
numbers.each do |a|
  sum += a
end
puts sum


