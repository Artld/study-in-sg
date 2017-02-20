# Task: there is a file containing dates and temperatures in csv format:
# 30.01, -7
# Print an average temperature for each month.

require 'csv'

# Reads and prints csv data
class AverageTemps
  def initialize(path = './temperatures.csv')
    @path = path
  end

  def out
    h_table = {}
    CSV.foreach(@path) do |row|
      month = row[0].split('.')[1]
      h_table[month] = MonthTemps.new unless h_table.key?(month)
      h_table[month].add_temperature(row[1])
    end
    h_table.each { |key, value| puts "#{key} : #{value.average}" }
  end
end

# Keeps temperatures of single month
class MonthTemps
  def initialize
    @temperatures = []
  end

  def add_temperature(t)
    @temperatures << t.to_i
  end

  def average
    raise 'no temperatures!' if @temperatures.empty?
    @temperatures.inject(:+) / @temperatures.size
  end
end

at = AverageTemps.new
at.out
