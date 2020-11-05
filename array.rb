# array([])には、どんな値でも入れる事ができるが、できるだけ同じ種類のものがいい
ar = [1,2,3,4,5,6]

# 値を取り出す
# 3を指定すると、前から0,1,2と数えての3なので、４番目の4が返ってくる
ar[3]

# 先頭の値
puts ar.first

#先頭からいくつか取る
# putsは勝手に展開されてしまう。配列のまま表示したい時はp
p ar.take(2)

#最後の値
puts ar.last

# each
def sum(ar)
  s = 0
  ar.each do |a|
    s += a
  end
  s
end


def product(ar)
  prod = 1
  ar.each do |a|
    prod *= a
  end
  prod
end

puts sum(ar)
puts product(ar)

