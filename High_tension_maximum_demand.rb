# calculate charge for High Tension Maximum Demand
class Hightensionmaximumdemand
  attr_accessor :unit

  FIRST_SLAB_RATE = 4.45
  REM_SLAB_RATE = 4.35
  FIRST_SLAB = 400
  BDUPTO = 1000
  FIXKW = 800
  UPTO1000 = 260
  ABOVE1000 = 335

  def initialize(unit)
    @unit = unit
  end

  def cal
    firstslab = (unit <= FIRST_SLAB && unit >= 0)
    final_bill = if firstslab
                   unit * FIRST_SLAB_RATE
                 else
                   (FIRST_SLAB * FIRST_SLAB_RATE) + ((unit - FIRST_SLAB) * REM_SLAB_RATE)
                 end
    htmd1fix = if FIXKW <= BDUPTO
                 UPTO1000
               else
                 ABOVE1000
               end
    final = final_bill + htmd1fix
    puts "Final bill : #{final_bill} + #{htmd1fix} = #{final}"
  end
end
