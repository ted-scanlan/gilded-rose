require_relative './Item'

class AgedBrie < Item

  def update
    @sell_in -= 1
    return if @quality >= 50
    @sell_in < 0 ? @quality += 2 : @quality += 1

  end


end
