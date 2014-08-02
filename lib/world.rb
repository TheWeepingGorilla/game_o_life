class World
  require './lib/rules'
  attr_accessor :present_grid, :future_grid

  def initialize
    @present_grid = [[],[],[],[],[],[],[],[]] # 8x8 grid
    @future_grid = [[],[],[],[],[],[],[],[]]
    populate(@present_grid)
    populate(@future_grid)
  end

  def copy_present_to_future
    outer_index = 0
    inner_index = 0
    @future_grid.each do |row|
      row.each_with_index do |cell, inner_index|
        cell.alive = @present_grid[outer_index][inner_index].alive
      end
    outer_index += 1
    end
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
        if (rand(1..3) == 3)
          cell.birth
          cell.mark
        end
      end
    end
    copy_present_to_future
  end

  def create_the_future
    outer_index = 0
    inner_index = 0
    @present_grid.each do |row|
      row.each do |cell|
        if ( evaluate(@present_grid,outer_index,inner_index) == "kill" )
          @future_grid[outer_index][inner_index].kill
          puts "Killed a future cell"
        elsif ( evaluate(@present_grid,outer_index,inner_index) == "birth" )
          @future_grid[outer_index][inner_index].birth
          puts "Birthed a future cell"
          #@future_grid[outer_index][inner_index].mark
        end
        inner_index =+1
      end
      outer_index +=1
    end
  end
end
