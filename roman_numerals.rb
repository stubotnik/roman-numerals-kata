
class RomanNumeralsConverter
  
  def initialize 
    @numerals = [
        {:dec => 1, :rom => 'I'}, 
        {:dec => 5, :rom => 'V'}, 
        {:dec => 10, :rom => 'X'}, 
        {:dec => 50, :rom => 'L'}, 
        {:dec => 100, :rom => 'C'}, 
        {:dec => 500, :rom => 'D'},
        {:dec => 1000, :rom => 'M'}
      ]

    @numerals.reverse!
    
    return
  end

  # break num apart into separate nums - digit plus zeros, skip over zero nums (2103 becomes 2000, 100, 3)
  # for each of those
  # work backwards thru array - how many times can I subract array[i] from it
  # after array inc/dec can array[i]-array[prev] be subtracted? ([prev] means decrement again if leading digit is 5)
  #   ie: 95 = XCV 
  # ...
  # high fives all round

  def to_roman (input)
      
    raise 'input is not an integer greater than zero' unless input.is_a? Integer and input > 0   
    
    # break num apart into separate nums - digit plus zeros, skip over zero nums
    digits = input.to_s.split(//)
    nums = []

    digits.each_index do |i| 
      zeros = ''
      (digits.size - 1 - i).times { zeros += '0' }
      nums.push (digits[i] + zeros).to_i 
    end

    nums.delete 0
    
    rom_num = ''
    
    nums.each do |n| 

      @numerals.each_index do |i|
        
        dec = @numerals[i][:dec]
        rom = @numerals[i][:rom]
        
        while n - dec >= 0
          n -= dec
          rom_num += rom
        end

        # the IV, IX, XC, CM case...
        if i + 1 < @numerals.size
          
          next_dec = @numerals[i+1][:dec]
          
          # look ahead to next increment for val to subtract - but only if leading digit is 1 
          if next_dec.to_s[0].to_i == 1 
          
            if n - (dec - next_dec) >= 0
              n -= (dec - next_dec)
              rom_num += @numerals[i+1][:rom] + rom
            end 
          else
             # if next increment begins with a 5, so move index on 2... 
             if i + 2 < @numerals.size
               
              next_dec = @numerals[i+2][:dec]
              
              if n - (dec - next_dec) >= 0
                n -= (dec - next_dec)
                rom_num += @numerals[i+2][:rom] + rom
              end 
            end
          end
          
        end  
      end
    end

    rom_num
  end
  
end