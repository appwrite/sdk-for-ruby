#frozen_string_literal: true

module Appwrite
    module Models
        class Locale
            attr_reader :ip
            attr_reader :country_code
            attr_reader :country
            attr_reader :continent_code
            attr_reader :continent
            attr_reader :eu
            attr_reader :currency

            def initialize(
                ip:,
                country_code:,
                country:,
                continent_code:,
                continent:,
                eu:,
                currency:
            )
                @ip = ip
                @country_code = country_code
                @country = country
                @continent_code = continent_code
                @continent = continent
                @eu = eu
                @currency = currency
            end

            def self.from(map:)
                Locale.new(
                    ip: map["ip"],
                    country_code: map["countryCode"],
                    country: map["country"],
                    continent_code: map["continentCode"],
                    continent: map["continent"],
                    eu: map["eu"],
                    currency: map["currency"]
                )
            end

            def to_map
                {
                    "ip": @ip,
                    "countryCode": @country_code,
                    "country": @country,
                    "continentCode": @continent_code,
                    "continent": @continent,
                    "eu": @eu,
                    "currency": @currency
                }
            end
        end
    end
end