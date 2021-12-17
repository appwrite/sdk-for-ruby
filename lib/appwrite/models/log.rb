#frozen_string_literal: true

module Appwrite
    module Models
        class Log
            attr_reader :event
            attr_reader :ip
            attr_reader :time
            attr_reader :os_code
            attr_reader :os_name
            attr_reader :os_version
            attr_reader :client_type
            attr_reader :client_code
            attr_reader :client_name
            attr_reader :client_version
            attr_reader :client_engine
            attr_reader :client_engine_version
            attr_reader :device_name
            attr_reader :device_brand
            attr_reader :device_model
            attr_reader :country_code
            attr_reader :country_name

            def initialize(
                event:,
                ip:,
                time:,
                os_code:,
                os_name:,
                os_version:,
                client_type:,
                client_code:,
                client_name:,
                client_version:,
                client_engine:,
                client_engine_version:,
                device_name:,
                device_brand:,
                device_model:,
                country_code:,
                country_name:
            )
                @event = event
                @ip = ip
                @time = time
                @os_code = os_code
                @os_name = os_name
                @os_version = os_version
                @client_type = client_type
                @client_code = client_code
                @client_name = client_name
                @client_version = client_version
                @client_engine = client_engine
                @client_engine_version = client_engine_version
                @device_name = device_name
                @device_brand = device_brand
                @device_model = device_model
                @country_code = country_code
                @country_name = country_name
            end

            def self.from(map:)
                Log.new(
                    event: map["event"],
                    ip: map["ip"],
                    time: map["time"],
                    os_code: map["osCode"],
                    os_name: map["osName"],
                    os_version: map["osVersion"],
                    client_type: map["clientType"],
                    client_code: map["clientCode"],
                    client_name: map["clientName"],
                    client_version: map["clientVersion"],
                    client_engine: map["clientEngine"],
                    client_engine_version: map["clientEngineVersion"],
                    device_name: map["deviceName"],
                    device_brand: map["deviceBrand"],
                    device_model: map["deviceModel"],
                    country_code: map["countryCode"],
                    country_name: map["countryName"]
                )
            end

            def to_map
                {
                    "event": @event,
                    "ip": @ip,
                    "time": @time,
                    "osCode": @os_code,
                    "osName": @os_name,
                    "osVersion": @os_version,
                    "clientType": @client_type,
                    "clientCode": @client_code,
                    "clientName": @client_name,
                    "clientVersion": @client_version,
                    "clientEngine": @client_engine,
                    "clientEngineVersion": @client_engine_version,
                    "deviceName": @device_name,
                    "deviceBrand": @device_brand,
                    "deviceModel": @device_model,
                    "countryCode": @country_code,
                    "countryName": @country_name
                }
            end
        end
    end
end