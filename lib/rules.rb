# A bunch of rules methods

def evaluate (grid,row,col)
  live_neighbors = 0
  # row above
  if (grid[row-1][col-1].alive)
    live_neighbors +=1
  end
  if (grid[row-1][col].alive)
    live_neighbors +=1
  end
  if (grid[row-1][col+1].alive)
    live_neighbors +=1
  end
  # current row
  if (grid[row][col-1].alive)
    live_neighbors +=1
  end
  if (grid[row][col+1].alive)
    live_neighbors +=1
  end
  # row below
  if (grid[row+1][col-1].alive)
    live_neighbors +=1
  end
  if (grid[row+1][col].alive)
    live_neighbors +=1
  end
  if (grid[row+1][col+1].alive)
    live_neighbors +=1
  end
  live_neighbors
end
