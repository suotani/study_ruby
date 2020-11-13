# 複数のクラスが連携し合うプログラム

# 患者クラス
class Patient
  # 問診票、病名のリスト
  attr_accessor :age, :interview_sheet, :disease_list

  def initialize(age)
    @age = age
    #最初は問診票を持っていない
    @interview_sheet = nil
    #最初は何も病名を知らない
    @disease_list = []
  end

  # 問診票に記入する
  # メソッドの引数はハッシュで渡す
  def record_sheet(values)
    #問診票を新しく作成(記入する)
    sheet = InterviewSheet.new(
      values[:hospital], values[:number], values[:rooms]
    )
    #自分のものとする
    self.interview_sheet = sheet
  end

  # 病院へ受診する
  def see_doctor
    # 問診票に書いてある診察室を回る
    interview_sheet.rooms.each do |room|
      #病院で受診する
      #診察結果がdiseaseに入る
      disease = interview_sheet.hospital.medical_examination(self, room)

      # もし、病気があれば
      if disease != ""
        # 自分自身の病気リストに追加する
        self.disease_list.push(disease)
      end
    end
  end

end


# 問診票クラス
class InterviewSheet
  # 受診する病院、診察券番号、回っていく診察室のリスト
  attr_accessor :hospital, :number, :rooms

  def initialize(hospital, number, rooms)
    @hospital = hospital
    @number = number
    @rooms = rooms
  end
end

# 病院クラス
class Hospital
  # 病院名
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  #診断される可能性のある病名
  DISEASES = ["", "かぜ", "インフルエンザ", "骨折", "ヘルニア", "脱臼"]
  PLUS_DISEASE = ["メタボ", "リウマチ", "動脈硬化", "高血圧"]

  # 診察する
  def medical_examination(patiant, room)
    # 40歳以上かどうかで、診断される病名が異なる
    if patiant.age >= 40
      #ろくな診察もせずに、ランダムに(sampleメソッド)病名を返す
      (DISEASES + PLUS_DISEASE).sample
    else
      DISEASES.sample
    end
  end
end


hospital = Hospital.new("東京都立記念総合病院")
patient1 = Patient.new(30)
patient1.record_sheet(
  { hospital: hospital, number: "A-0230245", rooms: ["内科"] }
)

patient2 = Patient.new(50)
patient2.record_sheet(
  { hospital: hospital, number: "B-0130288", rooms: ["内科", "消化器内科", "心臓科"] }
)

p "-------プログラムを実行します。-----"

p patient1.disease_list
patient1.see_doctor
p "patient1は病院へ行きました"
p patient1.disease_list

p "---------------------"

p patient2.disease_list
patient2.see_doctor
p "patient2は病院へ行きました"
p patient2.disease_list