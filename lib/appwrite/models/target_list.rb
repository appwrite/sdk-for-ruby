#frozen_string_literal: true

module Appwrite
    module Models
        class TargetList
            attr_reader :total
            attr_reader :targets

            def initialize(
                total:,
                targets:
            )
                @total = total
                @targets = targets
            end

            def self.from(map:)
                TargetList.new(
                    total: map["total"],
                    targets: map["targets"].map { |it| Target.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "targets": @targets.map { |it| it.to_map }
                }
            end
        end
    end
end