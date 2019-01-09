# calculate charge for Low Tension Tension Street Light Service
class StreetLightService

  attr_accessor :unit

  SLR = 4.20
  
  def initialize(unit)
    @unit = unit
  end

  def cal
    final_bill = unit * SLR
    puts "Final bill : #{final_bill.round(2)}"
  end
end
