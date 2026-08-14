#frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseSpecificationPricing
            attr_reader :storage_overage_rate
            attr_reader :bandwidth_overage_rate
            attr_reader :replica_rate
            attr_reader :pitr_rate

            def initialize(
                storage_overage_rate:,
                bandwidth_overage_rate:,
                replica_rate:,
                pitr_rate:
            )
                @storage_overage_rate = storage_overage_rate
                @bandwidth_overage_rate = bandwidth_overage_rate
                @replica_rate = replica_rate
                @pitr_rate = pitr_rate
            end

            def self.from(map:)
                DedicatedDatabaseSpecificationPricing.new(
                    storage_overage_rate: map["storageOverageRate"],
                    bandwidth_overage_rate: map["bandwidthOverageRate"],
                    replica_rate: map["replicaRate"],
                    pitr_rate: map["pitrRate"]
                )
            end

            def to_map
                {
                    "storageOverageRate": @storage_overage_rate,
                    "bandwidthOverageRate": @bandwidth_overage_rate,
                    "replicaRate": @replica_rate,
                    "pitrRate": @pitr_rate
                }
            end
        end
    end
end
