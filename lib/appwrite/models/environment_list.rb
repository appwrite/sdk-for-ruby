# frozen_string_literal: true

module Appwrite
    module Models
        class EnvironmentList
            attr_reader :total
            attr_reader :environments

            def initialize(
                total:,
                environments:
            )
                @total = total
                @environments = environments
            end

            def self.from(map:)
                map = { "total" => 0, "environments" => [] }.merge(map)
                EnvironmentList.new(
                    total: map["total"],
                    environments: map["environments"].map { |it| Environment.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "environments": @environments.map { |it| it.to_map }
                }
            end
        end
    end
end
