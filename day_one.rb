class DayOne
  def initialize(string)
    @string ||= string
  end

  def sub_attack
    count = 0
    measurement = -1
    @string.each_line do |number|
      count += 1 if number.to_i > measurement
      measurement = number.to_i
    end
    puts count
  end
end
