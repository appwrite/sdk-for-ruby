#frozen_string_literal: true

module Appwrite
    module Models
        class RuntimeList
            attr_reader :total
            attr_reader :runtimes

            def initialize(
                total:,
                runtimes:
            )
                @total = total
                @runtimes = runtimes
            end

            def self.from(map:)
                RuntimeList.new(
                    total: map["total"],
                    runtimes: map["runtimes"].map { |it| Runtime.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "runtimes": @runtimes.map { |it| it.to_map }
                }
            end
        end
    end
end
