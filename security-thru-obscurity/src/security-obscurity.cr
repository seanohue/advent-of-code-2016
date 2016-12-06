require "./security-obscurity/*"
require "string_scanner"

module Security::Obscurity
  extend self

  def check_room(hash)
    check_sum = get_check_sum(hash)
    encrypted_name = get_encrypted_name(hash, check_sum)
    is_legit_room(encrypted_name, check_sum)
  end


  def get_check_sum(hash)
    hash[/(?<=\[).+?(?=\])/]
  end

  def get_encrypted_name(hash, check_sum)
    remove_check_sum(hash, check_sum).chop.chop.chop.delete("-")
  end

  def is_legit_room(encrypted_name, check_sum)
    freq = {} of Char => Int32

    encrypted_name.each_char do |char|  
      count_char(freq, char)
    end

    threshold = [] of Int32
    freq.each do |char, amt|
      count_top_five(threshold, amt)
    end

    threshold.sort![0]
    puts "threshold list"
    puts threshold
    highest_five = freq.select do |k, v|
      v >= threshold[0]
    end
    puts "highest five map"
    puts highest_five
    decoded_array = [] of Char
    highest_five.each do |k, v|
      decoded_array.push k
    end

    decoded_name = decoded_array.sort[0..4].join 
    puts "decode"
    puts decoded_name
    puts "check_sum"
    puts check_sum
    decoded_name == check_sum
  end


  def count_top_five(threshold, amt)
    if threshold.size < 6
        threshold.push amt
      else
        threshold.sort!
        if amt > threshold[0]
          threshold[0] = amt
        end
      end
  end

  def count_char(freq, char)
    if freq.has_key? char 
        freq[char] = freq[char] + 1
      else
        freq[char] = 1
      end
  end

  def remove_check_sum(hash, check_sum)
    hash.chomp("[" + check_sum + "]")
  end

  def get_room_number(hash, check_sum)
   remove_check_sum(hash, check_sum)[-3, 3]
  end

end
