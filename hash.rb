# {}をみたらハッシュ

#arrayと違い、異なる種類の値をいれる、そして適切な名前をつける
person = {name: "bob", age: 23, gender: "men", phone_number: "0120-333-906"}
puts person[:name]


# hash in hash
# classはクラス定義のキーワードなので、classという名前を変数として使いたくなったらklassを使う
klass = {
  number: 1,
  #hashの中にはもちろん配列もいれる事ができる
  teams: [
    {name: "A", member_count: 3},
    {name: "B", member_count: 14},
    {name: "C", member_count: 1}
  ]
}
puts klass[:teams]
puts klass[:teams].first[:name]