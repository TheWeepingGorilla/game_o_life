class World
  attr_accessor :present_grid, :future_grid

  def initialize
    @present_grid = [[],[],[],[],[],[],[],[]] # 8x8 grid
    @future_grid = [[],[],[],[],[],[],[],[]]
    populate(@present_grid)
    populate(@future_grid)
  end

  def populate(grid)
    grid.each do |row|
      8.times do row << Cell.new
      end
    end
  end

  def seed(grid)
    grid.each do |row|
      row.each do |cell|
        if (rand(1..4) == 4)
          cell.birth
        end
      end
    end
  end
end


