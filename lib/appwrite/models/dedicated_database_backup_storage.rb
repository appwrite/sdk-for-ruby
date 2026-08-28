# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseBackupStorage
            attr_reader :provider
            attr_reader :bucket
            attr_reader :region
            attr_reader :prefix
            attr_reader :endpoint

            def initialize(
                provider:,
                bucket:,
                region:,
                prefix:,
                endpoint:
            )
                @provider = provider
                @bucket = bucket
                @region = region
                @prefix = prefix
                @endpoint = endpoint
            end

            def self.from(map:)
                DedicatedDatabaseBackupStorage.new(
                    provider: map["provider"],
                    bucket: map["bucket"],
                    region: map["region"],
                    prefix: map["prefix"],
                    endpoint: map["endpoint"]
                )
            end

            def to_map
                {
                    "provider": @provider,
                    "bucket": @bucket,
                    "region": @region,
                    "prefix": @prefix,
                    "endpoint": @endpoint
                }
            end
        end
    end
end
