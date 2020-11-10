# BMIの計算
# BMIは体重(kg)を身長(m)の２乗で割った数です
def bmi(height, weight)
  weight/(height * height)
end
puts bmi(1.6, 55)