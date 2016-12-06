require "./security-obscurity/*"

module Security::Obscurity
  extend self

  def sum_legit_rooms(room_str)
    room_array = get_rooms_by_str(room_str)
    room_numbers = room_array
      .select { |s| check_room(s) }
      .map { |s| get_room_number(s, get_check_sum(s)) }
      .map { |s| s.to_i32 }
    
    room_numbers.reduce { |acc, n| acc + n }
  end

  def get_rooms_by_str(room_str)
    room_str.gsub(/\s+/m, ' ').strip.split(" ")
  end 

  def check_room(hash)
    puts "CHECKING::::"
    puts hash
    check_sum = get_check_sum(hash)
    puts "check sum::::"
    puts check_sum
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
    frequency = get_frequency_map(encrypted_name)
    decoded_name = decode_by_freq(get_highest_five(frequency)).join 
    puts "decoded name::::"
    puts decoded_name
    decoded_name == check_sum
  end

  def get_frequency_map(encrypted_name)
    freq = {} of Char => Int32

    encrypted_name.each_char do |char|  
      count_char(freq, char)
    end
    freq
  end

  def count_char(freq, char)
    if freq.has_key? char 
        freq[char] = freq[char] + 1
      else
        freq[char] = 1
      end
  end

  def decode_by_freq(highest_five)
    decoded_array = [] of Char
    highest_five.each do |k, v|
      decoded_array.push k
    end
    decoded_array.sort[0..4]
  end

  def get_highest_five(freq)
    threshold = get_threshold(freq)
    freq.select do |k, v|
      v >= threshold
    end
  end

  def get_threshold(freq)
    threshold_list = [] of Int32
    freq.each do |char, amt|
      count_top_five(threshold_list, amt)
    end
    threshold_list.sort![0]
  end

  def count_top_five(threshold_list, amt)
    if threshold_list.size < 6
        threshold_list.push amt
      else
        threshold_list.sort!
        if amt > threshold_list[0]
          threshold_list[0] = amt
        end
      end
  end

  def remove_check_sum(hash, check_sum)
    hash.chomp("[" + check_sum + "]")
  end

  def get_room_number(hash, check_sum)
   remove_check_sum(hash, check_sum)[-3, 3]
  end

end
