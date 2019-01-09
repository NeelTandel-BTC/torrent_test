# calculate charge Agriculture Service
class LTP
  attr_accessor :unit

  LTPR = 3.30
  FIXBHP = 10

  def initialize(unit)
    @unit = unit
  end

  def cal
    final_bill = if unit > 0
                   unit * LTPR
                 else
                   FIXBHP * 10
                 end
    puts "Final bill : #{final_bill}"
  end
end
