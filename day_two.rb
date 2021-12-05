class DayTwo
  def initialize(string)
    @string ||= string
    @forward ||= 0
    @depth ||= 0
  end

  def map_string
    @string.each_line do |line|
      sub_input = line.split(' ')
      case sub_input[0]
      when 'forward'
        @forward += sub_input[1].to_i
      when 'up'
        @depth -= sub_input[1].to_i
      when 'down'
        @depth += sub_input[1].to_i
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
