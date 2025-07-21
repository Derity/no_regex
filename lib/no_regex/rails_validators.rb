# frozen_string_literal: true

# Custom validators for Rails
if defined?(ActiveModel)
  module NoRegex
    # Base validator class
    class BaseValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return if value.blank? && options[:allow_blank]
        return if value.nil? && options[:allow_nil]

        unless value.to_s.send(validation_method)
          record.errors.add(attribute, options[:message] || default_message)
        end
      end

      private

      def validation_method
        raise NotImplementedError
      end

      def default_message
        raise NotImplementedError
      end
    end

    # Validator for checking if a value contains only numbers
    class NumberValidator < BaseValidator
      private
      def validation_method; :is_number?; end
      def default_message; "must be a number"; end
    end

    # Validator for checking if a value contains only letters
    class LettersValidator < BaseValidator
      private
      def validation_method; :is_letters?; end
      def default_message; "must contain only letters"; end
    end

    # Validator for checking if a value is alphanumeric
    class AlphanumericValidator < BaseValidator
      private
      def validation_method; :is_alphanumeric?; end
      def default_message; "must contain only letters and numbers"; end
    end

    # Validator for email format
    class EmailFormatValidator < BaseValidator
      private
      def validation_method; :is_email?; end
      def default_message; "must be a valid email address"; end
    end

    # Validator for URL format
    class UrlFormatValidator < BaseValidator
      private
      def validation_method; :is_url?; end
      def default_message; "must be a valid URL"; end
    end

    # Validator for phone number format
    class PhoneNumberValidator < BaseValidator
      private
      def validation_method; :is_phone_number?; end
      def default_message; "must be a valid phone number"; end
    end

    # Validator for username format
    class UsernameValidator < BaseValidator
      private
      def validation_method; :is_username?; end
      def default_message; "can only contain letters, numbers, underscores and hyphens"; end
    end
  end
end