class Player
  attr_reader :name, :mark

  def initialize(name = 'name', mark = 'mark')
    @name = name
    @mark = mark
  end
end
