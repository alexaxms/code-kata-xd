class RestaurantServer
  def initialize(meal_factory)
    @meal_factory = meal_factory
  end

  def serve!
    @meal_factory.new_utensil
    @meal_factory.new_dish
  end
end

class RestaurantFactory
  def new_dish
    raise 'method not implemented'
  end

  def new_utensil
    raise 'method not implemented'
  end
end

class SushiMealFactory < RestaurantFactory
  def new_dish
    MaguroSashimi.new
  end

  def new_utensil
    Chopsticks.new
  end
end

class SteakMealFactory < RestaurantFactory
  def new_dish
    FiletMignon.new
  end

  def new_utensil
    Knife.new
  end
end

meal_factory = SushiMealFactory.new
restaurant_server = RestaurantServer.new(meal_factory)

restaurant_server.serve!