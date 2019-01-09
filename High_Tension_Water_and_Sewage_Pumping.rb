# calculate charge for High_Tension_Water_and_Sewage_Pumping
class HighTensionWaterAndSewagePumping
  attr_accessor :unit

  FLAT_RATE = 4.0
  DEMAND = 800
  FIX_KW = 500
  UPTOKW = 225
  ABOVEKW = 285

  def initialize(unit)
    @unit = unit
  end

  def cal
    final_bill = unit * FLAT_RATE
    fixcharge = if FIX_KW <= DEMAND
                  UPTOKW
                else
                  ABOVEKW
                end
    final = final_bill + fixcharge
    puts "Final bill : #{final_bill} + #{fixcharge} = #{final}"
  end
end
