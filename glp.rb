# calculate charge General Lighting Purpose
class GLP
  GLPF200R = 4.10
  GLP_REMR = 4.80
  GPLSPFIX = 30
  GPLTPFIX = 70

  attr_accessor :unit

  def initialize(unit)
    @unit = unit
  end

  def cal
    firstslab = (unit <= 200 && unit >= 0)
    final_bill = if firstslab
                   unit * GLPF200R
                 else
                   (GLPFS * GLPF200R) + ((unit - GLPFS) * GLP_REMR)
                 end
    final = final_bill + GPLSPFIX
    puts "For Single Phase : #{final_bill.round(2)} + #{GPLSPFIX} = #{final.round(2)}"
    final = (final_bill + GPLTPFIX)
    puts "For Three Phase : #{final_bill.round(2)} + #{GPLTPFIX} = #{final.round(2)}"
  end
end
