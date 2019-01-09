require 'byebug'
require_relative 'rgp'
require_relative 'glp'
require_relative 'NonRgpSlab'
require_relative 'ltp'
require_relative 'ltmd1'
require_relative 'StreetLightService'
require_relative 'LowTensionTemporarySupply'
require_relative 'HighTensionMaximumDemand'
require_relative 'HighTensionWaterAndSewagePumping'
require_relative 'HighTensionMaximumDemandTemporarySupply'

# Class for take input Unit and categoris form user and call different class
class Torrent
  attr_accessor :unit

  def initialize
    @cat = 0
    @unit = 0
    # rubocop:disable LineLength
    @arry_cat = ['1) RGP : Residential Purpose', '2) GLP : For Hospitals,  Schools &amp', '3) Non-RGP : Commercial and Industrial Purpose', '4) LTP (AG) : For Agricultural Purpose', '5) LTMD 1 : For Residential Purpose', '6) LTMD 2 : For Commercial/Industrial Purpose', '7) SL : For Street Light', '8) TMP : For Temporary Supply', '9) HTMD-1 : For High Tension Load', '10) HTMD-2 : For High Tension AMC Pumping Stations', '11) HTMD-3 : For Temporary Supply (100 kW &amp; Above)']
    # rubocop:enable LineLength
  end

  def take_cat
    flag = 0
    loop do
      flag.zero? ? (puts 'Select Your Category') : (puts 'Enter valid input')
      data_for_input
      @cat = gets
      flag = 1
      true_input_for_cat = @cat.to_i <= 11 && @cat.to_i > 0
      break if true_input_for_cat
    end
  end

  def take_input
    take_cat
    @cat = @cat.to_i
    puts 'Enter your Unit'
    self.unit = gets.chomp.to_i
    charge_per_cat_per_month
  end

  def data_for_input
    @arry_cat.each { |a| puts a }
  end

  def charge_per_cat_per_month
    case @cat
    when 1
      RGP.new(unit).bpl
    when 2
      GLP.new(unit).cal
    when 3
      NON_RGP.new(unit).cal
    when 4
      LTP.new(unit).cal
    when 5
      LTMD1.new(unit, @cat).cal
    when 6
      LTMD1.new(unit, @cat).cal
    when 7
      StreetLightService.new(unit).cal
    when 8
      LowTensionTemporarySupply.new(unit).cal
    when 9
      HighTensionMaximumDemand.new(unit).cal
    when 10
      HighTensionWaterAndSewagePumping.new(unit).cal
    when 11
      HighTensionMaximumDemandTemporarySupply.new(unit).cal
    end
  end
end

Torrent.new.take_input
