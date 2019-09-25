class RestaurantServer
  def initialize(type)
    @factory_type = type
  end

  def serve!
    case(@factory_type)
    when 'sushi'
      MaguroSashimi.new
      Chopsticks.new
    when 'steak'
      FiletMignon.new
      Knife.new
    end
  end
end

restaurant_server = RestaurantServer.new('sushi')

restaurant_server.serve!