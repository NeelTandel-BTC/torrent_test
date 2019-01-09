# calculate charge Residential General Purpose
class RGP
  RGPF50R = 3.20
  RGP_BPL_N150R = 3.90
  RGP_BPL_REMR = 4.90
  RGPSPFIX = 25
  RGPTPFIX = 65
  RGPFS = 50
  RGPNS = 150
  BPLFS = 30
  BPLNS = 20
  BPLNNS = 150
  BPLF30R = 1.50
  BPLN20R = 3.20
  FIXCHARGEBPL = 5

  attr_accessor :unit

  def initialize(unit)
    @unit = unit
  end

  def bpl
    bpl = ''
    flag = 0
    loop do
      if flag.zero?
        puts 'Are you Below Poverty Line Press y if yes Or Prees n'
      else
        puts 'plz enter valid input'
        puts 'Are you Below Poverty Line Press y if yes Or Prees n'
      end
      bpl = gets.chomp
      bpl = bpl.upcase
      flag = 1
      valid_input = (bpl == 'Y' || bpl == 'N')
      break if valid_input
    end
    rgp_cal(bpl)
  end

  def rgp_cal(bpl)
    bpl == 'Y' ? rgp_bpl : rgp
  end

  def rgp
    unitlessthenfirstslap = (unit <= RGPFS && unit >= 0)
    firstslabcal = RGPFS * RGPF50R
    if unitlessthenfirstslap
      final_bill = unit * RGPF50R
    elsif unit <= RGPNS
      final_bill = firstslabcal + ((unit - RGPFS) * RGP_BPL_N150R)
    else
      final_bill = firstslabcal + (RGPNS * RGP_BPL_N150R) + ((unit - RGPNS) * RGP_BPL_REMR)
    end
    final = (final_bill + RGPSPFIX)
    puts "For Single Phase : #{final_bill.round(2)} + #{RGPSPFIX} = #{final.round(2)}"
    final = (final_bill + RGPTPFIX)
    puts "For Three Phase : #{final_bill.round(2)} + #{RGPTPFIX} = #{final.round(2)}"
  end

  def rgp_bpl
    first50cal = (BPLFS * BPLF30R) + (BPLNS * BPLN20R)
    first150cal = BPLNNS * RGP_BPL_N150R
    f50150cal = first50cal + first150cal
    first50slab = BPLFS + BPLNS
    reminingunit = first50slab + BPLNNS
    lessthenfirstslab = unit <= BPLFS && unit >= 0
    if lessthenfirstslab
      final_bill = unit * BPLF30R
    elsif unit <= first50slab
      final_bill = (BPLFS * BPLF30R) + ((unit - BPLFS) * BPLN20R)
    elsif unit <= reminingunit
      final_bill = first50cal + (unit - first50slab)
    else
      final_bill = f50150cal + ((unit - reminingunit) * RGP_BPL_REMR)
    end
    final = (final_bill + FIXCHARGEBPL)
    puts "Final Bill : #{final_bill} + #{FIXCHARGEBPL} = #{final}"
  end
end
