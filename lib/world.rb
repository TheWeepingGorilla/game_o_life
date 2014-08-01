class World
  require './lib/rules'
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
          cell.mark
        end
      end
    end
  end

  def create_the_future
    outer_index = 0
    inner_index = 0
    @present_grid.each do |row|
      outer_index +=1
      row.each do |cell|
        inner_index =+1
        if ( evaluate(@present_grid,outer_index,inner_index) == "kill" )
          @future_grid[outer_index][inner_index].kill
        elsif ( evaluate(@present_grid,outer_index,inner_index) == "birth" )
          @future_grid[outer_index][inner_index].birth
          @future_grid[outer_index][inner_index].mark
        end
      end
    end
  end
end

# how do i access the index?
#   array.each_with_index |row, index|
#     row[index] = row[]

#     index will be 0 to 63
#     let's not use index
