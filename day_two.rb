class DayTwo
  def initialize(string)
    @string = string
    @forward = 0
    @depth = 0
    @aim = 0
  end

  def map_string
    @string.each_line do |line|
      command, x = line.split(' ')

      case command
      when 'forward'
        @forward += x.to_i
        @depth += @aim * x.to_i
      when 'up'
        @aim -= x.to_i
      when 'down'
        @aim += x.to_i
      else
        raise 'that sux man'
      end
    end
  end

  def final_position
    map_string
    puts(@forward * @depth)
  end
end
