require_relative './Item'

class BackstagePasses < Item
  MAX = 50

  def update
    @sell_in -= 1
    return if @quality >= 50
    case @sell_in
    when -1..0
      @quality = 0
    when 1..5
      @quality == 48 || @quality == 49 ? @quality = MAX : @quality += 3
    when 6..10
      @quality == 49 ? @quality = MAX : @quality += 2
    else
      @quality += 1
    end

  end


end
