require_relative './Item'

class NormalItem < Item

  def update
    return if @quality == 0
    @sell_in -= 1

    @sell_in <= 0 ? @quality -= 2 : @quality -= 1

  end


end
