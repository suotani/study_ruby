# 配列を受け取って、ある数(n)以上にフィルタリングされた新しい配列を返す
# 入力：フィルタリング対象(array), 閾値(n)
# 出力：フィルタリングされた新しい配列
def filter_over(array, n)
  new_array = []
  array.each do |a|
    if a >= n
      new_array.push(a)
    end
  end
  new_array
end

list = [1,6,3,8,5,6,7,3,2]

p filter_over(list, 4)
# => [6,8,5,6,7]