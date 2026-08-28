# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabasePooler
            attr_reader :enabled
            attr_reader :mode
            attr_reader :max_connections
            attr_reader :default_pool_size
            attr_reader :port
            attr_reader :read_write_splitting
            attr_reader :pooler_cpu_request
            attr_reader :pooler_cpu_limit
            attr_reader :pooler_memory_request
            attr_reader :pooler_memory_limit

            def initialize(
                enabled:,
                mode:,
                max_connections:,
                default_pool_size:,
                port:,
                read_write_splitting:,
                pooler_cpu_request:,
                pooler_cpu_limit:,
                pooler_memory_request:,
                pooler_memory_limit:
            )
                @enabled = enabled
                @mode = mode
                @max_connections = max_connections
                @default_pool_size = default_pool_size
                @port = port
                @read_write_splitting = read_write_splitting
                @pooler_cpu_request = pooler_cpu_request
                @pooler_cpu_limit = pooler_cpu_limit
                @pooler_memory_request = pooler_memory_request
                @pooler_memory_limit = pooler_memory_limit
            end

            def self.from(map:)
                DedicatedDatabasePooler.new(
                    enabled: map["enabled"],
                    mode: map["mode"],
                    max_connections: map["maxConnections"],
                    default_pool_size: map["defaultPoolSize"],
                    port: map["port"],
                    read_write_splitting: map["readWriteSplitting"],
                    pooler_cpu_request: map["poolerCpuRequest"],
                    pooler_cpu_limit: map["poolerCpuLimit"],
                    pooler_memory_request: map["poolerMemoryRequest"],
                    pooler_memory_limit: map["poolerMemoryLimit"]
                )
            end

            def to_map
                {
                    "enabled": @enabled,
                    "mode": @mode,
                    "maxConnections": @max_connections,
                    "defaultPoolSize": @default_pool_size,
                    "port": @port,
                    "readWriteSplitting": @read_write_splitting,
                    "poolerCpuRequest": @pooler_cpu_request,
                    "poolerCpuLimit": @pooler_cpu_limit,
                    "poolerMemoryRequest": @pooler_memory_request,
                    "poolerMemoryLimit": @pooler_memory_limit
                }
            end
        end
    end
end
