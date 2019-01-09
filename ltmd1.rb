# calculate charge for  Low Tension Maximum Demand for Residential Purpose
class LTMD1
  LTMD1L50 = 4.55
  LTMD1G50 = 4.70
  LTMD2L50 = 4.70
  LTMD2G50 = 4.90
  LTMDF50 = 150
  LTMDN30 = 185
  LTMDR = 245
  LTMD2F50 = 175
  LTMD2N30 = 230
  LTMD2R = 300

  attr_accessor :unit, :cat

  def initialize(unit, cat)
    @unit = unit
    @cat = cat
  end

  def cal
    puts 'press 1 For Billing Demand <= 50 KW'
    puts 'press 2 For Billing Demand > 50 KW'
    ltmd = gets.chomp
    ltmd = ltmd.to_i
    ltmd1 = 5
    if @cat == ltmd1
      ltmdl50 = LTMD1L50
      ltmdg50 = LTMD1G50
      ltmdn30 = LTMDN30
      ltmdf50 = LTMDF50
    else
      ltmdl50 = LTMD2L50
      ltmdg50 = LTMD2G50
      ltmdn30 = LTMD2N30
      ltmdf50 = LTMD2F50
    end
    if ltmd == 1
      final_bill = unit * ltmdl50
      final = final_bill + ltmdn30
      puts "Final bill : #{final_bill.round(2)} + #{ltmdn30} = #{final} "
    else
      final_bill = unit * ltmdg50
      final = final_bill + ltmdn30
      puts "Final bill : #{final_bill.round(2)} + #{ltmdf50} = #{final} "
    end
  end
end
