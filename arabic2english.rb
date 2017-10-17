# Use Gem
require 'to_words'

# Simple util for numeric check
class String
  def is_integer?
    Integer(self) != nil rescue false
  end
end

# Show usage if no argument(s) passed
if ARGV.empty?
  puts 'This prints english word of integer number provided. (Supports multi arguments)'
  puts 'Usage example:'
  puts 'ruby arabic2english.rb 1'
  puts 'ruby arabic2english.rb 1 11 100'
  exit
end

# Loop arguments
ARGV.each do | value |
  puts value.to_words if value.is_integer?
  puts "Arument '#{value}' is invalid numeric value." unless value.is_integer?
end
