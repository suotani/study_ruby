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


# 以下のようなvsメソッドをクラスの中で定義しても面白そうです。

class Monster
  #途中省略

  def vs(monster)
    # selfはメソッドを呼び出したインスタンス自身が入っている変数
    Monster.battle(self, monster)
  end

end

# このようにすると、
pikachu.vs kabigon
#というコードでバトルが開始されます。
# rubyでは、メソッドに引数を渡すときに、()を省略できます。
# できるというだけで、どちらが良いかは実装者が決めます
# 私は()ありの方がわかりやすくて好きです
# ここでは、雰囲気を出したくて、（）を省略しています