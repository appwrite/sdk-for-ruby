# frozen_string_literal: true

module Appwrite
    module Models
        class Specification
            attr_reader :memory
            attr_reader :cpus
            attr_reader :enabled
            attr_reader :slug

            def initialize(
                memory:,
                cpus:,
                enabled:,
                slug:
            )
                @memory = memory
                @cpus = cpus
                @enabled = enabled
                @slug = slug
            end

            def self.from(map:)
                map = { "memory" => 0, "cpus" => 0, "enabled" => false, "slug" => "" }.merge(map)
                Specification.new(
                    memory: map["memory"],
                    cpus: map["cpus"],
                    enabled: map["enabled"],
                    slug: map["slug"]
                )
            end

            def to_map
                {
                    "memory": @memory,
                    "cpus": @cpus,
                    "enabled": @enabled,
                    "slug": @slug
                }
            end
        end
    end
end
