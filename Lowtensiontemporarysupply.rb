# calculate charge for Low Tension Temporary Supply
class Lowtensiontemporaryupply
  attr_accessor :unit

  TMPFIX = 25
  TMPR = 5.00

  def initialize(unit)
    @unit = unit
  end

  def cal
    final_bill = unit * TMPR
    final = final_bill + TMPFIX
    puts "Final bill : #{final_bill} + #{TMPFIX} = #{final}"
  end
end
