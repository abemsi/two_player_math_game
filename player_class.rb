def Player
  attr_accessor :name

  def initialize(name)
    @name = name
    @current_lives = 3
  end
end