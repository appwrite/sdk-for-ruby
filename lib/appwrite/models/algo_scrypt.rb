#frozen_string_literal: true

module Appwrite
    module Models
        class AlgoScrypt
            attr_reader :cost_cpu
            attr_reader :cost_memory
            attr_reader :cost_parallel
            attr_reader :length

            def initialize(
                cost_cpu:,
                cost_memory:,
                cost_parallel:,
                length:
            )
                @cost_cpu = cost_cpu
                @cost_memory = cost_memory
                @cost_parallel = cost_parallel
                @length = length
            end

            def self.from(map:)
                AlgoScrypt.new(
                    cost_cpu: map["costCpu"],
                    cost_memory: map["costMemory"],
                    cost_parallel: map["costParallel"],
                    length: map["length"]
                )
            end

            def to_map
                {
                    "costCpu": @cost_cpu,
                    "costMemory": @cost_memory,
                    "costParallel": @cost_parallel,
                    "length": @length
                }
            end
        end
    end
end