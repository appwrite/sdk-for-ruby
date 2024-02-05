#frozen_string_literal: true

module Appwrite
    module Models
        class Session
            attr_reader :id
            attr_reader :created_at
            attr_reader :user_id
            attr_reader :expire
            attr_reader :provider
            attr_reader :provider_uid
            attr_reader :provider_access_token
            attr_reader :provider_access_token_expiry
            attr_reader :provider_refresh_token
            attr_reader :ip
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
            attr_reader :current
            attr_reader :factors
            attr_reader :secret

            def initialize(
                id:,
                created_at:,
                user_id:,
                expire:,
                provider:,
                provider_uid:,
                provider_access_token:,
                provider_access_token_expiry:,
                provider_refresh_token:,
                ip:,
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
                country_name:,
                current:,
                factors:,
                secret:
            )
                @id = id
                @created_at = created_at
                @user_id = user_id
                @expire = expire
                @provider = provider
                @provider_uid = provider_uid
                @provider_access_token = provider_access_token
                @provider_access_token_expiry = provider_access_token_expiry
                @provider_refresh_token = provider_refresh_token
                @ip = ip
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
                @current = current
                @factors = factors
                @secret = secret
            end

            def self.from(map:)
                Session.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    user_id: map["userId"],
                    expire: map["expire"],
                    provider: map["provider"],
                    provider_uid: map["providerUid"],
                    provider_access_token: map["providerAccessToken"],
                    provider_access_token_expiry: map["providerAccessTokenExpiry"],
                    provider_refresh_token: map["providerRefreshToken"],
                    ip: map["ip"],
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
                    country_name: map["countryName"],
                    current: map["current"],
                    factors: map["factors"],
                    secret: map["secret"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "userId": @user_id,
                    "expire": @expire,
                    "provider": @provider,
                    "providerUid": @provider_uid,
                    "providerAccessToken": @provider_access_token,
                    "providerAccessTokenExpiry": @provider_access_token_expiry,
                    "providerRefreshToken": @provider_refresh_token,
                    "ip": @ip,
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
                    "countryName": @country_name,
                    "current": @current,
                    "factors": @factors,
                    "secret": @secret
                }
            end
        end
    end
end