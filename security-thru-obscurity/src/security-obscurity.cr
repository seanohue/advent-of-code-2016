require "./security-obscurity/*"

module Security::Obscurity
  extend self
  def check_room(hash)
    check_sum = get_check_sum(hash)
    true
  end
  def get_check_sum(hash)
    hash[/(?<=\[).+?(?=\])/]
  end
end
