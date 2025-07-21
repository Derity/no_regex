# frozen_string_literal: true

require_relative "no_regex/version"
require_relative "no_regex/string_extensions"
require_relative "no_regex/numeric_extensions"
require_relative "no_regex/pattern_methods"

# Load Rails validators if Rails is present
if defined?(Rails) || defined?(ActiveModel)
  require_relative "no_regex/rails_validators"
end

module NoRegex
  class Error < StandardError; end
end

# Load aliases after module is defined
require_relative "no_regex/aliases"

