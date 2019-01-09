require 'byebug'
class PowerCal
  # unit charge slote
  RGPF50R = 3.20
  
  BPLF30R = 1.50
  BPLN20R =3.20

  RGP_BPL_N150R = 3.90
  RGP_BPL_REMR = 4.90

  GLPF200R = 4.10
  GLP_REMR = 4.80

  NONRGBR = 4.50

  LTPR = 3.30

  LTMD1L50 = 4.55
  LTMD1G50 = 4.70

  LTMD2L50 = 4.70
  LTMD2G50 = 4.90

  SLR = 4.20

  TMPR = 5.00

  HTMD1FR = 4.45
  HTRMD1REMR = 4.35

  HTMD2R = 4.00

  HTMD3R = 6.95
    
  
  # fix charge for single phase and three phase
  RGPSPFIX = 25
  RGPTPFIX =65

  GPLSPFIX = 30
  GPLTPFIX = 70

  TMPFIX = 25

  NONRGBL5 = 70
  NONRGB15 = 90

  LTMDF50 = 150
  LTMDN30 = 185
  LTMDR  = 245

  LTMD2F50 = 175
  LTMD2N30 = 230
  LTMD2R  = 300

  HDMD1U1000 = 260
  HDMD1A1000 = 335

  HTMD2OD = 225
  HTMD2ED = 285 

  HTMD3OD = 25
  HTMD3ED = 30


  # monthly slab
  RGPFS = 50
  RGPNS  = 150

  BPLFS = 30
  BPLNS = 20
  BPLNNS = 150

  GLPFS = 200

  # Fix BHP & Demand

  FIXBHP = 10
  FIXKW = 80
  
  HDMDFIXKW = 2000

  HTMD2FIXD = 800

  def initialize
    @cat=0
    @unit=0
    @final_bill=0
  end
  
    def take_cat_And_Unit
      flag = 0 
      loop do
        
        if flag == 0 
      puts "Select Your Category"
      puts "1) RGP : Residential Purpose"
      puts "2) GLP : For Hospitals, Schools &amp"
      puts "3) Non-RGP : Commercial and Industrial Purpose"
      puts "4) LTP (AG) : For Agricultural Purpose"
      puts "5) LTMD 1 : For Residential Purpose"
      puts "6) LTMD 2 : For Commercial/Industrial Purpose"
      puts "7) SL : For Street Light"
      puts "8) TMP : For Temporary Supply"
      puts "9) HTMD-1 : For High Tension Load"
      puts "10) HTMD-2 : For High Tension AMC Pumping Stations"
      puts "11) HTMD-3 : For Temporary Supply (100 kW &amp; Above)"
      puts 
      @cat = gets
        else
      puts "Enter valid input"
      puts "Select Your Category"
      puts "1) RGP : Residential Purpose"
      puts "2) GLP : For Hospitals, Schools &amp"
      puts "3) Non-RGP : Commercial and Industrial Purpose"
      puts "4) LTP (AG) : For Agricultural Purpose"
      puts "5) LTMD 1 : For Residential Purpose"
      puts "6) LTMD 2 : For Commercial/Industrial Purpose"
      puts "7) SL : For Street Light"
      puts "8) TMP : For Temporary Supply"
      puts "9) HTMD-1 : For High Tension Load"
      puts "10) HTMD-2 : For High Tension AMC Pumping Stations"
      puts "11) HTMD-3 : For Temporary Supply (100 kW &amp; Above)"
      puts 
      @cat = gets
      
        end
        flag = 1
  break if (@cat.to_i <=11 && @cat.to_i >0)
end 
      
      puts "Enter your Unit"
      @unit = gets
      byebug
      charge_per_cat_per_month()
    end

    def charge_per_cat_per_month
      
      @cat = @cat.to_i
      @unit = @unit.to_i
      case @cat
        
        when 1
          monthly_Slab(1)
        when 2
          monthly_Slab(2)
        when 3
          monthly_Slab(3)
        when 4
          monthly_Slab(4)
        when 5
          monthly_Slab(5)
        when 6
          monthly_Slab(6)
        when 7
          monthly_Slab(7)
        when 8
        monthly_Slab(8)
        when 9
        monthly_Slab(9)
        when 10
        monthly_Slab(10)
        when 11
        monthly_Slab(11)
      end
    end

    def monthly_Slab(cat)

      case @cat
        
        when 1
          bpl=""
          flag = 1
          loop do
            if flag == 1 
             puts "Are you Below Poverty Line Press y if yes Or Prees n"
            else
              puts "plz enter valid input"
              puts "Are you Below Poverty Line Press y if yes Or Prees n"
            end
              bpl = gets.chomp
              bpl = bpl.upcase
              flag =0 
          break if (bpl == 'Y' or bpl == 'N')  
          end 
          
          rbp_slab(bpl)
        when 2
          gpl_slab()
        when 3
          non_rgp_slab()
        when 4
          ltp()
        when 5
         ltmd1(1)
        when 6
          ltmd1(2)
        when 7
          stree_Light()
        when 8
          tmp()
        when 9
          htmd1()
        when 10
          htmd2()
        when 11
          htmd3()
      end
    end

    def htmd3
       @final_bill = @unit * HTMD3R

        if (HTMD2FIXD <= 800)
        fixcharge = HTMD3OD
      else
        fixcharge = HTMD3ED
      end
        final = @final_bill + fixcharge
        puts "Final bill : #{@final_bill} + #{fixcharge} = #{final}"
    end

    def htmd2()

      @final_bill = @unit * HTMD2R

      if (HTMD2FIXD <= 800)
        fixcharge = HTMD2OD
      else
        fixcharge = HTMD2ED
      end
        final = @final_bill + fixcharge
        puts "Final bill : #{@final_bill} + #{fixcharge} = #{final}"
      
    end

    def htmd1

      if (@unit <=400 && @unit >=0)
      @final_bill = @unit * HTMD1FR

    else
      @final_bill = @unit * HTRMD1REMR
      
      end
      if HDMDFIXKW <= 1000
        htmd1fix = HDMD1U1000
      else
         htmd1fix = HDMD1A1000
      end
        final = @final_bill + htmd1fix

        puts "Final bill : #{@final_bill} + #{htmd1fix} = #{final}"
    end





    def tmp
      @final_bill = @unit * TMPR
      final = @final_bill + TMPFIX
      puts "Final bill : #{@final_bill} + #{TMPFIX} = #{final}"
    end

  def stree_Light()

    @final_bill = @unit * SLR
    puts "Final bill : #{@final_bill}"
  end

    def ltmd1(num)
      puts "press 1 For Billing Demand <= 50 KW"
      puts "press 2 For Billing Demand > 50 KW"
      ltmd = gets.chomp
      ltmd = ltmd.to_i
      # byebug
        if (num == 1)
          ltmdl50 = LTMD1L50
          ltmdg50 = LTMD1G50
          ltmdn30 = LTMDN30
          ltmdf50 = LTMDF50
        else
          ltmdl50 = LTMD2L50
          ltmdg50 = LTMD2G50
          ltmdn30 = LTMD2N30
          ltmmdf50 = LTMD2F50
        end
        if ltmd == 1
        @final_bill = @unit * ltmdl50
        final = @final_bill + ltmdn30
        puts "Final bill : #{@final_bill} + #{ltmdn30} = #{final} "
        else
        @final_bill = @unit * ltmdg50
        final = @final_bill + ltmdf50
        puts "Final bill : #{@final_bill} + #{ltmdf50} = #{final} "

      end
      end
      

    def ltp
      if (@unit > 0)
        @final_bill =  @unit * LTPR
      else
        @final_bill = FIXBHP * 10
      end
       puts "Final bill : #{@final_bill}"
    end

    def non_rgp_slab()

        @final_bill = @unit * NONRGBR

        final = (@final_bill + NONRGBL5)
        puts "Final Bill For <= 5KW : #{@final_bill.round(2)} + #{NONRGBL5} = #{final}"
        final = (@final_bill + NONRGB15)
        puts "Final Bill For  >5KW & <= 15KW : #{@final_bill.round(2)} + #{NONRGB15} = #{final}"
    end

    def gpl_slab
      
      if (@unit <=200 && @unit >= 0)

          @final_bill = @unit * GLPF200R
      else

        @final_bill = (GLPFS * GLPF200R) + ((@unit - GLPFS) * GLP_REMR)
    
      end 
          final = @final_bill + GPLSPFIX
          puts "For Single Phase : #{@final_bill.round(2)} + #{GPLSPFIX} = #{final.round(2)}"
          final = (@final_bill + GPLTPFIX)
          puts "For Three Phase : #{@final_bill.round(2)} + #{GPLTPFIX} = #{final.round(2)}"
          
    end

    def rbp_slab(cat)

      cat = cat.upcase

      if(cat != 'Y')
          if (@unit <= RGPFS && @unit >= 0)
          @final_bill = @unit * RGPF50R
          elsif (@unit <= RGPNS)
          @final_bill = (RGPFS * RGPF50R) + ((@unit - RGPFS) * RGP_BPL_N150R)
          else
          @final_bill = (RGPFS * RGPF50R) + (RGPNS * RGP_BPL_N150R) + ((@unit - RGPNS) * RGP_BPL_REMR)  
          end
          final = (@final_bill + RGPSPFIX)
          puts "For Single Phase : #{@final_bill} + #{RGPSPFIX} = #{final}"
          final = (@final_bill + RGPTPFIX)
          puts "For Three Phase : #{@final_bill} + #{RGPTPFIX} = #{final}"
        else
          if (@unit <= BPLFS && @unit >=0)
            @final_bill = @unit * BPLF30R
          elsif (@unit <= (BPLFS+BPLNS))
            @final_bill = (BPLFS * BPLF30R) + ((@unit - BPLFS) * BPLN20R)
          elsif (@unit <= (BPLFS + BPLNS + BPLNNS))
            @final_bill = (BPLFS * BPLF30R) + (BPLNS * BPLN20R) + (@unit - (BPLFS + BPLNS))
          else
            @final_bill = (BPLFS * BPLF30R) + (BPLNS * BPLN20R) + (BPLNNS * RGP_BPL_N150R) + ((@unit - (BPLFS + BPLNS + BPLNNS)) * RGP_BPL_REMR)
          end

          final = (@final_bill + 5)
          puts "Final Bill : #{@final_bill} + 5 = #{final}"
          
      end
      end
      
  
end

  PowerCal.new.take_cat_And_Unit