require_relative './Item'

class Conjured < Item

  def update
    return if @quality == 0
    @sell_in -= 1
    @sell_in < 0 ? @quality -= 4 : @quality -= 2
    

  end


end
