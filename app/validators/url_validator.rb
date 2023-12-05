require "uri"

class UrlValidator < ActiveModel::EachValidator

    def self.compliant?(value)
      if value.blank?
        return true
      end
      uri = URI.parse(value)
      uri.is_a?(URI::HTTP) && uri.host.present?
    rescue URI::InvalidURIError
      false
    end
  
    def validate_each(record, attribute, value)
      unless value.blank? || self.class.compliant?(value)
        record.errors.add(attribute, "is not a valid HTTP URL")
      end
    end
  
  end