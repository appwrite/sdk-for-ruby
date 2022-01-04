#frozen_string_literal: true

module Appwrite
    module Models
        class RuntimeList
            attr_reader :sum
            attr_reader :runtimes

            def initialize(
                sum:,
                runtimes:
            )
                @sum = sum
                @runtimes = runtimes
            end

            def self.from(map:)
                RuntimeList.new(
                    sum: map["sum"],
                    runtimes: map["runtimes"].map { |it| Runtime.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "runtimes": @runtimes.map { |it| it.to_map }
                }
            end
        end
    end
end