#if式
# trueは「正しい」ことを表す値
if true
  puts "this is true"
end

# falseは反対に「間違っている」ことを表す
if false
  #こっちは何も表示されない
  puts "this is true"
end

# ==や>=などはtrue or falseを返すので、ifの後ろにそのまま入れてOK
if 10 > 3
  puts "yes 10 is larger than 3"
end

# 実はnil(何もないことを表す特殊な値)かfalseでなければ全てtrueとして処理される

if 1
  puts "this is true"
end

#ifは、「もし〜ならば実行する」を表すが、「そうでない場合」も何か処理する場合はelseを使う
if false
  puts "this is false"
else
  puts "this is not false"
end

