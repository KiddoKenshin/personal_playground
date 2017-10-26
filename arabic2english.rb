# Simple util for numeric check
class String
  def is_integer?
    Integer(self) != nil rescue false
  end
end

WORDS = {
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen',
  20 => 'twenty',
  30 => 'thirty',
  40 => 'forty',
  50 => 'fifty',
  60 => 'sixty',
  70 => 'seventy',
  80 => 'eighty',
  90 => 'ninety',
  100 => 'hundred',
  1000 => 'thousand',
  1000000 => 'million',
  1000000000 => 'billion',
  1000000000000 => 'trillion',
  1000000000000000 => 'quadrillion',
  1000000000000000000 => 'quintillion',
  1000000000000000000000 => 'sextillion',
  1000000000000000000000000 => 'septillion',
  1000000000000000000000000000 => 'octillion'
}

# TODO: Better way to slice out Hash?
BELOW_HUNDRED = {}
WORDS.each do | key, val |
  BELOW_HUNDRED[key] = val if key <= 100
end

def convert_int_to_words (value)
  return 'zero' if value == 0

  retWord = ''
  WORDS.reverse_each do | number, word |
    remain = value / number
    if remain >= 1
      # Auto space increment if not blank
      retWord = retWord + ' ' if retWord != ''

      if number >= 100
        if remain >= 100 && remain < 1000
          # The "hundred thousand" issue fix
          # TODO: More test to ensure it wouldn't break
          useRemain = remain
          BELOW_HUNDRED.reverse_each do | bnumber, bword |
            remain2 = useRemain / bnumber
            if BELOW_HUNDRED.has_key? remain2
              retWord = retWord + (BELOW_HUNDRED[remain2] + ' ' + bword + ' ')
              useRemain -= (remain2 * bnumber)
            end

            break if useRemain == 0
          end
          retWord = retWord + word
        else
          retWord = retWord + (WORDS[remain] + ' ' + word)
        end
        value -= (remain * number)
      else
        retWord = retWord + word
        value -= number
      end
    end

    break if value == 0
  end

  return retWord
end

if ARGV.empty?
  puts 'This prints english word of integer number provided. (Supports multi arguments)'
  puts 'Usage example:'
  puts 'ruby arabic2english.rb 1'
  puts 'ruby arabic2english.rb 11'
  puts 'ruby arabic2english.rb 100'
  puts 'ruby arabic2english.rb 1 11 100'
  exit
end

ARGV.each do | value |
  puts convert_int_to_words Integer(value) if value.is_integer?
  puts "Arument '#{value}' is invalid numeric value." unless value.is_integer?
end
