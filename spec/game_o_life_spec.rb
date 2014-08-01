require 'cell'
require 'world'
require 'rspec'

describe 'Cell'
  it 'intializes cell' do
    test_cell = Cell.new
    expect(test_cell).to be_an_instance_of (Cell)
  end
end
