# require 'pry'

class DayThree
  attr_accessor :oxy, :array

  def initialize(string)
    @string ||= string
    @array ||= []
    @oxy ||= []
  end

  def map_string_to_columns(string, array)
    string.each_line do |line|
      array << [line.chars.reject { |char| char == "\n" }.map(&:to_i)].flatten
    end
  end

  # o2 = [0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0].join.to_i(2) = 508
  # co2 = [0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0].join.to_i(2) = 1076
  # two = DayThree.new(string_me)
  # two.map_string_to_columns
  # load './day_three.rb'
  # array = two.array
  # array = [ [1,0,1,1,0], [1,0,1,1,1], [1,1,1,0,0],[0,0,1,0,0] ]
  # array.max_by { |i| row.count(i) }

  RESULTS = {
    'Allegoric Alaskans' => { 'MP' => 0,
                              'W' => 0,
                              'D' => 0,
                              'L' => 0,
                              'P' => 0 },
    'Allegoric Alaskans' => { 'MP' => 0,
                              'W' => 0,
                              'D' => 0,
                              'L' => 0,
                              'P' => 0 }
  }

  def oxygen_keep(index, array)
    index ||= 0
    # binding.pry
    array
      .sort
      .keep_if { |set| set[index] == (array.transpose.map { |row| row.max_by { |i| row.count(i) } }[index]) }
      .map do |set|
      index += 1
      [set] | oxygen_keep(index, array)
    end
  end

  def co2_keep(index, array)
    p index ||= 0
    # binding.pry
    array
      .sort
      .keep_if { |set| set[index] == (array.transpose.map { |row| row.min_by { |i| row.count(i) } }[index]) }
      .map do |set|
      index += 1
      [set] | oxygen_keep(index, array)
    end
  end

  def gamma_rate
    @array
      .transpose
      .map { |row| row.max_by { |i| row.count(i) } }
  end

  def epsilon_rate
    @array
      .transpose
      .map { |row| row.min_by { |i| row.count(i) } }
  end

  def power_consumption
    map_string_to_columns
    puts gamma_rate.join.to_i(2) * epsilon_rate.join.to_i(2)
  end
end
