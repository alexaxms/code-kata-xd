class Game < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :title, :category_id, :description,
                        :price, :platform, :year
end

class GamePriceService
  attr_accessor :game

  # we could use a config file
  BASE_URL = "http://thegamedatabase.com/api/game"
  API_KEY = "ek2o1je"

  def initialize(game)
    self.game = game
  end

  def get_price(json_parser = JsonParserLib)
    data = open("#{BASE_URL}/#{game.name}/price?api_key=#{API_KEY}")
    json_parser.parse(data)
  end
end

class GamePrinter
  attr_accessor :game

  def initialize(game)
    self.game = game
  end

  def print(game_webservice = GamePriceService)
    price_service = game_webservice.new(game)
    <<-EOF
      #{game.name}, #{game.platform}, #{game.year} 
      current value is #{price_service.get_price[:value]}
    EOF
  end
end

# Usage example:
game = Game.new(some_game_data)
webservice = GamePriceService.new(game)
game.price = webservice.get_price

GamePrinter.new(game).print