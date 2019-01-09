# calculate charge for High_Tension_Maximum_Demand_Temporary_Supply
class HighTensionMaximumDemandTemporarySupply
  attr_accessor :unit
  FLAT_RATE = 6.96
  DEMAND = 800
  FIX_KW = 500
  UPTO_DEMAND = 25
  ABOVE_DEMAND = 30
  MONTH = 28

  def initialize(unit)
    @unit = unit
  end

  def cal
    final_bill = unit * FLAT_RATE
    fixcharge = if FIX_KW <= DEMAND
                  UPTO_DEMAND * MONTH
                else
                  ABOVE_DEMAND * MONTH
                end
    final = final_bill + fixcharge
    puts "Final bill : #{final_bill} + #{fixcharge} = #{final}"
  end
end
