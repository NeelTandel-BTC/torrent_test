# calculate charge Low Tension Service for Commercial and Industrial Purpose
class NON_RGP
  NONRGBR = 4.50
  NONRGBL5 = 70
  NONRGB15 = 90

  def initialize(unit)
    @unit = unit
  end

  def cal
    final_bill = @unit * NONRGBR
    final = final_bill + NONRGBL5
    puts "Final Bill For <= 5KW : #{final_bill.round(2)} + #{NONRGBL5} = #{final}"
    final = final_bill + NONRGB15
    puts "Final Bill For  >5KW & <= 15KW : #{final_bill.round(2)} + #{NONRGB15} = #{final}"
  end
end
