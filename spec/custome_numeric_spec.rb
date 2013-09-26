require "spec_helper"

describe CustomNumeric do
  it "should check for valid values" do
    
  end
  
  it "should print the digits 0-9 correctly" do
    numbers = %w[zero one two three four five six seven eight nine]
    10.times do |i| 
      num = CustomNumeric.new(i)
      num.convert_to_words.should==numbers[i]
    end
  end

  it "should print the digits 11-19 correctly" do
    words = %w[eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
    numbers = [11,12,13,14,15,16,17,18,19]
    numbers.each_with_index do |number, index|
      num = CustomNumeric.new(number)
      num.convert_to_words.should==words[index]
    end
  end

  it "should handle two digit numbers" do
    num = CustomNumeric.new(21)
    num.convert_to_words.should == "twenty one"
  end

  it "should handle three digit numbers" do
    CustomNumeric.new(113).convert_to_words.should == "one hundred and thirteen"
    CustomNumeric.new(299).convert_to_words.should == "two hundred and ninety nine"
    CustomNumeric.new(300).convert_to_words.should == "three hundred"
    CustomNumeric.new(101).convert_to_words.should == "one hundred and one"
  end

  it "should print out some random examples correctly" do
    CustomNumeric.new(2999).convert_to_words.should == "two thousand nine hundred and ninety nine"
    CustomNumeric.new(99999).convert_to_words.should == "ninety nine thousand nine hundred and ninety nine"
    CustomNumeric.new(999999).convert_to_words.should == "nine hundred ninety nine thousand nine hundred and ninety nine"
    CustomNumeric.new(123456).convert_to_words.should == "one hundred twenty three thousand four hundred and fifty six"
    CustomNumeric.new(17054).convert_to_words.should == "seventeen thousand and fifty four"
    CustomNumeric.new(11004).convert_to_words.should == "eleven thousand and four"
    CustomNumeric.new(470154).convert_to_words.should == "four hundred seventy thousand one hundred and fifty four"
    CustomNumeric.new(417155).convert_to_words.should == "four hundred seventeen thousand one hundred and fifty five"
    CustomNumeric.new(999999).convert_to_words.should == "nine hundred ninety nine thousand nine hundred and ninety nine"
    CustomNumeric.new(1000000).convert_to_words.should == "one million"
    CustomNumeric.new(1000001).convert_to_words.should == "one million and one"
    CustomNumeric.new(112).convert_to_words. should == "one hundred and twelve"
  end

  it "should handle edge cases" do
    CustomNumeric.new(1000001).convert_to_words. should == "one million and one"
    CustomNumeric.new((10*10**12 + 10**6 +1)).convert_to_words. should == "ten trillion one million and one"
    CustomNumeric.new((10**75)).convert_to_words. should == "one quattuorvigintillion"
    CustomNumeric.new(10001001).convert_to_words. should == "ten million one thousand and one"
  end
end