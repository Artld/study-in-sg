# Task: write a method extending String class
# to validate whether the brackets are closed properly.
# For example: '(<([])(){}>)()'.valid? => true, '[()(()])'.valid? => false
# Here is a realization of this idea: http://stackoverflow.com/a/2514098
class String
  def valid?
    str = clone
    loop do
      brackets = str[/\(\)|\[\]|\{\}|\<\>/]
      return false if brackets.nil?
      str[brackets] = ''
      break if str.empty?
    end
    true
  end
end

'([]{()})<>(())'.valid?
'([]{()})<(>())'.valid?
