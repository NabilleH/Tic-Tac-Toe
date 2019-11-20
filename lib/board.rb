#Board class
class Board

  attr_accessor :fields

  def initialize
    @fields = { 1=> "", 2=> "", 3=> "", 4=> "", 5=> "",
                      6=> "", 7=> "", 8=> "", 9=> "" }
  end

end
