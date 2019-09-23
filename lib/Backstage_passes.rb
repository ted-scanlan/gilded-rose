require_relative './Item'

class BackstagePasses < Item

  def update
    @sell_in -= 1
    case @sell_in
    when -1..0
      @quality = 0
    when 1..5
      @quality += 3
    when 6..10
      @quality += 2
    else
      @quality += 1
    end

  end


end
