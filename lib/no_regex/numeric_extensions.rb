# frozen_string_literal: true

# Extensions for Integer class
class Integer
  def is_positive?
    self > 0
  end

  def is_negative?
    self < 0
  end

  def is_zero?
    self == 0
  end

  def is_even?
    (self % 2).zero?
  end

  def is_odd?
    !is_even?
  end

  def to_currency(symbol = "$")
    "#{symbol}#{self}"
  end

  def to_formatted
    self.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end

  def to_hex
    "0x#{self.to_s(16).upcase}"
  end

  def to_binary
    "0b#{self.to_s(2)}"
  end

  def to_words
    # Simple implementation for numbers 0-999
    return "zero" if self == 0

    ones = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    teens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
    tens = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

    num = self.abs
    result = []

    if num >= 100
      result << "#{ones[num / 100]} hundred"
      num %= 100
    end

    if num >= 20
      result << tens[num / 10]
      num %= 10
    elsif num >= 10
      result << teens[num - 10]
      num = 0
    end

    result << ones[num] if num > 0

    word = result.join(" ").strip
    self < 0 ? "negative #{word}" : word
  end
end

# Extensions for Float class
class Float
  def is_positive?
    self > 0
  end

  def is_negative?
    self < 0
  end

  def is_zero?
    self.zero?
  end

  def to_currency(symbol = "$", decimals = 2)
    "#{symbol}#{'%.2f' % self.round(decimals)}"
  end

  def to_percentage(decimals = 1)
    "#{'%.1f' % (self * 100).round(decimals)}%"
  end

  def round_to(decimals)
    (self * 10**decimals).round / 10.0**decimals
  end

  def is_integer?
    self == self.to_i
  end
end

# Extensions for NilClass
class NilClass
  def is_blank?
    true
  end

  def is_number?
    false
  end

  def is_letters?
    false
  end

  def is_email?
    false
  end
end

# Extensions for Array
class Array
  def all_numbers?
    return false if empty?
    all? { |item| item.to_s.match?(/\A-?\d+(\.\d+)?\z/) }
  end

  def all_strings?
    all? { |item| item.is_a?(String) }
  end

  def extract_numbers
    select { |item| item.to_s.match?(/\A-?\d+(\.\d+)?\z/) }.map(&:to_f)
  end

  def extract_emails
    select { |item| item.to_s.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i) }
  end
end