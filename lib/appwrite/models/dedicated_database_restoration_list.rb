# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseRestorationList
            attr_reader :total
            attr_reader :restorations

            def initialize(
                total:,
                restorations:
            )
                @total = total
                @restorations = restorations
            end

            def self.from(map:)
                DedicatedDatabaseRestorationList.new(
                    total: map["total"],
                    restorations: map["restorations"].map { |it| DedicatedDatabaseRestoration.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "restorations": @restorations.map { |it| it.to_map }
                }
            end
        end
    end
end
