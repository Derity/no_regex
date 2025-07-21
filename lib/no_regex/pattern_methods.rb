# frozen_string_literal: true

module NoRegex
  module PatternMethods
    # Define methods that return regex patterns
    #
    def is_number?
      # Examples: "123", "-456", "12.34", "-0.5", "0", "999.99"
      /\A-?\d+(\.\d+)?\z/
    end

    def is_letters?
      # Examples: "hello", "World", "ABC"
      /\A[a-zA-Z]+\z/
    end

    def is_alphanumeric?
      # Examples: "abc123", "Test99", "2024Year"
      /\A[a-zA-Z0-9]+\z/
    end

    def is_email?
      # Examples: "user@example.com", "john.doe+tag@company.co.uk"
      /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    end

    def is_url?
      # Examples: "https://example.com", "www.site.org", "subdomain.example.com/path"
      /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/
    end

    def is_phone_number?
      # Examples: "+1 555-123-4567", "555 123 4567", "(555) 123-4567"
      /\A\+?[\d\s\-\(\)]+\z/
    end

    def is_zip_code?
      # Examples: "12345", "12345-6789"
      /\A\d{5}(-\d{4})?\z/
    end

    def is_hex_color?
      # Examples: "#FF5733", "FF5733", "#00ff00"
      /\A#?[0-9A-Fa-f]{6}\z/
    end

    def is_username?
      # Examples: "john_doe", "user123", "test-user"
      /\A[a-zA-Z0-9_\-]+\z/
    end

    def is_decimal?
      # Examples: "123.45", "0.5", "100"
      /\A\d+(\.\d+)?\z/
    end

    def is_integer?
      # Examples: "123", "-456", "0"
      /\A-?\d+\z/
    end

    def is_positive_number?
      # Examples: "1", "123", "999"
      /\A[1-9]\d*\z/
    end

    def is_uuid?
      # Examples: "550e8400-e29b-41d4-a716-446655440000", "123e4567-e89b-12d3-a456-426614174000"
      /\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/i
    end

    def is_credit_card?
      # Examples: "1234567812345678", "1234 5678 1234 5678", "1234-5678-1234-5678"
      /\A\d{4}[\s\-]?\d{4}[\s\-]?\d{4}[\s\-]?\d{4}\z/
    end

    def is_ssn?
      # Examples: "123-45-6789", "123456789"
      /\A\d{3}-?\d{2}-?\d{4}\z/
    end

    def is_ipv4?
      # Examples: "192.168.1.1", "10.0.0.255", "8.8.8.8"
      /\A(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\z/
    end

    def is_time_24h?
      # Examples: "14:30", "09:45", "23:59"
      /\A(?:[01]\d|2[0-3]):[0-5]\d\z/
    end

    def is_date_yyyy_mm_dd?
      # Examples: "2024-01-15", "2023-12-31", "2022-06-01"
      /\A\d{4}-(?:0[1-9]|1[0-2])-(?:0[1-9]|[12]\d|3[01])\z/
    end

    def has_no_spaces?
      # Examples: "hello", "test123", "no-spaces-here"
      /\A[^\s]+\z/
    end

    def has_no_special_chars?
      # Examples: "Hello World", "Test 123", "abc"
      /\A[a-zA-Z0-9\s]+\z/
    end
  end
end

# Make these methods available at the top level
extend NoRegex::PatternMethods