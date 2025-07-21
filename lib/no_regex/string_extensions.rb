# frozen_string_literal: true

# Extensions to the String class
class String
  # Check methods - return true/false
  def is_number?
    match?(/\A\d+\z/)
  end

  def is_letters?
    match?(/\A[a-zA-Z]+\z/)
  end

  def is_alphanumeric?
    match?(/\A[a-zA-Z0-9]+\z/)
  end

  def is_email?
    match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
  end

  def is_blank?
    strip.empty?
  end

  def is_url?
    match?(/\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/)
  end

  def is_phone_number?
    match?(/\A\+?[\d\s\-\(\)]+\z/)
  end

  def is_zip_code?
    match?(/\A\d{5}(-\d{4})?\z/)
  end

  def is_hex_color?
    match?(/\A#?[0-9A-Fa-f]{6}\z/)
  end

  def is_username?
    match?(/\A[a-zA-Z0-9_\-]+\z/)
  end

  def is_decimal?
    match?(/\A\d+(\.\d+)?\z/)
  end

  def is_integer?
    match?(/\A-?\d+\z/)
  end

  def is_positive_number?
    match?(/\A[1-9]\d*\z/)
  end

  def is_uuid?
    match?(/\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/i)
  end

  def is_credit_card?
    match?(/\A\d{4}[\s\-]?\d{4}[\s\-]?\d{4}[\s\-]?\d{4}\z/)
  end

  def is_ssn?
    match?(/\A\d{3}-?\d{2}-?\d{4}\z/)
  end

  def is_ipv4?
    match?(/\A(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\z/)
  end

  def is_time_24h?
    match?(/\A(?:[01]\d|2[0-3]):[0-5]\d\z/)
  end

  def is_date_yyyy_mm_dd?
    match?(/\A\d{4}-(?:0[1-9]|1[0-2])-(?:0[1-9]|[12]\d|3[01])\z/)
  end

  def has_no_spaces?
    match?(/\A[^\s]+\z/)
  end

  def has_no_special_chars?
    match?(/\A[a-zA-Z0-9\s]+\z/)
  end

  # Manipulation methods - return modified strings
  def remove_dashes
    gsub("-", "")
  end

  def remove_spaces
    gsub(" ", "")
  end

  def remove_special_chars
    gsub(/[^a-zA-Z0-9]/, "")
  end

  def remove_numbers
    gsub(/\d/, "")
  end

  def remove_letters
    gsub(/[a-zA-Z]/, "")
  end

  def keep_numbers
    gsub(/[^\d]/, "")
  end

  def keep_letters
    gsub(/[^a-zA-Z]/, "")
  end

  def to_snake_case
    gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
      .tr("-", "_")
      .downcase
  end

  def to_camel_case
    parts = split(/[_\-\s]/)
    parts[0].downcase + parts[1..-1].map(&:capitalize).join
  end

  # Extraction methods - return arrays or other data
  def extract_numbers
    scan(/\d+/)
  end

  def extract_emails
    scan(/[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+/i)
  end

  def word_count
    split.size
  end

  def truncate(length = 30, ellipsis = "...")
    return self if self.length <= length
    self[0...(length - ellipsis.length)] + ellipsis
  end
end

