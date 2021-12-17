#frozen_string_literal: true

module Appwrite
    module Models
        class Phone
            attr_reader :code
            attr_reader :country_code
            attr_reader :country_name

            def initialize(
                code:,
                country_code:,
                country_name:
            )
                @code = code
                @country_code = country_code
                @country_name = country_name
            end

            def self.from(map:)
                Phone.new(
                    code: map["code"],
                    country_code: map["countryCode"],
                    country_name: map["countryName"]
                )
            end

            def to_map
                {
                    "code": @code,
                    "countryCode": @country_code,
                    "countryName": @country_name
                }
            end
        end
    end
end