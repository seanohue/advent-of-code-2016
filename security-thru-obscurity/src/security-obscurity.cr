require "./security-obscurity/*"
require "string_scanner"

module Security::Obscurity
  extend self

  def check_room(hash)
    check_sum = get_check_sum(hash)
    encrypted_name = get_encrypted_name(hash, check_sum)
    true
  end

  def get_check_sum(hash)
    hash[/(?<=\[).+?(?=\])/]
  end

  def get_encrypted_name(hash, check_sum)
    hash.chomp("[" + check_sum + "]").chop.chop.chop.delete("-")
  end

end
