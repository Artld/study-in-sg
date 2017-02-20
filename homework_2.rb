# Task: print a matrix of primes from 2 to specified number
# as showen here: https://github.com/dgrebenyuk/courses/blob/master/HomeWorks/Task2_Feb_23.txt
class PrimeMatrix
  def initialize(max)
    @max = max
  end

  def out
    primes = []
    (2..@max).each { |num| primes << num.to_s if prime?(num) }
    add_spaces!(primes)
    print_matrix(primes)
  end

  private

  def prime?(num)
    i = 2
    while i <= num / i
      return false if (num % i).zero?
      i += 1
    end
    true
  end

  def add_spaces!(arr)
    length = arr.last.length
    (0...arr.size - 1).each do |i|
      (length - arr[i].length).times { arr[i] = ' ' + arr[i] }
    end
  end

  def print_matrix(arr)
    arr.size.times do
      print_string(arr)
      arr = arr.push(arr.shift)
    end
  end

  def print_string(arr)
    (0...arr.size).each do |i|
      print arr[i]
      print i == arr.size - 1 ? "\n" : ' '
    end
  end
end

pm = PrimeMatrix.new(103)
pm.out
