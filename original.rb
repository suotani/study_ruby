# 1
# BMIの計算
# BMIは体重(kg)を身長(m)の２乗で割った数です
def bmi(height, weight)
  weight/(height * height)
end
puts bmi(1.6, 55)


# 2
# 電話番号のリストに市外局番をつけるプログラム
# 配列、each, メソッド,を使っています
def append_phone_code(code, numbers)
  new_numbers = []
  numbers.each do |number|
    new_numbers << code + "-" + number
  end
  new_numbers
end

numbers = ["11-1111", "222-222", "3-3333"]
code = "0773"
puts append_phone_code(code, numbers)


# 3
# 簡易モンスターバトルプログラム
# クラス, メソッド, ifなどを使っています
class Monster
  attr_accessor :name, :hp, :power, :shield

  MAX_TERM = 10

  def initialize(name, hp, power, shield)
    @name = name
    @hp = hp
    @power = power
    @shield = shield
  end

  def attack_to(monster)
    damage = power - monster.shield
    damage = 0 if damage <0 
    damage
  end

  def set_damage(damage)
    self.hp = hp - damage
  end

  def self.battle(m1, m2)
    term_counter = 0
    while(term_counter < MAX_TERM)
      damage = m1.attack_to(m2)
      m2.set_damage(damage)
      break if m2.hp < 0
      damage = m2.attack_to(m1)
      m1.set_damage(damage)
      break if m1.hp < 0
      term_counter += 1
    end
    if m1.hp < 0
      puts "#{m2.name} is winner"
    elsif m2.hp < 0
      puts "#{m1.name} is winner"
    else
      puts "battle is draw"
    end
  end
end

pikachu = Monster.new("ピカチュー", 100, 50, 10)
kabigon = Monster.new("カビゴン", 200, 30, 20)

Monster.battle(pikachu, kabigon)