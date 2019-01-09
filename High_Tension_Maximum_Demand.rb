class High_Tension_Maximum_Demand

  attr_accessor :unit

  FIRST_SLAB_RATE = 4.45
  REM_SLAB_RATE = 4.35

  FIRST_SLAB = 400
  BDUPTO= 1000

  FIXKW = 800

  UPTO1000 = 260
  ABOVE1000 = 335
  

  def initialize(unit)
    @unit = unit
  end

  def cal
    if (unit <= FIRST_SLAB && unit >= 0)
      final_bill = unit * FIRST_SLAB_RATE

    else
      final_bill = (FIRST_SLAB * FIRST_SLAB_RATE) + ((unit - FIRST_SLAB) * REM_SLAB_RATE)
      end

      if FIXKW <= BDUPTO
        htmd1fix = UPTO1000
      else
         htmd1fix = ABOVE1000
      end
        final = final_bill + htmd1fix

        puts "Final bill : #{final_bill} + #{htmd1fix} = #{final}"
  end
end