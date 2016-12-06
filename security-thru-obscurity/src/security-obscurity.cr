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
    true
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
