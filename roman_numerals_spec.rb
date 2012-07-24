
require File.expand_path(File.dirname(__FILE__) + '/roman_numerals')

describe 'roman numerals' do
  
  before(:each) do
    @converter = RomanNumeralsConverter.new
  end
  
  it 'accepts integers > 0 only' do
   
    expect { @converter.to_roman -1 }.to raise_error 'input is not an integer greater than zero'
    expect { @converter.to_roman 0 }.to raise_error 'input is not an integer greater than zero'
    expect { @converter.to_roman 3.5 }.to raise_error 'input is not an integer greater than zero'
    expect { @converter.to_roman 'abc' }.to raise_error 'input is not an integer greater than zero'   
  end
  
  it 'returns a roman numeral using the letters I,V,X,L,C and M only' do

    @converter.to_roman(1234).should match /^[IVXLCM]+$/
  end
  
  # these tests are a bit silly
  # to answer the kata's question - can you work out the algorithm using strict TDD? um, not really...
  
  it 'represents numbers < (5-1) with I' do
    
    @converter.to_roman(1).should match 'I'
    @converter.to_roman(2).should match 'II'
    @converter.to_roman(3).should match 'III'
    
  end
  
  it 'represents numbers >= (5-1) and < (10-1) with I and V' do
    
    @converter.to_roman(4).should match 'IV'
    @converter.to_roman(5).should match 'V'
    @converter.to_roman(6).should match 'VI'
    @converter.to_roman(7).should match 'VII'
    @converter.to_roman(8).should match 'VII'
    
  end
  
  it 'represents numbers >= (10-1) and < (50-10) with I,V and X'  do

    @converter.to_roman(9).should match 'IX'
    @converter.to_roman(10).should match 'X'
    @converter.to_roman(11).should match 'XI'
    @converter.to_roman(15).should match 'XV'
    @converter.to_roman(20).should match 'XX'
    @converter.to_roman(39).should match 'XXXIX'
  end

  it 'represents numbers >= (50-10) and < (100-10) with I,V,X and L'  do

    @converter.to_roman(40).should match 'XL'
    @converter.to_roman(49).should match 'XLIX'
    @converter.to_roman(50).should match 'L'
    @converter.to_roman(60).should match 'LX'
    @converter.to_roman(89).should match 'LXXXIX'

  end

  # etc..

  it 'converts the acceptance test correctly!' do

    @converter.to_roman(1999).should match 'MCMXCIX'

  end

end