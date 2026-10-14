# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseSpecification
            attr_reader :slug
            attr_reader :name
            attr_reader :price
            attr_reader :storage_overage_rate
            attr_reader :bandwidth_overage_rate
            attr_reader :replica_rate
            attr_reader :pitr_rate
            attr_reader :cpu
            attr_reader :memory
            attr_reader :max_connections
            attr_reader :included_storage
            attr_reader :included_bandwidth
            attr_reader :enabled

            def initialize(
                slug:,
                name:,
                price:,
                storage_overage_rate:,
                bandwidth_overage_rate:,
                replica_rate:,
                pitr_rate:,
                cpu:,
                memory:,
                max_connections:,
                included_storage:,
                included_bandwidth:,
                enabled:
            )
                @slug = slug
                @name = name
                @price = price
                @storage_overage_rate = storage_overage_rate
                @bandwidth_overage_rate = bandwidth_overage_rate
                @replica_rate = replica_rate
                @pitr_rate = pitr_rate
                @cpu = cpu
                @memory = memory
                @max_connections = max_connections
                @included_storage = included_storage
                @included_bandwidth = included_bandwidth
                @enabled = enabled
            end

            def self.from(map:)
                DedicatedDatabaseSpecification.new(
                    slug: map["slug"],
                    name: map["name"],
                    price: map["price"],
                    storage_overage_rate: map["storageOverageRate"],
                    bandwidth_overage_rate: map["bandwidthOverageRate"],
                    replica_rate: map["replicaRate"],
                    pitr_rate: map["pitrRate"],
                    cpu: map["cpu"],
                    memory: map["memory"],
                    max_connections: map["maxConnections"],
                    included_storage: map["includedStorage"],
                    included_bandwidth: map["includedBandwidth"],
                    enabled: map["enabled"]
                )
            end

            def to_map
                {
                    "slug": @slug,
                    "name": @name,
                    "price": @price,
                    "storageOverageRate": @storage_overage_rate,
                    "bandwidthOverageRate": @bandwidth_overage_rate,
                    "replicaRate": @replica_rate,
                    "pitrRate": @pitr_rate,
                    "cpu": @cpu,
                    "memory": @memory,
                    "maxConnections": @max_connections,
                    "includedStorage": @included_storage,
                    "includedBandwidth": @included_bandwidth,
                    "enabled": @enabled
                }
            end
        end
    end
end
