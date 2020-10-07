class Restaurant
  attr_reader :opening_time, :name, :dishes

  def initialize(opening_time, name)
    @opening_time = opening_time
    @name = name
    @dishes = []
  end

  def closing_time(hours)
    (@opening_time[0..1].to_i + hours).to_s + @opening_time[2..-1]
  end

  def add_dish(dish)
    @dishes << dish
  end

  def open_for_lunch?
    if @opening_time.to_i < 12
      true
    else
      false
    end
  end

  def menu_dish_names
    @dishes.map do |dish|
      dish.upcase
    end
  end

  def announce_closing_time(hours)
    time = @opening_time.to_i + hours
    if time > 12
      "#{@name} will be closing at #{(time - 12).to_i}#{@opening_time[2..-1]}PM"
    elsif time >= 10
      "#{@name} will be closing at #{time}#{@opening_time[1..-1]}AM"
    else
      "#{@name} will be closing at #{time}#{@opening_time[1..-1]}AM"
    end
  end
end
