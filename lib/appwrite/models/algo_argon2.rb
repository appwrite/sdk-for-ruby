#frozen_string_literal: true

module Appwrite
    module Models
        class AlgoArgon2
            attr_reader :memory_cost
            attr_reader :time_cost
            attr_reader :threads

            def initialize(
                memory_cost:,
                time_cost:,
                threads:
            )
                @memory_cost = memory_cost
                @time_cost = time_cost
                @threads = threads
            end

            def self.from(map:)
                AlgoArgon2.new(
                    memory_cost: map["memoryCost"],
                    time_cost: map["timeCost"],
                    threads: map["threads"]
                )
            end

            def to_map
                {
                    "memoryCost": @memory_cost,
                    "timeCost": @time_cost,
                    "threads": @threads
                }
            end
        end
    end
end