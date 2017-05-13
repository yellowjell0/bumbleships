module Coordinatable

  def parse_coordinate(user_coordinate)
    user_coordinate.downcase!
    letters = ("a".."z").to_a
    new_x = letters.index(user_coordinate[0])
    new_y = user_coordinate[1..2].to_i - 1
    binding.pry
    parsed_coordinate = "#{new_x}#{new_y}"
  end

  def get_x(coordinate)
    coordinate[0].to_i
  end

  def get_y(coordinate)
    coordinate[1].to_i
  end

  def check_if_valid?(possible_coordinates)
      in_bounds?(possible_coordinates) && spaces_available?(possible_coordinates)
  end

  def in_bounds?(possible_coordinates)
    bounds = (0..9).to_a
    possible_coordinates.all? {|coordinate| coordinate.length == 2 && bounds.include?(get_x(coordinate)) && bounds.include?(get_y(coordinate))}
  end

  def spaces_available?(possible_coordinates)
    possible_coordinates.all? do |coordinate|
      space = Space.find_by(coordinate: coordinate, board: self.player.board)
      space.status == "empty"
    end
  end

end
