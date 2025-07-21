# NoRegex

Write Ruby without regex! A gem that provides simple, readable methods to replace complex regular expressions for string validation and manipulation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'no_regex'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install no_regex
```

## Usage

NoRegex extends Ruby's String, Integer, Float, and other classes with intuitive methods that eliminate the need for regex:

### String Methods

```ruby
require 'no_regex'

# Validation methods - return true/false
"12345".is_number?                    # => true
"test@example.com".is_email?          # => true
"https://example.com".is_url?         # => true
"john_doe".is_username?               # => true

# Manipulation methods - return modified strings
"hello-world".remove_dashes           # => "helloworld"
"abc123xyz".keep_numbers              # => "123"
"HelloWorld".to_snake_case            # => "hello_world"

# Extraction methods - return arrays
"Contact: test@example.com".extract_emails  # => ["test@example.com"]
"Price: $123".extract_numbers               # => ["123"]
```

### Numeric Methods

```ruby
42.is_positive?                       # => true
123.to_currency                       # => "$123"
3.14.to_percentage                    # => "314.0%"
```

## Rails Integration

### Using Format Validations in Rails

To use the `format: { with: is_number? }` syntax in your Rails models or form objects, you need to extend your class with `NoRegex::PatternMethods`:

```ruby
class User < ApplicationRecord
extend NoRegex::PatternMethods

validates :email, format: { with: is_email? }
validates :phone, format: { with: is_phone_number? }
end
```

For form objects:
```ruby
class MyFormObject
include ActiveModel::Model
extend NoRegex::PatternMethods

validates :search_term, format: { with: is_number? }
end
```

This makes all the pattern methods available to your validations. Once extended, you can use any of the validation methods shown below.

### All Available Format Validators

```ruby
validates :field, format: { with: is_number? }          # Only digits
validates :field, format: { with: is_letters? }         # Only letters
validates :field, format: { with: is_alphanumeric? }    # Letters and numbers
validates :field, format: { with: is_email? }           # Email format
validates :field, format: { with: is_phone_number? }    # Phone format
validates :field, format: { with: is_url? }             # URL format
validates :field, format: { with: is_zip_code? }        # ZIP code
validates :field, format: { with: is_hex_color? }       # Hex colors
validates :field, format: { with: is_username? }        # Usernames
validates :field, format: { with: is_decimal? }         # Decimals
validates :field, format: { with: is_integer? }         # Integers
validates :field, format: { with: is_positive_number? } # Positive numbers
validates :field, format: { with: is_uuid? }            # UUIDs
validates :field, format: { with: is_credit_card? }     # Credit cards
validates :field, format: { with: is_ssn? }             # SSN format
validates :field, format: { with: is_ipv4? }            # IP addresses
validates :field, format: { with: is_time_24h? }        # 24-hour time
validates :field, format: { with: is_date_yyyy_mm_dd? } # YYYY-MM-DD dates
```

### Custom Validators (Alternative Approach)

```ruby
class User < ApplicationRecord
validates :phone, number: true
validates :name, letters: { message: "can only contain letters" }
validates :username, alphanumeric: true
validates :email, email_format: true
validates :website, url_format: { allow_blank: true }
end
```

## Available Methods

### Validation Methods

- `is_number?` - Check if string contains only numbers
- `is_letters?` - Check if string contains only letters
- `is_alphanumeric?` - Check if string contains only letters and numbers
- `is_email?` - Check if string is a valid email format
- `is_blank?` - Check if string is nil or contains only whitespace
- `is_url?` - Check if string is a valid URL format
- `is_phone_number?` - Check if string is a valid phone number
- `is_zip_code?` - Check if string is a valid ZIP code
- `is_hex_color?` - Check if string is a valid hex color
- `is_username?` - Check if string is a valid username (letters, numbers, _, -)
- `is_decimal?` - Check if string is a decimal number
- `is_integer?` - Check if string is an integer
- `is_positive_number?` - Check if string is a positive number
- `is_uuid?` - Check if string is a valid UUID
- `is_credit_card?` - Check if string is a valid credit card number
- `is_ssn?` - Check if string is a valid SSN
- `is_ipv4?` - Check if string is a valid IPv4 address
- `is_time_24h?` - Check if string is valid 24-hour time format
- `is_date_yyyy_mm_dd?` - Check if string is valid YYYY-MM-DD date format

### Manipulation Methods

- `remove_dashes` - Remove all dashes from string
- `remove_spaces` - Remove all spaces from string
- `remove_special_chars` - Remove all special characters, keeping only letters and numbers
- `remove_numbers` - Remove all numbers from string
- `remove_letters` - Remove all letters from string
- `keep_numbers` - Keep only numbers in string
- `keep_letters` - Keep only letters in string

### Conversion Methods

- `to_snake_case` - Convert string to snake_case
- `to_camel_case` - Convert string to camelCase

### Extraction Methods

- `extract_numbers` - Extract all numbers from string (returns array)
- `extract_emails` - Extract all email addresses from string (returns array)

### Utility Methods

- `word_count` - Count words in string
- `truncate(length, ellipsis)` - Truncate string to specified length with ellipsis

## Examples

```ruby
# Validation
"12345".is_number?                    # => true
"abc123".is_letters?                  # => false
"test@example.com".is_email?          # => true
"https://example.com".is_url?         # => true

# Manipulation
"hello-world-123".remove_dashes       # => "helloworld123"
"hello world 123".remove_numbers      # => "hello world "
"abc123xyz".keep_numbers              # => "123"
"abc123xyz".keep_letters              # => "abcxyz"
"Hello@World#123!".remove_special_chars # => "HelloWorld123"

# Conversion
"HelloWorld".to_snake_case            # => "hello_world"
"hello_world".to_camel_case           # => "helloWorld"

# Extraction
"Contact: test@example.com or admin@site.org".extract_emails
# => ["test@example.com", "admin@site.org"]

"Price is $123 or $456".extract_numbers  # => ["123", "456"]

# Utilities
"Hello world, this is a test".word_count  # => 6
"This is a very long string".truncate(15)  # => "This is a ve..."

# Numeric Methods
42.is_positive?                       # => true
-10.is_negative?                      # => true
100.to_currency                       # => "$100"
1234.to_formatted                     # => "1,234"
0.75.to_percentage                    # => "75.0%"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Derity/no_regex

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).