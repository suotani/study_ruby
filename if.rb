#if式
if true
  puts "this is true"
end

if false
  #こっちは何も表示されない
  puts "this is true"
end

#式なので、何か値が返ってくる
m = if true
      "it is true"
    end
puts m

# ==や>=などはtrue or falseを返す
if 10 > 3
  puts "yes 10 is larger than 3"
end