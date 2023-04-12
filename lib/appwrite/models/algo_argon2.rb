#frozen_string_literal: true

module Appwrite
    module Models
        class AlgoArgon2
            attr_reader :type
            attr_reader :memory_cost
            attr_reader :time_cost
            attr_reader :threads

            def initialize(
                type:,
                memory_cost:,
                time_cost:,
                threads:
            )
                @type = type
                @memory_cost = memory_cost
                @time_cost = time_cost
                @threads = threads
            end

            def self.from(map:)
                AlgoArgon2.new(
                    type: map["type"],
                    memory_cost: map["memoryCost"],
                    time_cost: map["timeCost"],
                    threads: map["threads"]
                )
            end

            def to_map
                {
                    "type": @type,
                    "memoryCost": @memory_cost,
                    "timeCost": @time_cost,
                    "threads": @threads
                }
            end
        end
    end
end