# frozen_string_literal: true

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
            attr_reader :city
            attr_reader :time_zone
            attr_reader :postal_code
            attr_reader :latitude
            attr_reader :longitude
            attr_reader :autonomous_system_number
            attr_reader :autonomous_system_organization
            attr_reader :isp
            attr_reader :connection_type
            attr_reader :connection_usage_type
            attr_reader :connection_organization

            def initialize(
                ip:,
                country_code:,
                country:,
                continent_code:,
                continent:,
                eu:,
                currency:,
                city:,
                time_zone:,
                postal_code:,
                latitude:,
                longitude:,
                autonomous_system_number:,
                autonomous_system_organization:,
                isp:,
                connection_type:,
                connection_usage_type:,
                connection_organization:
            )
                @ip = ip
                @country_code = country_code
                @country = country
                @continent_code = continent_code
                @continent = continent
                @eu = eu
                @currency = currency
                @city = city
                @time_zone = time_zone
                @postal_code = postal_code
                @latitude = latitude
                @longitude = longitude
                @autonomous_system_number = autonomous_system_number
                @autonomous_system_organization = autonomous_system_organization
                @isp = isp
                @connection_type = connection_type
                @connection_usage_type = connection_usage_type
                @connection_organization = connection_organization
            end

            def self.from(map:)
                Locale.new(
                    ip: map["ip"],
                    country_code: map["countryCode"],
                    country: map["country"],
                    continent_code: map["continentCode"],
                    continent: map["continent"],
                    eu: map["eu"],
                    currency: map["currency"],
                    city: map["city"],
                    time_zone: map["timeZone"],
                    postal_code: map["postalCode"],
                    latitude: map["latitude"],
                    longitude: map["longitude"],
                    autonomous_system_number: map["autonomousSystemNumber"],
                    autonomous_system_organization: map["autonomousSystemOrganization"],
                    isp: map["isp"],
                    connection_type: map["connectionType"],
                    connection_usage_type: map["connectionUsageType"],
                    connection_organization: map["connectionOrganization"]
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
                    "currency": @currency,
                    "city": @city,
                    "timeZone": @time_zone,
                    "postalCode": @postal_code,
                    "latitude": @latitude,
                    "longitude": @longitude,
                    "autonomousSystemNumber": @autonomous_system_number,
                    "autonomousSystemOrganization": @autonomous_system_organization,
                    "isp": @isp,
                    "connectionType": @connection_type,
                    "connectionUsageType": @connection_usage_type,
                    "connectionOrganization": @connection_organization
                }
            end
        end
    end
end
