module SpacesHelper
  def parse_coordinate(user_coordinate)
    user_coordinate.downcase!
    letters = ("a".."j").to_a
    new_x = letters.index(user_coordinate[0])
    new_y = user_coordinate[1].to_i - 1
    parsed_coordinate = new_x + new_y.to_s
  end
end
