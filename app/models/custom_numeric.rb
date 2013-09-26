class CustomNumeric

  def initialize num
    @number = num
  end
  
  def convert_to_words
    if is_valid?
      CustomNumeric.to_words(@number.to_i)
    else
      return "Please enter a valid Integer Value"
    end
  end
  
  def is_valid?
    !!(@number.to_s =~ /^[0-9]+$/)
  end
  
  class << self

    def get_word(key)
      WORDS[key] if WORDS.keys.include? key
    end

    def get_power(key)
      POWERS[key] if POWERS.keys.include? key
    end 
    
    def to_words(number)
      output = []
      length = number.to_s.length
      return get_word(number) if get_word(number)

      if length == 2 
        tens = (number/10).round*10               
        output << get_word(tens)     
        ones = number - tens                     
        output << get_word(ones) unless ones == 0
      elsif length == 3
        output << text_format(number, 0)
      elsif length > 3
        hash = group_digits(number, 3)
        hash.keys.sort.reverse.each do |key|
          output << text_format(hash[key], key)
        end
      end
      output.flatten.join(" ").strip
    end
     
    def text_format number, power
      output = []
      hash = group_digits number, 2
      hash.keys.sort.reverse.each do |key|
        if key == 0 and hash[key] > 0
          output << "and" if power == 0
          output << to_words(hash[key]) 
        elsif hash[key] > 0
          output << get_word(hash[key])
          output << get_power(key)
        end
      end
      output << get_power(power) unless power == 0 || number == 0
      output
    end 
     
    def in_groups_of_two num
      num.to_s.reverse.gsub(/(\d{2})(?=\d)/, '\\1,').reverse
    end
    
    def in_groups_of_three num
      num.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    end
  
    def group_digits num, size
      if size == 2
        arr = in_groups_of_two num
      else
        arr = in_groups_of_three num
      end
      arr = arr.split(",").reverse
      power = 0
      hash = {}
      arr.each do |digits|
        hash[power] = digits.to_i
        power += digits.length
      end
      hash
    end            
  end
  
end